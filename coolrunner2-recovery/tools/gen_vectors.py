#!/usr/bin/env python3
import random,sys
from pathlib import Path
from golden_model import Model
R=Path(__file__).resolve().parent.parent
new=len(sys.argv)>1 and sys.argv[1]=='--readback-2026'
m=Model(R/('decoded/readback-2026/original.json' if new else 'decoded/previous-input/original.json'));s=m.initial.copy();p={i:0 for i in range(1,101)}
clk=0;strobe=0;randomgen=random.Random(12855341);rows=[]
ap=[35,34,33,32,30,29,28,23,24,22,19,18];bp=[52,50,49,46,44,43,42,41,40,39,37,36];op=[99,97,96,95,94,93,92,91,90,89,87,86,85]
def row():
 out=m.outputs(s,p)
 a=sum(p[n]<<i for i,n in enumerate(ap));b=sum(p[n]<<i for i,n in enumerate(bp));o=sum(out[n]<<i for i,n in enumerate(op))
 rows.append(' '.join(map(str,[clk,strobe,p[64],p[60],a,b,out[81],out[53],out[54],out[82],out[16],o])))
row()
for n in range(64000 if new else 24000):
 # EV held for long intervals to exercise complete calibration/saturation.
 p[60]=int((n//1200)%2==1);p[64]=int(n%3000<2100)
 for k in ap+bp:p[k]=randomgen.randrange(2)
 if n%7==0 and (not new or n<24000):
  strobe^=1;p[63]=strobe
  if strobe==0:s=m.step(s,p,clock='CT4',falling=True)
  row()
 clk^=1;p[27]=clk;s=m.step(s,p,falling=clk==0);row()
(R/('tests/readback-2026/vectors.txt' if new else 'tests/vectors.txt')).write_text('\n'.join(rows)+'\n')
print(f'{len(rows)} vectors; seed=12855341; includes both CLK80 edges and asynchronous STR edges')
