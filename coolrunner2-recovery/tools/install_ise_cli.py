#!/usr/bin/env python3
"""Run user-supplied ISE 14.7 batch installer in a PTY.

Invoking this installer accepts the vendor's displayed installation terms.
Vendor binaries/archive and licensing material stay outside the repository.
"""
import argparse, errno, os, pty, re, select, subprocess, sys
from pathlib import Path
root=Path(__file__).resolve().parent.parent
p=argparse.ArgumentParser(description=__doc__)
p.add_argument('installer',type=Path,help='Extracted Xilinx_ISE_DS_Lin_14.7_1015_1 directory')
p.add_argument('--batch',type=Path,default=root/'toolchain/ise-install.batch')
a=p.parse_args()
env=os.environ.copy();compat=root/'toolchain/ise-compat/root'
env['LD_LIBRARY_PATH']=str(compat/'lib/x86_64-linux-gnu')+':'+str(compat/'usr/lib/x86_64-linux-gnu')+':'+env.get('LD_LIBRARY_PATH','')
master,slave=pty.openpty()
cmd=[str(a.installer.resolve()/'bin/lin64/batchxsetup'),'--batch',str(a.batch.resolve())]
process=subprocess.Popen(cmd,stdin=slave,stdout=slave,stderr=slave,env=env)
os.close(slave); pending=b''
log=root/'experiments/logs/ise-install-pty.log';log.parent.mkdir(exist_ok=True)
pattern=re.compile(rb'Press Enter key to continue[^:]*:|I accept and agree[^:]*:')
with log.open('wb') as stream:
 while True:
  ready,_,_=select.select([master],[],[],1)
  if not ready:
   if process.poll() is not None:break
   continue
  try:data=os.read(master,65536)
  except OSError as e:
   if e.errno==errno.EIO:break
   raise
  if not data:break
  stream.write(data);stream.flush();pending+=data
  while True:
   match=pattern.search(pending)
   if not match:break
   prompt=match[0];pending=pending[match.end():]
   os.write(master,b'Y\n' if prompt.startswith(b'I accept') else b'\n')
  if len(pending)>10000:pending=pending[-10000:]
os.close(master)
print(f'ISE installer exit={process.wait()}; log={log}')
sys.exit(process.returncode)
