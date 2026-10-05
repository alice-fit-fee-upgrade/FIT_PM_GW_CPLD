#!/usr/bin/env python3
import json,shutil
from pathlib import Path
r=Path(__file__).resolve().parent.parent
for mode in ('baseline','recovered'):
 b=r/'experiments'/('ise-'+mode)
 assert json.loads((b/'raw-diff.json').read_text())['hamming_distance']==0, mode
 assert json.loads((b/'structural-diff.json').read_text())['structural_difference_count']==0, mode
shutil.copyfile(r/'experiments/ise-recovered/recovered.jed',r/'recovered/previous-input/amplcpld_recovered.jed')
print('PASS: baseline and recovered are identical to all 55341 golden fuses and canonical configuration')
