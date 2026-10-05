#!/usr/bin/env python3
"""Distinguish literal-cover differences from PT row/OR allocation differences."""
import argparse,collections,json
from pathlib import Path
p=argparse.ArgumentParser();p.add_argument('golden',type=Path);p.add_argument('candidate',type=Path);a=p.parse_args()
g=json.loads(a.golden.read_text());c=json.loads(a.candidate.read_text());out=[]
for x,y in zip(g['function_blocks'],c['function_blocks']):
 def term(t):return tuple(sorted(t))
 gx=collections.Counter(map(term,x['and_terms']));cy=collections.Counter(map(term,y['and_terms']))
 mapping={str(i):[j for j,t in enumerate(y['and_terms']) if term(t)==term(s)] for i,s in enumerate(x['and_terms'])}
 rowchanges=[i for i,(s,t) in enumerate(zip(x['and_terms'],y['and_terms'])) if s!=t]
 covers=[]
 for m,n in zip(x['macrocells'],y['macrocells']):
  gm=collections.Counter(term(x['and_terms'][i]) for i in m['sum_terms']);cm=collections.Counter(term(y['and_terms'][i]) for i in n['sum_terms'])
  if gm!=cm:covers.append(dict(resource=m['resource'],golden_only=list((gm-cm).elements()),candidate_only=list((cm-gm).elements())))
 out.append(dict(fb=x['index'],changed_and_rows=rowchanges,term_multiset_matches=gx==cy,golden_only_terms=list((gx-cy).elements()),candidate_only_terms=list((cy-gx).elements()),same_literal_row_candidates=mapping,changed_macrocell_covers=covers))
print(json.dumps(dict(function_blocks=out,warning='Matching covers does not prove analog timing. Different covers require Boolean proof; state SAT is separate.'),indent=2))
