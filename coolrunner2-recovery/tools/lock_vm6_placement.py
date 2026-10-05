#!/usr/bin/env python3
"""Explicit post-fit PT-row locking; not a native fitter constraint or JED copy."""
import argparse,json,re
from pathlib import Path
import z3
p=argparse.ArgumentParser();p.add_argument('vm6',type=Path);p.add_argument('candidate_ir',type=Path);p.add_argument('golden_ir',type=Path);p.add_argument('output',type=Path);p.add_argument('--constraints',type=Path,required=True);a=p.parse_args()
g=json.loads(a.golden_ir.read_text());c=json.loads(a.candidate_ir.read_text());s=a.vm6.read_text()
lock=json.loads(a.constraints.read_text())
assert lock['golden_sha256']==g['metadata']['sha256']
for b in lock['blocks']:assert b['and_terms']==g['function_blocks'][b['index']-1]['and_terms']
assert lock['counter9_sum_terms']==g['function_blocks'][0]['macrocells'][6]['sum_terms']
assert g['globals']==c['globals']
for f,h in zip(g['function_blocks'],c['function_blocks']):
 assert f['zia']==h['zia']
 for m,n in zip(f['macrocells'],h['macrocells']):assert m['configuration']==n['configuration']
# All other sum covers must already match; never replace unrelated fitted logic.
from collections import Counter
for f,h in zip(g['function_blocks'],c['function_blocks']):
 for m,n in zip(f['macrocells'],h['macrocells']):
  if m['resource']=='C0B0MC6':continue
  assert Counter(tuple(sorted(f['and_terms'][i])) for i in m['sum_terms'])==Counter(tuple(sorted(h['and_terms'][i])) for i in n['sum_terms']),m['resource']
# Verify changed T input cover before replacing its equivalent representation.
f=g['function_blocks'][0];h=c['function_blocks'][0];v=[z3.Bool('zia_'+str(i)) for i in range(40)]
def cube(t):return z3.And(*[z3.Not(v[int(q[1:])]) if q.startswith('!') else v[int(q)] for q in t])
def sop(x):return z3.Or(*[cube(x['and_terms'][i]) for i in x['macrocells'][6]['sum_terms']])
solver=z3.Solver();solver.add(sop(f)!=sop(h));assert solver.check()==z3.unsat
maps={}
for line in s.splitlines():
 if line.startswith('FB_ORDER_OF_INPUTS | '):
  q=line.split(' | ');fb=int(q[1][6:-1]);d=maps.setdefault(fb,{})
  for i in range(2,len(q),3):d[int(q[i])]=q[i+1]
def term(t,fb):
 q=['SPPTERM',str(len(t))]
 for lit in t:
  ix=int(lit.lstrip('!'));q.extend(['IV_FALSE' if lit.startswith('!') else 'IV_TRUE',maps[fb][ix]])
 return ' | '.join(q)
# PLA entries carry physical PT indices; all other routing/IO/register records stay fitted.
changes=[]
for fb in [1,2]:
 f=g['function_blocks'][fb-1];entries=[(i,t) for i,t in enumerate(f['and_terms']) if t]
 block='PLA | FOOBAR'+str(fb)+'_ | '+str(len(entries))+'\n'
 block+=''.join('PLA_TERM | '+str(i)+' | \n'+term(t,fb)+'\n' for i,t in entries)
 pattern=r'PLA \| FOOBAR'+str(fb)+r'_ \| \d+\n(?:PLA_TERM[^\n]*\nSPPTERM[^\n]*\n)*'
 s,n=re.subn(pattern,lambda m:block,s);assert n==1
 changes.append(dict(fb=fb,explicit_rows=len(entries)))
# The only differing macrocell sum cover is the highest timer bit.
node=r'(SIGNAL \| NODE \| c_count<9>_MC.D2[^\n]*\n)(?:SPPTERM[^\n]*\n)+'
f=g['function_blocks'][0]
terms=''.join(term(f['and_terms'][i],1)+'\n' for i in f['macrocells'][6]['sum_terms'])
s,n=re.subn(node,lambda m:m.group(1)+terms,s);assert n==1
a.output.parent.mkdir(parents=True,exist_ok=True);a.output.write_text(s)
a.output.with_suffix('.lock.json').write_text(json.dumps(dict(kind='post-fit VM6 implementation lock',native_fitter_bit_identity=False,changed_blocks=changes,counter9_cover_equivalence='UNSAT',template=str(a.constraints),input_vm6=str(a.vm6)),indent=2)+'\n')
