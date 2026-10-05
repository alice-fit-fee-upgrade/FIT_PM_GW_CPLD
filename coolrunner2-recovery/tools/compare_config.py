#!/usr/bin/env python3
import json,sys
from pathlib import Path
a=json.loads(Path(sys.argv[1]).read_text());b=json.loads(Path(sys.argv[2]).read_text());out=[]
def walk(x,y,path=''):
 if isinstance(x,dict) and isinstance(y,dict):
  for k in sorted(x.keys()|y.keys()):
   if k in ('metadata','decoder','equation','and_equations','data_equation','ce_equation','clock_equation','reset_equation','set_equation'):continue
   walk(x.get(k),y.get(k),path+'/'+k)
 elif isinstance(x,list) and isinstance(y,list):
  for i in range(max(len(x),len(y))):walk(x[i] if i<len(x) else None,y[i] if i<len(y) else None,path+'/'+str(i))
 elif x!=y:out.append(dict(path=path,golden=x,candidate=y))
walk(a,b)
print(json.dumps(dict(differences=out,structural_difference_count=len(out),warning='Placement-sensitive diff; semantic equivalence needs independent state mapping/SAT.'),indent=2))
