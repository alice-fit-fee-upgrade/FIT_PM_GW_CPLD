#!/usr/bin/env python3
"""Inventory every reachable version, including deleted files and all branches."""
import hashlib,json,subprocess
from pathlib import Path
R=Path(__file__).resolve().parent.parent
variants=[];repos=[]
for label,filename in [('upstream','upstream.git'),('r-smalec','fork-r-smalec.git')]:
 repo=R/'known_hdl'/filename
 def git(*args):return subprocess.check_output(['git','--git-dir='+str(repo),*args])
 commits=git('rev-list','--all').decode().splitlines();refs=git('show-ref').decode()
 (R/'known_hdl'/f'{label}-refs.txt').write_text(refs)
 found={};artifactpaths=set()
 for commit in commits:
  for line in git('ls-tree','-r',commit).decode().splitlines():
   desc,path=line.split('\t',1);mode,typ,obj=desc.split()
   if typ!='blob':continue
   if Path(path).suffix.lower() in ['.jed','.vm6','.ngc','.ucf','.ise','.xise','.xst','.syr','.rpt','.log','.bak','.backup','.xsa','.bit','.prj','.tcl'] or path.endswith('~'):artifactpaths.add(path)
   if Path(path).name.lower()=='amplcpld.vhd':found.setdefault(obj,dict(paths=set(),commits=[]));found[obj]['paths'].add(path);found[obj]['commits'].append(commit)
 for obj,v in found.items():
  data=git('cat-file','blob',obj);sha=hashlib.sha256(data).hexdigest();out=R/'known_hdl/variants'/f'{sha}.vhd';out.parent.mkdir(exist_ok=True);out.write_bytes(data)
  variants.append(dict(repository=label,git_blob=obj,sha256=sha,paths=sorted(v['paths']),commits=v['commits'],file=str(out.relative_to(R))))
 repos.append(dict(repository=label,commits=len(commits),refs=refs,build_artifact_paths=sorted(artifactpaths)))
(R/'known_hdl/variants.json').write_text(json.dumps(variants,indent=2)+'\n')
(R/'known_hdl/history.json').write_text(json.dumps(repos,indent=2)+'\n')
baseline=R/'known_hdl/baseline';baseline.mkdir(exist_ok=True)
for fn in ['amplcpld.vhd','comps.vhd','amplcpld_tb.vhd']:
 data=subprocess.check_output(['git','--git-dir='+str(R/'known_hdl/upstream.git'),'show','a6c492e:'+fn]) if fn!='amplcpld_tb.vhd' else subprocess.check_output(['git','--git-dir='+str(R/'known_hdl/upstream.git'),'show','35997f3:'+fn])
 (baseline/fn).write_bytes(data)
lines=['# Historia HDL','','Pełne mirror clones, bez shallow clone. API forków zachowane w known_hdl/forks.json. Snapshot: 2026-10-04.','', 'Źródło: https://github.com/alice-fit-fee-upgrade/FIT_PM_GW_CPLD i https://github.com/r-smalec/FIT_PM_GW_CPLD.','']
for repo in repos:
 lines += [f"## {repo['repository']}: {repo['commits']} commitów",'', '```',repo['refs'].strip(),'```','', 'Artefakty buildów (wszystkie drzewa reachable): '+(', '.join(repo['build_artifact_paths']) or 'brak JED/VM6/NGC/UCF/ISE/XST/raportów.'),'']
lines+=['## Wszystkie warianty amplcpld.vhd','','| Repo | SHA256 | Git blob | Ścieżki |','|---|---|---|---|']
for v in variants:lines.append(f"| {v['repository']} | {v['sha256']} | {v['git_blob']} | {', '.join(v['paths'])} |")
lines+=['','Lista commitów każdego wariantu jest w known_hdl/variants.json. Wszystkie wersje zapisano w known_hdl/variants/.','', 'Baseline: upstream a6c492e (non verified sources), amplcpld.vhd + comps.vhd. HEAD main 35997f3 dodaje testbench/dokumentację. Gałąź dev obejmuje późniejsze projekty Vivado/FPGA; nie jest dowodem wersji produkcyjnej CPLD. Fork ma późniejsze reorganizacje, zmiany symulacyjne i rozbicie modułów. Żaden znaleziony build CPLD nie zastępuje wymaganego baseline ISE.','', 'Brak oryginalnych constraints/ustawień fittera. Wybrano kod najbliższy produkcyjnej strukturze na podstawie 39 równań rejestrów, nie daty wersji readback. Metadane remote refs dotyczą dostępnego publicznego snapshotu; nie obejmują prywatnych/usuniętych, nieosiągalnych commitów.']
(R/'reports/history.md').write_text('\n'.join(lines)+'\n')
