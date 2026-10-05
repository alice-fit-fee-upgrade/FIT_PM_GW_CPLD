#!/usr/bin/env python3
"""Prove the new EV_OUT cone from raw AND/OR fuses, not rendered equations."""
import json,os
from pathlib import Path
import z3 as z
from jedlib import read
R=Path(__file__).resolve().parent.parent
ir=json.loads(Path(os.environ.get('CPLD_PROOF_IR',str(R/'decoded/readback-2026/original.json'))).read_text());fuses=read(Path(os.environ.get('CPLD_PROOF_JED',str(R/'original/readback-2026/pm_cpld_gold_2026.jed'))))['fuses']
base=0;bases={};lookup={}
for f in ir['function_blocks']:
 bases[f['index']]=base
 base+=6496+sum(29 if 'IBUF_MODE' in m['configuration'] else 16 for m in f['macrocells'])
 for m in f['macrocells']:lookup[m['resource']]=(f,m)
assert base==55316
q={r:z.Bool(r) for r in lookup};pads={i:z.Bool('P'+str(i)) for i in range(1,101)}
def src(s):
 if s=='VCC':return z.BoolVal(True)
 if s=='GND':return z.BoolVal(False)
 kind,r=s.split('_',1);f,m=lookup[r];c=m['configuration']
 if kind=='IOB':return q[r] if c['IOB_ZIA_MUX']=='REG' else pads[m['pin']]
 if c['MC_ZIA_MUX']=='REG':return q[r]
 if c['MC_ZIA_MUX']=='XOR':return xor(f,m)
 raise ValueError(s)
def pt(f,t):
 addr=bases[f['index']]+1120+80*t;l=[]
 for i in range(40):
  if not fuses[addr+2*i]:l.append(src(f['zia'][i]))
  if not fuses[addr+2*i+1]:l.append(z.Not(src(f['zia'][i])))
 return z.And(*l)
def xor(f,m):
 i=m['index']-1;addr=bases[f['index']]+5600
 term=z.Or(*[pt(f,t) for t in range(56) if not fuses[addr+16*t+i]])
 mode=m['configuration']['XOR_MUX'];other={'GND':lambda:z.BoolVal(False),'VCC':lambda:z.BoolVal(True),'PT':lambda:pt(f,10+3*i),'PT_INV':lambda:z.Not(pt(f,10+3*i))}[mode]()
 return z.Xor(term,other)
f,m=next((f,m) for f in ir['function_blocks'] for m in f['macrocells'] if m['pin']==16)
assert m['configuration']['OE_MUX']=='VCC' and m['configuration']['MC_IOB_MUX']=='XOR'
out=xor(f,m);solver=z.Solver();solver.add(out!=pads[60]);result=solver.check();assert result==z.unsat
old=json.loads((R/'decoded/previous-input/original.json').read_text());old16=next(m for f in old['function_blocks'] for m in f['macrocells'] if m['pin']==16)
assert old16['configuration']['MC_IOB_MUX']=='REG' and old16['configuration']['REG_INIT']=='0'
report={'property':'new P16 EV_OUT = P60 EV_IN for all Boolean inputs/states','SAT_result':str(result),'verified_from_raw_AND_OR_fuses':True,'old_P16_is_registered':True,'logical_counterexample':{'condition':'EV_IN changes 0 to 1 between CLK80 edges, old EVOUT previously 0','new_EV_OUT':1,'baseline_EV_OUT':0},'limit':'Ideal Boolean configuration model; not physical timing or readback-export validation'}
(R/'tests/readback-2026-ev-proof.json').write_text(json.dumps(report,indent=2)+'\n');print(json.dumps(report,indent=2))
