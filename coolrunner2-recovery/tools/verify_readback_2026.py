#!/usr/bin/env python3
"""All-register transition proof against a readable recovered architecture."""
from prove_readback_2026 import *
names={};expected={};events={}
relocation={}
fit_mode='CPLD_PROOF_IR' in os.environ
if fit_mode:
 import re
 proof_build=Path(os.environ.get('CPLD_PROOF_BUILD',str(R/'experiments/ise-readback-2026')))
 text=(proof_build/'design.rpt').read_text()
 by_name={}
 for line in text.splitlines():
  match=re.match(r'^(\S+)\s+.*?\bFB(\d+)_(\d+)\b.*?\b(?:DFF|DEFF|TFF)(?:/[SR])?\b',line)
  if match:by_name[match[1]]=f'C0B{int(match[2])-1}MC{int(match[3])-1}'
 mapping=json.loads((R/'decoded/readback-2026/state_map.json').read_text())
 for resource,name in mapping.items():
  if name.startswith('O_'):net='DOUT<'+name[2:]+'>'
  elif name.startswith('CNT_'):net='CLK40' if name=='CNT_0' else 'CLK20_P'
  elif name=='clk20n_reg':net='CLK20_N'
  elif name=='dv_reg':net='DV'
  else:
   match=re.fullmatch(r'(c_count|dly|raw_sync|inhibit_pipe)_(\d+)',name)
   net=match[1]+'<'+match[2]+'>' if match else name
  aliases=json.loads(os.environ.get("CPLD_PROOF_ALIASES","{}"))
  base=net.split("<",1)[0]
  net=aliases.get(base,base)+net[len(base):]
  relocation[resource]=by_name[net]
def reg(r,name,clock='FCLK2',falling=False):
 r=relocation.get(r,r)
 names[r]=name;events[r]=(clock,falling);return q[r]
def put(v,e):expected[next(r for r in names if q[r].eq(v))]=e
cnt=[reg('C0B6MC5','CNT_0',falling=True),reg('C0B7MC1','CNT_1',falling=True)]
clkn=reg('C0B5MC15','clk20n_reg',falling=True)
strdiv=reg('C0B5MC0','str_div','IOB_C0B5MC1',True)
rawtog=reg('C0B2MC7','raw_str_toggle','IOB_C0B5MC1',True)
str1=reg('C0B1MC12','str1',falling=True);str2=reg('C0B2MC9','str2')
dly=[reg(r,'dly_'+str(i)) for i,r in enumerate(['C0B2MC8','C0B1MC10','C0B1MC5','C0B1MC4','C0B1MC2','C0B1MC1','C0B2MC11'])]
dv=reg('C0B6MC10','dv_reg')
sync=[reg(r,'raw_sync_'+str(i)) for i,r in enumerate(['C0B1MC11','C0B1MC9','C0B1MC8'])]
edge=reg('C0B1MC7','raw_edge');stretch=reg('C0B1MC6','raw_stretch')
hold=[reg(r,'inhibit_pipe_'+str(i)) for i,r in enumerate(['C0B1MC0','C0B0MC4','C0B1MC14','C0B1MC13'])]
count=[reg('C0B0MC'+str(j),'c_count_'+str(i)) for i,j in enumerate([13,9,8,10,11,12,14,15,1,6])]
cal=reg('C0B0MC7','cal_phase');sample=reg('C0B1MC15','cal_sample')
dout=[reg(r,'O_'+str(i)) for i,r in enumerate(['C0B2MC3','C0B2MC4','C0B2MC5','C0B2MC6','C0B2MC10','C0B2MC12','C0B2MC13','C0B2MC14','C0B2MC15','C0B6MC15','C0B6MC14','C0B6MC13','C0B6MC12'])]
restart=z.And(cnt[0],z.And(*count),z.Not(z.Or(*hold)),cal==cnt[1]);inc=z.And(*cnt,z.Not(z.And(*count)))
for i,v in enumerate(count):put(v,z.If(restart,False,z.If(inc,z.Xor(v,z.And(*count[:i])),v)))
put(cal,z.If(restart,z.Not(cal),cal));put(sample,z.If(z.Not(cnt[0]),False,z.If(restart,True,sample)))
put(cnt[0],z.Not(cnt[0]));put(cnt[1],z.Xor(cnt[1],cnt[0]));put(clkn,z.Not(z.Xor(*cnt)))
put(strdiv,z.Xor(strdiv,pads[64]));put(rawtog,z.Not(rawtog));put(str1,z.If(z.Not(cnt[0]),strdiv,str1));put(str2,str1)
put(dly[0],z.Xor(str1,str2))
for i in range(1,7):put(dly[i],dly[i-1])
put(sync[0],rawtog);put(sync[1],sync[0]);put(sync[2],sync[1]);put(edge,z.Xor(sync[1],sync[2]));put(stretch,z.If(z.Not(cnt[0]),z.Or(edge,z.Xor(sync[1],sync[2])),stretch))
for i,v in enumerate(hold):put(v,z.If(z.Not(cnt[0]),stretch if i==0 else hold[i-1],v))
en=z.Or(dly[6],sample);put(dv,en)
ap=[35,34,33,32,30,29,28,23,24,22,19,18];bp=[52,50,49,46,44,43,42,41,40,39,37,36]
for i,v in enumerate(dout):put(v,z.If(en,z.If(cnt[1],pads[ap[i]],pads[bp[i]]) if i<12 else z.Not(cnt[1]),v))
assert set(expected)=={r for r,(f,m) in lookup.items() if m['registered']}
results=[]
for r,e in expected.items():
 f,m=lookup[r];c=m['configuration'];j=m['index']-1
 assert c['RST_MUX']==c['SET_MUX']=='GND' and c['CLK_DDR']=='0'
 real=pads[m['pin']] if c.get('REG_D_MUX')=='IBUF' else xor(f,m)
 if c['REG_MODE']=='TFF':real=z.Xor(q[r],real)
 elif c['REG_MODE']=='DFFCE':real=z.If(pt(f,10+3*j),real,q[r])
 solver=z.Solver();solver.add(real!=e);status=solver.check()
 initial=int(c['REG_INIT'])==(0 if names[r]=='clk20n_reg' else 1)
 clock=(m['clock_equation'],c['CLK_INV']=='1')==events[r]
 results.append(dict(resource=r,name=names[r],SAT_result=str(status),initial_matches=initial,clock_matches=clock,counterexample=str(solver.model()) if status==z.sat else None))
passed=all(t['SAT_result']=='unsat' and t['initial_matches'] and t['clock_matches'] for t in results)
(proof_build/'state_map.json' if fit_mode else R/'decoded/readback-2026/state_map.json').write_text(json.dumps(names,indent=2,sort_keys=True)+'\n')
(proof_build/'transition-proof.json' if fit_mode else R/'tests/readback-2026/transition-proof.json').write_text(json.dumps(dict(all_passed=passed,register_count=len(results),registers=results,vhdl_frontend_formal_verified=False),indent=2)+'\n')
print(f'New golden transition proof: {sum(t["SAT_result"]=="unsat" for t in results)}/{len(results)} UNSAT; init/clocks/all_passed={passed}')
if not passed:print(json.dumps([t for t in results if t['SAT_result']!='unsat' or not t['clock_matches'] or not t['initial_matches']],indent=2))
raise SystemExit(0 if passed else 1)
