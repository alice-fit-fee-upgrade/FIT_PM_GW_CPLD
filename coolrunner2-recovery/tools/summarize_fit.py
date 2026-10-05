#!/usr/bin/env python3
"""Summarize a real ISE build against golden, without equating raw distance to function."""
import collections,json,sys
from pathlib import Path
R=Path(__file__).resolve().parent.parent
mode=sys.argv[1];b=Path(sys.argv[3]) if len(sys.argv)>3 else R/'experiments'/f'ise-{mode}'
gold=json.loads((Path(sys.argv[2]) if len(sys.argv)>2 else R/'decoded/original.json').read_text());candidate=json.loads((b/'configuration.json').read_text())
raw=json.loads((b/'raw-diff.json').read_text());diff=json.loads((b/'structural-diff.json').read_text())
groups=collections.Counter()
for d in diff['differences']:
 p=d['path']
 if p.startswith('/globals/'):g='global configuration'
 elif '/zia/' in p:g='ZIA routing'
 elif '/and_terms/' in p:g='PLA AND literals'
 elif '/or_terms/' in p or '/sum_terms/' in p:g='PLA OR allocation'
 elif '/configuration/' in p:g='MC/IOB configuration'
 else:g='resource usage / derived fields'
 groups[g]+=1
lines=[f'# {mode}: ISE 14.7 vs golden','',f'Raw fuse Hamming distance: **{raw["hamming_distance"]}/55341**.',f'Canonical scalar field differences: **{diff["structural_difference_count"]}**. Counts are placement-sensitive, not functional errors.','', '| Region | Changed canonical fields |','|---|---:|']
lines += [f'| {k} | {v} |' for k,v in sorted(groups.items())]
lines += ['', '| FB | Golden registers | Candidate registers | Golden enabled outputs | Candidate enabled outputs |','|---:|---:|---:|---:|---:|']
for a,c in zip(gold['function_blocks'],candidate['function_blocks']):
 lines.append(f"| {a['index']} | {sum(m['registered'] for m in a['macrocells'])} | {sum(m['registered'] for m in c['macrocells'])} | {sum(m['output_enabled'] for m in a['macrocells'])} | {sum(m['output_enabled'] for m in c['macrocells'])} |")
lines += ['', '## Global fields','', '| Field | Golden | Candidate |','|---|---|---|']
lines += [f'| {k} | {v} | {candidate["globals"].get(k)} |' for k,v in gold['globals'].items()]
lines += ['', '## Changed pin configuration','', '| Pin | Resource | Field | Golden | Candidate |','|---:|---|---|---|---|']
for a,c in zip(gold['function_blocks'],candidate['function_blocks']):
 for ma,mc in zip(a['macrocells'],c['macrocells']):
  if ma['pin'] is None:continue
  for k in sorted(ma['configuration'].keys()|mc['configuration'].keys()):
   if k.startswith(('IOB_','IBUF_','MC_IOB','OE_','DGE_')) and ma['configuration'].get(k)!=mc['configuration'].get(k):lines.append(f"| {ma['pin']} | {ma['resource']} | {k} | {ma['configuration'].get(k)} | {mc['configuration'].get(k)} |")
lines += ['', '## Evidence','',f'All fit/synthesis reports, equations and VM6: experiments/ise-{mode}/. Full structural-diff.json contains individual ZIA, AND/OR, register clock/mode/reset/init and I/O field changes. Configuration.json preserves the candidate independently.','', 'A relocated register or different PT decomposition can change many fuses. Functional equivalence must use fitter equations/net names to establish state mapping. No programming was performed.']
(b/'structural-report.md' if b!=R/'experiments'/f'ise-{mode}' else R/'reports'/('previous-input' if mode in ('baseline','recovered') else '')/f'{mode}_structural_diff.md').write_text('\n'.join(lines)+'\n')
(b/'score.json').write_text(json.dumps(dict(raw_hamming=raw['hamming_distance'],canonical_field_changes=diff['structural_difference_count'],changed_regions=groups,functional_equivalence_verified=(raw['hamming_distance']==0 and diff['structural_difference_count']==0)),indent=2)+'\n')
print(f'{mode}: raw={raw["hamming_distance"]}, canonical={diff["structural_difference_count"]}; reports/{mode}_structural_diff.md')
