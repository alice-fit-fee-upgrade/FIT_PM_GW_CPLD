#!/usr/bin/env python3
import json,sys
from pathlib import Path
R=Path(__file__).resolve().parent.parent
directory=Path(sys.argv[1]).resolve() if len(sys.argv)>1 else R/'decoded/previous-input'
x=json.loads((directory/'original.json').read_text()); names=json.loads((directory/'state_map.json').read_text()) if (directory/'state_map.json').exists() else {}
pins={p['pin']:p for p in json.loads((R/'decoded/pinout.json').read_text())}
ls=['XC2C128 golden configuration; FB/MC numbering is 1-based.','Decoder: '+x['decoder'],'Security bits are outside this logical JEDEC representation.','Global configuration:']
ls += ['  '+k+': '+v for k,v in x['globals'].items()]
for f in x['function_blocks']:
 ls.append('\nFB'+str(f['index'])+' ZIA:')
 ls += [f'  row {i}: {s}' for i,s in enumerate(f['zia'])]
 for m in f['macrocells']:
  c=m['configuration'];pin=m['pin'];ls += [f"\nFB{f['index']}/MC{m['index']} ({m['resource']}):",f"  used: {m['used']} (configured sinks/routing; not full cone-of-influence)",f"  pin: {pin}, net: {pins[pin]['net'] if pin else 'buried'}, recovered name: {names.get(m['resource'],'—')}",f"  equation: {m['equation']}",f"  registered: {m['registered']}; mode: {c['REG_MODE']}; init: {c['REG_INIT']}",f"  register input: {m['data_equation']}",f"  clock: {m['clock_equation']}; polarity: {'falling' if c['CLK_INV']=='1' else 'rising'}; DDR: {c['CLK_DDR']}",f"  CE: {m['ce_equation']}; reset: {m['reset_equation']}; set: {m['set_equation']}"]
  ls += ['  '+k+': '+v for k,v in c.items() if k.startswith(('IOB','IBUF','MC_IOB','OE_','DGE'))]
 ls.append('\nAll product terms:');ls += [f'  PT{i}: {e}' for i,e in enumerate(f['and_equations'])]
(directory/'original.txt').write_text('\n'.join(ls)+'\n')
