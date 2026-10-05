#!/usr/bin/env python3
"""Execute an argv without shell interpolation; preserve command and combined log."""
import datetime,json,subprocess,sys
from pathlib import Path
root=Path(__file__).resolve().parent.parent
label=sys.argv[1];args=sys.argv[2:]
log=root/'experiments/logs'/f'{label}.log';log.parent.mkdir(parents=True,exist_ok=True)
entry=dict(utc=datetime.datetime.now(datetime.timezone.utc).isoformat(),cwd=str(Path.cwd()),argv=args,log=str(log.relative_to(root)))
with log.open('w') as stream:
 result=subprocess.run(args,stdout=stream,stderr=subprocess.STDOUT)
entry['exit_code']=result.returncode
with (root/'experiments/commands.jsonl').open('a') as stream:stream.write(json.dumps(entry)+'\n')
print(f'{label}: exit {result.returncode}, log {log}')
sys.exit(result.returncode)
