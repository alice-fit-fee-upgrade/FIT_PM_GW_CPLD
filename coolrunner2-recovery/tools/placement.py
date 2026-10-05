#!/usr/bin/env python3
import json,re
from pathlib import Path
R=Path(__file__).resolve().parent.parent
mapping=json.loads((R/'decoded/previous-input/state_map.json').read_text());lines=['# Candidate ISE CPLD LOC constraints; unvalidated without ISE.', '# NET constraints require preserved synthesis net names; check fitter warnings.']
for resource,name in mapping.items():
 _,f,m=re.fullmatch(r'C(\d+)B(\d+)MC(\d+)',resource).groups()
 if name.startswith(('O_','CNT_')) or name in ('CLK20_N_reg','EVOUT','dly_7'):continue
 match=re.fullmatch(r'(c_count|dly|evnt_i)_(\d+)',name)
 net=f'{match[1]}<{match[2]}>' if match else name
 lines.append(f'NET "{net}" LOC = "FB{int(f)+1}_{int(m)+1}"; # {resource}')
(R/'recovered/previous-input/placement_candidate.ucf').write_text('\n'.join(lines)+'\n')
