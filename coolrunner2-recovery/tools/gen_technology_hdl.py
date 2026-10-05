#!/usr/bin/env python3
"""Control experiment preserving golden SOP/XOR boundaries; readable recovery stays separate."""
import json,re
from pathlib import Path
R=Path(__file__).resolve().parent.parent
ir=json.loads((R/'decoded/readback-2026/original.json').read_text());names=json.loads((R/'decoded/readback-2026/state_map.json').read_text());lookup={m['resource']:(f,m) for f in ir['function_blocks'] for m in f['macrocells']}
pads={27:'CLK80',63:'STR',64:'ENA',60:'EV'}
for name,seq in [('ADC0',[35,34,33,32,30,29,28,23,24,22,19,18]),('ADC1',[52,50,49,46,44,43,42,41,40,39,37,36])]:
 for i,p in enumerate(seq):pads[p]=f'{name}({i})'
comb=set();active=set()
def net(r):
 name=names.get(r)
 if name is None:comb.add(r);return 'comb_'+r
 match=re.fullmatch(r'(c_count|dly|raw_sync|inhibit_pipe|CNT|O)_(\d+)',name)
 return f'{match[1]}({match[2]})' if match else name
# Evaluate physical routing references only from live PT literals.
def src(s):
 if s=='VCC':return "'1'"
 if s=='GND':return "'0'"
 kind,r=s.split('_',1);f,m=lookup[r];c=m['configuration']
 if kind=='IOB':return net(r) if c['IOB_ZIA_MUX']=='REG' else pads[m['pin']]
 return net(r)
def pt(f,t):
 terms=[]
 for lit in f['and_terms'][t]:
  source=src(f['zia'][int(lit.lstrip('!'))]);terms.append(('not '+source) if lit.startswith('!') else source)
 return '('+' and '.join(terms)+')' if terms else "'1'"
def equation(f,m):
 i=m['index']-1;c=m['configuration'];a=' or '.join(pt(f,int(t)) for t in f['or_terms'][i]) or "'0'"
 mode=c['XOR_MUX'];b={'GND':lambda:"'0'",'VCC':lambda:"'1'",'PT':lambda:pt(f,10+3*i),'PT_INV':lambda:'not '+pt(f,10+3*i)}[mode]()
 return '('+a+') xor ('+b+')'
exprs={};ces={};clocks={}
for r in names:
 f,m=lookup[r];c=m['configuration'];exprs[r]=pads[m['pin']] if c.get('REG_D_MUX')=='IBUF' else equation(f,m)
 if c['REG_MODE']=='DFFCE':ces[r]=pt(f,10+3*(m['index']-1))
 clocks[r]='CLK80' if c['CLK_MUX']=='FCLK2' else pt(f,4)
 if c['CLK_INV']=='1':clocks[r]='not ('+clocks[r]+')'
while comb-active:
 for r in sorted(comb-active):active.add(r);exprs[r]=equation(*lookup[r])
header=(R/'recovered/readback-2026/amplcpld_recovered.vhd').read_text();entity=header[header.index('entity amplcpld is'):header.index('architecture recovered_2026')]
lines=['-- Generated diagnostic implementation from canonical golden equations.','-- Not a claim to original HDL; compare with readable recovered architecture.','library ieee; use ieee.std_logic_1164.all;','library unisim; use unisim.vcomponents.all;',entity,'architecture technology of amplcpld is']
for name,n in [('CNT',2),('c_count',10),('dly',7),('raw_sync',3),('inhibit_pipe',4),('O',13)]:lines.append(f'signal {name}:std_logic_vector({n-1} downto 0);')
for name in sorted(set(names.values())):
 if not re.fullmatch(r'(CNT|c_count|dly|raw_sync|inhibit_pipe|O)_\d+',name):lines.append(f'signal {name}:std_logic;')
for r in sorted(active):lines.append(f'signal {net(r)}:std_logic;')
for r in names:
 lines.append(f'signal drive_{r}, clock_{r}:std_logic;')
 if r in ces:lines.append(f'signal ce_{r}:std_logic;')
lines.append('attribute keep:string;')
for r in sorted(active):lines.append(f'attribute keep of {net(r)}:signal is "true";')
lines+=['begin','DOUT<=O; CLK40<=CNT(0); CLK20_P<=CNT(1); CLK20_N<=clk20n_reg; DV<=dv_reg; EV_out<=EV;']
for r in sorted(active):lines.append(f'{net(r)} <= {exprs[r]};')
for r in names:
 c=lookup[r][1]['configuration'];mode=c['REG_MODE'];lines += [f'clock_{r} <= {clocks[r]};',f'drive_{r} <= {exprs[r]};']
 init=c['REG_INIT'];q=net(r)
 if mode=='TFF':primitive='FTCP';ports=f'Q=>{q}, C=>clock_{r}, CLR=>\'0\', PRE=>\'0\', T=>drive_{r}'
 elif mode=='DFFCE':
  lines.append(f'ce_{r} <= {ces[r]};');primitive='FDCPE';ports=f'Q=>{q}, C=>clock_{r}, CE=>ce_{r}, CLR=>\'0\', PRE=>\'0\', D=>drive_{r}'
 else:primitive='FD';ports=f'Q=>{q}, C=>clock_{r}, D=>drive_{r}'
 lines.append(f'ff_{r}: {primitive} generic map(INIT=>\'{init}\') port map({ports});')
lines.append('end architecture;')
folder=R/'experiments/matching-2026';(folder/'technology.vhd').write_text('\n'.join(lines)+'\n')
u=(R/'recovered/readback-2026/amplcpld.ucf').read_text()
for r in sorted(active):
 f,m=map(int,re.fullmatch(r'C0B(\d+)MC(\d+)',r).groups());u+=f'NET "{net(r)}" LOC="FB{f+1}_{m+1}";\n'
(folder/'technology.ucf').write_text(u)
print('Generated',len(names),'FF and',len(active),'combinational feedback nodes')
