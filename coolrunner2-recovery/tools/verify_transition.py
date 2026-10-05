#!/usr/bin/env python3
"""SAT proof of golden transition relations against recovered architectural model.

AND/OR equations are read directly from golden JEDEC fuse indices, independently
of canonical equation strings. Routing and configuration use Project Combine.
This proves the explicit model below, not automatically the VHDL frontend.
"""
import json, sys
from pathlib import Path
import z3 as z
from jedlib import read
ROOT=Path(__file__).resolve().parent.parent
ir=json.loads((ROOT/'decoded/previous-input/original.json').read_text())
fuses=read(ROOT/'original/amplcpld.jed')['fuses']
state={}; expected={}; names={}; pads={i:z.Bool('P'+str(i)) for i in range(1,101)}
def reg(f,m,name):
    r=f'C0B{f-1}MC{m-1}';state[r]=z.Bool(name);names[r]=name;return state[r]
count=[reg(1,m,'c_count_'+str(i)) for i,m in enumerate([2,16,15,8,10,9,7])]
dly=[reg(f,m,'dly_'+str(i)) for i,(f,m) in enumerate([(1,12),(1,5),(1,4),(1,3),(1,1),(2,12),(2,10),(7,11)])]
ev=[reg(f,m,'evnt_i_'+str(i)) for i,(f,m) in enumerate([(6,4),(2,9),(2,8)])]
cnt=[reg(7,6,'CNT_0'),reg(8,2,'CNT_1')]
strdiv=reg(6,1,'str_div');str1=reg(1,6,'str1');str2=reg(1,11,'str2')
cal=reg(1,14,'cal_str');evout=reg(2,4,'EVOUT');clkn=reg(6,16,'CLK20_N_reg')
dout=[reg(f,m,'O_'+str(i)) for i,(f,m) in enumerate([(3,4),(3,5),(3,6),(3,7),(3,11),(3,13),(3,14),(3,15),(3,16),(7,16),(7,15),(7,14),(7,13)])]
blocks=ir['function_blocks'];lookup={m['resource']:(f,m) for f in blocks for m in f['macrocells']}
bases=[];pos=0
for fb in blocks:
    bases.append(pos); pos+=1120+4480+896+sum(29 if 'IOB_MODE_UNUSED' in m else 29 if 'IBUF_MODE' in m['configuration'] else 16 for m in fb['macrocells'])
assert pos==55316
def src(s):
    if s=='VCC':return z.BoolVal(True)
    if s=='GND':return z.BoolVal(False)
    kind,r=s.split('_',1);f,m=lookup[r];c=m['configuration']
    if kind=='IOB':return state[r] if c.get('IOB_ZIA_MUX')=='REG' else pads[m['pin']]
    return state[r] if c['MC_ZIA_MUX']=='REG' else xor(f,m)
def pt(f,t):
    base=bases[f['index']-1]+1120+80*t;ls=[]
    for i in range(40):
        if not fuses[base+2*i]:ls.append(src(f['zia'][i]))
        if not fuses[base+2*i+1]:ls.append(z.Not(src(f['zia'][i])))
    return z.And(*ls)
def xor(f,m):
    j=m['index']-1;base=bases[f['index']-1]+5600
    terms=[pt(f,t) for t in range(56) if not fuses[base+16*t+j]]
    st=z.Or(*terms);mode=m['configuration']['XOR_MUX']
    b={'GND':lambda:z.BoolVal(False),'VCC':lambda:z.BoolVal(True),'PT':lambda:pt(f,10+3*j),'PT_INV':lambda:z.Not(pt(f,10+3*j))}[mode]()
    return z.Xor(st,b)
def nxt(r):
    f,m=lookup[r];c=m['configuration'];j=m['index']-1
    assert c['RST_MUX']==c['SET_MUX']=='GND' and c['CLK_DDR']=='0'
    d=pads[m['pin']] if c.get('REG_D_MUX')=='IBUF' else xor(f,m)
    if c['REG_MODE']=='TFF':d=z.Xor(state[r],d)
    elif c['REG_MODE']=='DFFCE':d=z.If(pt(f,10+3*j),d,state[r])
    return d
def setexp(q,e):
    r=next(r for r,v in state.items() if v.eq(q));expected[r]=e
allones=z.And(*count);pulse=z.And(z.Not(ev[2]),ev[1])
for i,q in enumerate(count):setexp(q,z.If(pulse,False,z.If(cnt[0],z.If(allones,q,z.Xor(q,z.And(*count[:i]))),q)))
setexp(cal,z.If(pulse,True,z.If(z.And(cnt[0],allones),False,cal)))
setexp(evout,z.If(z.Not(pads[60]),False,z.If(z.And(allones,cal),True,evout)))
setexp(strdiv,z.Xor(strdiv,pads[64]));setexp(str1,z.If(z.Not(cnt[0]),strdiv,str1));setexp(str2,str1)
setexp(dly[0],z.Or(z.Xor(str1,str2),z.And(cal,cnt[0])))
for i in range(1,8):setexp(dly[i],dly[i-1])
setexp(ev[0],pads[60]);setexp(ev[1],ev[0]);setexp(ev[2],ev[1])
setexp(cnt[0],z.Not(cnt[0]));setexp(cnt[1],z.Xor(cnt[1],cnt[0]));setexp(clkn,z.Not(z.Xor(cnt[1],cnt[0])))
ap=[35,34,33,32,30,29,28,23,24,22,19,18];bp=[52,50,49,46,44,43,42,41,40,39,37,36]
for i in range(12):setexp(dout[i],z.If(dly[6],z.If(cnt[1],pads[ap[i]],pads[bp[i]]),dout[i]))
setexp(dout[12],z.If(dly[6],z.Not(cnt[1]),dout[12]))
results=[]
assert set(state)=={r for r,(f,m) in lookup.items() if m['registered']}
clock_ok=True
for r in state:
    solver=z.Solver();solver.add(nxt(r)!=expected[r]);status=solver.check()
    f,m=lookup[r]
    expected_clock='IOB_C0B5MC1' if names[r]=='str_div' else 'FCLK2'
    expected_falling=names[r] in ['str_div','str1','CNT_0','CNT_1','CLK20_N_reg']
    clock_ok &= m['clock_equation']==expected_clock and (m['configuration']['CLK_INV']=='1')==expected_falling
    results.append(dict(resource=r,name=names[r],clock=m['clock_equation'],falling=m['configuration']['CLK_INV']=='1',status=str(status),counterexample=str(solver.model()) if status==z.sat else None))
initial_ok=all((int(lookup[r][1]['configuration']['REG_INIT'])==(1 if r=='C0B5MC15' else 0)) for r in state)
assert ir['globals']['CLKDIV_ENABLE']=='0' and ir['globals']['FCLK2_ENABLE']=='1'
invariant=z.Solver();invariant.add(nxt('C0B5MC15')!=z.Not(nxt('C0B7MC1')))
invariant_ok=invariant.check()==z.unsat
out=dict(proof='local transition equivalence: UNSAT means no counterexample for any Boolean state/input',registers=results,initial_state_matches=initial_ok,clock_mapping_matches=clock_ok,complementary_clock_invariant=invariant_ok,vhdl_frontend_formal_verified=False,all_passed=all(r['status']=='unsat' for r in results) and initial_ok and clock_ok and invariant_ok)
(ROOT/'decoded/previous-input/state_map.json').write_text(json.dumps(names,indent=2,sort_keys=True)+'\n')
print(json.dumps(out,indent=2))
sys.exit(0 if out['all_passed'] else 1)
