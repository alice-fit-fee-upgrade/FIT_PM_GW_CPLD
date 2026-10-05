#!/usr/bin/env python3
"""Isolated ISE experiment: preserve sources, fitter artifacts, diffs and SAT evidence."""
import argparse,hashlib,json,os,shutil,subprocess
from pathlib import Path
R=Path(__file__).resolve().parent.parent
p=argparse.ArgumentParser();p.add_argument('name');p.add_argument('--source',type=Path,required=True);p.add_argument('--ucf',type=Path);a=p.parse_args()
folder=R/'experiments/matching-2026'/a.name
if folder.exists():raise SystemExit('Experiment already exists; use a new name')
folder.mkdir(parents=True)
shutil.copyfile(a.source,folder/'source.vhd');shutil.copyfile(a.ucf or R/'recovered/readback-2026/amplcpld.ucf',folder/'source.ucf')
env=os.environ.copy();env.update(CPLD_LOG_PREFIX=a.name,CPLD_BUILD_DIR=str(folder),CPLD_SOURCE=str(folder/'source.vhd'),CPLD_UCF=str(folder/'source.ucf'))
with (folder/'flow.log').open('w') as log:result=subprocess.run(['python3',str(R/'tools/run_logged.py'),a.name,str(R/'tools/build_ise'),'readback-2026'],cwd=R,env=env,stdout=log,stderr=subprocess.STDOUT)
status={'name':a.name,'source_sha256':hashlib.sha256((folder/'source.vhd').read_bytes()).hexdigest(),'build_exit':result.returncode,'fit_environment':{k:v for k,v in env.items() if k.startswith(('ISE_FIT_','ISE_XST_','WEMAP_','NO_OPTX_','NETWORK_','DONT_FLATTEN'))}}
for log in (R/'experiments/logs').glob(a.name+'-*.log'):shutil.copyfile(log,folder/log.name)
if result.returncode==0:
 env.update(CPLD_PROOF_IR=str(folder/'configuration.json'),CPLD_PROOF_JED=str(folder/'readback-2026.jed'),CPLD_PROOF_BUILD=str(folder))
 with (folder/'proof.log').open('w') as log:proof=subprocess.run([str(R/'toolchain/venv/bin/python'),str(R/'tools/verify_readback_2026.py')],cwd=R,env=env,stdout=log,stderr=subprocess.STDOUT)
 status.update(proof_exit=proof.returncode,raw_distance=json.loads((folder/'raw-diff.json').read_text())['hamming_distance'],canonical_difference_count=json.loads((folder/'structural-diff.json').read_text())['structural_difference_count'])
(folder/'experiment.json').write_text(json.dumps(status,indent=2)+'\n');print(json.dumps(status))
