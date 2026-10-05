#!/usr/bin/env python3
import hashlib,json
from pathlib import Path
R=Path(__file__).resolve().parent.parent;b=R/'experiments/vm6-locked-2026'
raw=json.loads((b/'raw-diff.json').read_text());cfg=json.loads((b/'structural-diff.json').read_text());proof=json.loads((b/'transition-proof.json').read_text())
assert raw['hamming_distance']==cfg['structural_difference_count']==0 and proof['all_passed']
s=dict(kind='post-fit VM6 implementation lock',fuse_distance=0,canonical_difference_count=0,transition_proofs=49,native_fitter_fuse_distance=json.loads((R/'experiments/ise-readback-2026/raw-diff.json').read_text())['hamming_distance'],native_fitter_bit_identity=False,implementation_locked_bit_identity=True,hardware_programmed=False,security_outside_QF_verified=False,template='recovered/amplcpld.ptlock.json',output='recovered/amplcpld_implementation_locked.jed',output_sha256=hashlib.sha256((R/'recovered/amplcpld_implementation_locked.jed').read_bytes()).hexdigest())
(R/'reports/implementation_lock_status.json').write_text(json.dumps(s,indent=2)+'\n')
(R/'reports/implementation_lock.md').write_text('''# Jawne blokowanie implementacji VM6

**Uzyskano 0/55341 różnic fuse i 0 różnic canonical configuration względem pm_cpld_gold_2026.jed.** Wynik: recovered/amplcpld_implementation_locked.jed.

Pipeline: recovered VHDL + UCF → XST → ngdbuild → cpldfit → native VM6 → lock_vm6_placement.py + amplcpld.ptlock.json → locked VM6 → Xilinx hprep6 → JED.

To NIE jest bit-identical wynik samego fittera ani odzyskanie historycznego źródła/opcji. Native fitter nadal ma 346 różnic. Dodatkowy backend blokuje physical PLA rows w FB1 i FB2 oraz stosuje równoważny literal cover wejścia T najwyższego bitu licznika. Template pochodzi z decoded golden i zawiera równania AND, nie tylko współrzędne placement. Nie kopiujemy pliku golden JED ani gotowych bitów do wyniku: hprep6 generuje JED ze zmodyfikowanego rzeczywistego VM6 fittera.

ZIA, clocks, init, wszystkie macrocells/IOB/global fields pochodzą z native fit i muszą już być identyczne. Każdy inny sum cover musi zgadzać się przed blokowaniem. Różne wejście T c_count9 sprawdzane jest SAT przed zastąpieniem. Wrapper ponownie sprawdza wszystkie 49 native transitions przed lock i wszystkie 49 po wygenerowaniu JED. Test negatywny odrzuca zmieniony REG_INIT i nie tworzy wyniku. Oryginalny SHA256 pozostaje zachowany.

Locked VM6: experiments/vm6-locked-2026/design.vm6. Lock records: design.lock.json. Actual vendor log: experiments/logs/vm6-locked-hprep6.log. Raw/canonical comparisons and 49/49 UNSAT proof are in experiments/vm6-locked-2026. Reproducibility: make reproduce (pełny workflow) lub make implementation-locked (native build + lock). Oba failują przy niezgodności guards/diff/proof.

JED jest identyczny pod względem wszystkich 55341 QF fuse. Tekstowe nagłówki/daty i transmission checksum mogą różnić się, ponieważ hprep6 generuje własny kontener JEDEC. Security/DONE/USERCODE spoza QF nie są potwierdzone. Nie programowano sprzętu. Nie wykonano pomiaru timingów na płytce.

ISE settings ładowane są w subshell wyłącznie dla hprep6, aby stare biblioteki ISE nie zakłócały nowego Z3. Początkowy błąd libz3.so jest zachowany w locked-pipeline.log; poprawiony pipeline przeszedł.
''')
print(json.dumps(s,indent=2))

for path in ['reports/final_equivalence.md','reports/readback-2026/final_equivalence.md']:
 p=R/path
 text=p.read_text().split('\n## Dodatkowy implementation lock')[0]
 text+='\n## Dodatkowy implementation lock\n\nPo jawnym blokowaniu PLA w VM6 i generacji przez Xilinx hprep6 uzyskano 0/55341 fuse oraz 0 canonical differences. Jest to dodatkowy backend wykorzystujący template alokacji/równań z golden, nie bit-identical wynik samego fittera. Locked JED: recovered/amplcpld_implementation_locked.jed. Szczegóły i zakres dowodów: reports/implementation_lock.md.\n'
 p.write_text(text)
