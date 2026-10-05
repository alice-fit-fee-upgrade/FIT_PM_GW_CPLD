#!/usr/bin/env python3
"""Refresh the experiment index without hiding failed builds or proof attempts."""
import hashlib,json
from pathlib import Path
R=Path(__file__).resolve().parent.parent
commands=[json.loads(s) for s in (R/'experiments/commands.jsonl').read_text().splitlines()]
data=[]
for f in sorted((R/'experiments/matching-2026').glob('*/experiment.json')):
 x=json.loads(f.read_text());x['commands']=[r for r in commands if r.get('cwd')==str(f.parent.resolve())];x['source_ucf_sha256']=hashlib.sha256((f.parent/'source.ucf').read_bytes()).hexdigest();f.write_text(json.dumps(x,indent=2)+'\n');data.append(x)
(R/'reports/readback-2026/matching_experiments.json').write_text(json.dumps(data,indent=2)+'\n')
lines=['# Native ISE matching experiments','','Source snapshots, fitter reports, JED, raw/canonical diffs and proof attempts are preserved in experiments/matching-2026. Technology variants are diagnostic architecture transcriptions, not recovered historical source.','','| Variant | Build exit | SAT exit | Fuse diff | Canonical diff |','|---|---:|---:|---:|---:|']
for x in data:lines.append('| '+x['name']+' | '+str(x['build_exit'])+' | '+str(x.get('aliased_proof_exit',x.get('proof_exit','—')))+' | '+str(x.get('raw_distance','—'))+' | '+str(x.get('canonical_difference_count','—'))+' |')
lines+=['','Speed fitter initially gave 380; explicit golden cal_sample clear condition gives 346. PERIOD/MAXDELAY adds no change. ZIA, MC/IOB fields, globals and state placement match. Only FB1/FB2 AND/OR differ. FB2 literal covers match after PT permutation; Only the highest counter bit has a different literal cover in the current build. Details: experiments/ise-readback-2026/pt-allocation.json.','','Failed speed-nested-tff build was caused by editing a running shell script: resumed reading hit a changed byte offset. Retry passed. Use atomic file replacement or edit between builds. REG="T" is invalid; REG="TFF" is accepted. Undocumented WEMAP/NO_OPTX variables are diagnostic only; no CR-II effect established. Renaming cases initially failed proof name lookup; explicit aliases subsequently gave 49/49 proofs, original failed logs preserved.','','To reproduce an individual experiment, use its preserved source.vhd/source.ucf, commands recorded in experiment.json and tools/match_experiment.py with a fresh experiment name. Earlier default density versus current speed is explicitly recorded in cpldfit argv.']
(R/'reports/readback-2026/matching_experiments.md').write_text('\n'.join(lines)+'\n')
