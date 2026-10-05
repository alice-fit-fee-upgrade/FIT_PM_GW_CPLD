#!/usr/bin/env python3
"""Publish current artifacts with scoped evidence and explain every residual region."""
import collections,json,shutil,subprocess
from pathlib import Path
R=Path(__file__).resolve().parent.parent
def load(p):return json.loads((R/p).read_text())
def write(p,s):(R/p).write_text(s.strip()+'\n')
gold=load('decoded/readback-2026/original.json');fit=load('experiments/ise-readback-2026/configuration.json');raw=load('experiments/ise-readback-2026/raw-diff.json');diff=load('experiments/ise-readback-2026/structural-diff.json');proof=load('tests/readback-2026/transition-proof.json');fitproof=load('tests/readback-2026/fit-transition-proof.json');meta=gold['metadata']
with (R/'experiments/ise-readback-2026/pt-allocation.json').open('w') as ptlog:
 subprocess.run(['python3',str(R/'tools/analyze_pt_allocation.py'),str(R/'decoded/readback-2026/original.json'),str(R/'experiments/ise-readback-2026/configuration.json')],stdout=ptlog,check=True)
assert proof['all_passed'] and fitproof['all_passed']
assert gold['globals']==fit['globals']
assert load('decoded/readback-2026/state_map.json')==load('experiments/ise-readback-2026/state_map.json')
assert 'PASS: 67430 golden vectors' in (R/'tests/readback-2026/ghdl-equivalence.log').read_text()
pinfields=['OE_MUX','MC_IOB_MUX','IOB_SLEW','IOB_TERM_ENABLE','IOB_ZIA_MUX','IBUF_MODE','DGE_ENABLE']
for a,b in zip(gold['function_blocks'],fit['function_blocks']):
 for m,n in zip(a['macrocells'],b['macrocells']):
  if m['pin']:
   assert all(m['configuration'].get(k)==n['configuration'].get(k) for k in pinfields),(m['pin'],m['configuration'],n['configuration'])
regions=collections.Counter();individual=[];pos=0
explain={'ZIA':'Different routing selections for equivalent source equations; all 49 state transitions and clocks proved against golden model. Physical routing delay is not proved equal.', 'PLA AND':'Different product-term literals/allocation and factoring. Raw-fuse SAT proves all state next functions equal; internal combinational propagation delay may differ.', 'PLA OR':'Different product-term connections/order and XOR decomposition. Local transitions are proved equal, not physical timing.', 'MC/IOB configuration':'XOR selection choices in T-input logic and one extra combinational resource; unused register INIT differs on a nonregistered resource. Full path-level canonical list follows.', 'Globals':'Global configuration mismatch would require investigation; expected zero.'}
for f in gold['function_blocks']:
 for region,length in [('ZIA',1120),('PLA AND',4480),('PLA OR',896),('MC/IOB configuration',sum(29 if 'IBUF_MODE' in m['configuration'] else 16 for m in f['macrocells']))]:
  for addr in raw['different_fuses']:
   if pos<=addr<pos+length:
    key=f"FB{f['index']} {region}";regions[key]+=1;individual.append(dict(fuse=addr,region=key,offset=addr-pos,classification='routing' if region=='ZIA' else 'fitter implementation',explanation=explain[region]))
  pos+=length
assert pos==55316 and len(individual)==raw['hamming_distance']
write('experiments/readback-2026/remaining-fuses.json',json.dumps(individual,indent=2))
lines=['# Pozostałe różnice recovered ISE → nowy golden','',f"**{raw['hamming_distance']}/55341 różnych fuse; {diff['structural_difference_count']} canonical field differences. Bit identity nie osiągnięto.**", '', '| Obszar | Liczba fuse | Wyjaśnienie |','|---|---:|---|']
for region,count in regions.items():kind=region.split(' ',1)[1];lines.append(f'| {region} | {count} | {explain[kind]} |')
lines += ['', 'Wszystkie 49 state assignments mają ten sam FB/MC. Clocks/init/SR są zgodne; globals i wszystkie fizyczne pola IOB (w tym slew i Schmitt) są identyczne. Nieużywane pads mają IS_GND w obu konfiguracjach. Nie ma różnicy funkcji przejścia; jest różnica realizacji Boolean equations i wewnętrznych połączeń. To może wpływać na propagation delays. Nie deklarujemy timing equivalence.', '', '## Każde różne pole MC configuration','', '| Path | Golden | Candidate |','|---|---|---|']
lines += [f"| {d['path']} | {d['golden']} | {d['candidate']} |" for d in diff['differences'] if '/configuration/' in d['path']]
lines += ['', 'Pełna lista każdego różnego fuse z regionem/wyjaśnieniem: experiments/readback-2026/remaining-fuses.json. Wszystkie zmienione ZIA, AND i OR fields: experiments/ise-readback-2026/structural-diff.json. Nie przypisujemy tekstowych metadanych do device fuse differences.', '', 'Próby: baseline 1412; recovered bez LOC 1509; placement+default IOSTANDARD 1249; explicit TFF 978; nomlopt 978; density+EV Schmitt 976; speed fitter 380. Każdy build zachowany w experiments/readback-2026/fit-*/ lub final experiments/ise-readback-2026. Counter DFF→TFF i LOC wybierano na podstawie decoded modes/placement, nie ślepego score. Nie znaleziono potwierdzonego UCF sterującego dowolną alokacją PT/ZIA; dalsze exact match wymaga identyfikacji oryginalnego stylu źródła/opcji syntezy lub kontroli kolejności/minimalizacji product terms. Nie dowodzimy, że bit identity jest niemożliwe.']
write('reports/readback-2026/remaining_differences.md','\n'.join(lines))
write('reports/readback-2026/semantic_delta.md','''# Potwierdzona delta nowego odczytu

Nowy readback nie jest równoważny poprzedniemu załącznikowi ani historycznemu HDL.

| Obszar | Historyczny baseline / poprzedni JED | Nowy golden |
|---|---|---|
| EV_OUT P16 | DFFCE, reset synchroniczny przez EV=0, ustawienie na count=127/cal_str | combinational EV_OUT=EV_IN, SAT UNSAT dla negacji tej równości |
| Timer | 7-bit saturating counter, inkrementacja CNT0=1, reset od rising detector EV | 10-bit saturating counter, inkrementacja CNT=11, restart przy 1023 i inhibit_pipe=0000 oraz cal_phase=CNT1 |
| Calibration phase | cal_str ustawiany zdarzeniem EV, wyłączany po terminal count | cal_phase toggle przy restart; cal_sample ustawiany restartem, zerowany przy CNT0=0 |
| STR path | ENA-qualified toggle | taka sama ENA-qualified ścieżka + drugi unconditional STR toggle |
| Raw STR inhibit | brak | synchronizer 3-stage, edge FF, stretch przy CNT0=0, pipeline 4-stage przy CNT0=0; blokuje restart timera |
| Data-valid/ADC | dly chain propaguje STR i cal_str razem | dly 7-stage od STR edge; enable=dly6 OR cal_sample; DV jest FF tego enable |
| Initialization | użyte FF=0, CLK20_N=1 | użyte FF=1, CLK20_N=0; raw bits potwierdzone, provenance eksportu nadal zależy od podanego readback |
| CLK40 P81 slew | SLOW | FAST |
| EV input P60 | PLAIN | SCHMITT |
| Banks | LOW input/output selection | HIGH input/output selection obu banków |
| Unused pads | keeper, output disabled | programmed ground IS_GND, termination disabled |

Nie dodano hipotetycznych funkcji: czytelny model całej nowej architektury ma 49/49 lokalnych next-state equations równych raw-fuse modelowi golden dla wszystkich Boolean states/inputs. Resource→signal map: decoded/readback-2026/state_map.json. Weryfikacja includes clocks/init i GSR/GTS/divider disabled.

Counter bits [0..9] to FB1 MC14,10,9,11,12,13,15,16,2,7. cal_phase=FB1/MC8; cal_sample=FB2/MC16. Raw STR toggle=FB3/MC8 na falling CT4=P63. Szczegóły innych rejestrów w state_map i original.txt.

Nie określono analogowego opóźnienia różnicy FAST/SLOW ani HIGH/LOW. Schemat zasila ISE bank0 z 3.3 V, bank1 z 1.8 V; wybór HIGH nie jest pomiarem szyn. Zachowano ustawienia golden, bez cichej poprawki napięć.
''')
write('reports/readback-2026/jed_analysis.md',f'''# Analiza nowego JEDEC

SHA256 `{meta['sha256']}`; oryginalny załącznik i zachowana kopia są identyczne. QF={meta['qf']}, pełne pokrycie. C checksum {meta['declared_checksum']:04X} i transmission {meta['transmission_checksum']:04X} poprawne.

Header:
```
{meta['header'].strip()}
```
Wszystkie records poza L:
```
{chr(10).join(meta['records'])}
```

DEVICE xc2c128-XXXXX i QP0 nie określają package/speed. Target VQ100/-7 pochodzi z użytkownika i schematu. N VERSION nie występuje. Nagłówek i ścieżka /home/ise/Desktop są metadanymi programu eksportującego, nie fuse i nie dowodem kompilatora. Użytkownik podał ten plik jako rzeczywisty readback; narzędzie/komenda/IDCODE i log sesji nie są jeszcze dostarczone.

Security/G record brak; nie określamy protection/DONE/USERCODE spoza QF. Układ 8 FB, 128 MC, 49 inferred used registers. Project Combine decode→assemble: 0 fuse różnic. Global configuration:
```
{chr(10).join(k+'='+v for k,v in gold['globals'].items())}
```

HIGH to wybór bufora, nie pomiar zasilania. FCLK2 włączony, pozostałe clocks/GSR/GTS/divider/delay/DataGate/VREF wyłączone. Wszystkie użyte FF bez async set/reset; 48 INIT=1 i CLK20_N INIT=0. Nieużywane I/O programmed ground, nie keeper. Szczegółowy pinout i schemat są zachowane.
''')
write('reports/readback-2026/final_equivalence.md',f'''# Weryfikacja nowego golden 2026

**Odzyskano czytelny HDL i potwierdzono jego funkcję, lecz nie bit identity. Pozostaje {raw['hamming_distance']} fuse różnic po rzeczywistym buildzie ISE 14.7.**

| Kryterium | Wynik |
|---|---|
| Golden SHA256/checksums | zachowane/poprawne |
| Decode→assemble | 0/55341 |
| Historical baseline | 1412/55341, funkcjonalnie różny (EV_OUT) |
| Raw golden → recovered architecture SAT | 49/49 UNSAT, init/clocks zgodne |
| Actual recovered VHDL simulation | 67430 golden vectors PASS |
| Actual ISE fitted JED → same architecture SAT | 49/49 UNSAT, init/clocks zgodne |
| State placement | identyczny FB/MC dla wszystkich 49 FF |
| Globals, IOB fields, slew/Schmitt | identyczne |
| Bit identity VHDL→ISE | NIE; {raw['hamming_distance']} fuse różnic |
| Timing/physical hardware | nie zweryfikowano, nie programowano |

SAT korzysta z AND/OR czytanych bezpośrednio z fuse oraz mapy routingu Project Combine. Dowód dla fitted JED używa nazw i pozycji z rzeczywistego raportu fittera, niezależnie mapując stan. Równość lokalnych transitions + init + event clocks pozwala indukcyjnie porównać idealne uporządkowane zdarzenia. EV_OUT combinational identity ma osobny dowód. Nie wykonano oddzielnego formal frontend VHDL proof; rzeczywisty VHDL był symulowany, a faktyczny wynik kompilacji był sprawdzony SAT.

Wektory obejmują obie fazy CLK80, osobne STR edges, ENA=0/1, losowe ADC inputs, EV oraz długi brak STR umożliwiający timer restart i calibration transfers. Nie modelują analogowych delays/metastability/setup/hold ani jednoczesnych krawędzi domen.

Każdy pozostały obszar i fuse opisano w remaining_differences.md oraz experiments/readback-2026/remaining-fuses.json. PLA/routing/factoring mogą zmieniać timing mimo identycznej funkcji. Nie deklarujemy, że 100% bit match jest niemożliwy ani że ten JED jest gotowym zamiennikiem golden na sprzęcie.

Nieznane provenance narzędzia odczytu i fizyczne security pozostają jawne. Schemat/HDL historia/ISE userspace są zachowane. Hardware validation wymaga późniejszej wyraźnej zgody na programowanie. make reproduce odtwarza aktualny workflow, make reproduce-previous historyczny eksperyment dla starego wejścia.
''')
status=dict(active_golden='original/readback-2026/pm_cpld_gold_2026.jed',sha256=meta['sha256'],historical_baseline_raw_distance=1412,recovered_raw_distance=raw['hamming_distance'],canonical_difference_count=diff['structural_difference_count'],golden_transition_SAT_count=49,fitted_transition_SAT_count=49,vhdl_vectors=67430,functional_boolean_model_equivalence_verified=True,vhdl_bit_identity_verified=raw['hamming_distance']==0,timing_equivalence_verified=False,hardware_programmed=False,physical_security_verified=False)
write('reports/readback-2026/status.json',json.dumps(status,indent=2))
shutil.copyfile(R/'reports/readback-2026/baseline_comparison.md',R/'reports/baseline_structural_diff.md')
shutil.copyfile(R/'reports/readback-2026_structural_diff.md',R/'reports/recovered_structural_diff.md')
score=load('experiments/ise-readback-2026/score.json');score['functional_equivalence_verified']=True;score['evidence']='tests/readback-2026/fit-transition-proof.json';write('experiments/ise-readback-2026/score.json',json.dumps(score,indent=2))
shutil.copyfile(R/'decoded/readback-2026/roundtrip.jed',R/'decoded/combine-roundtrip.jed')
shutil.copyfile(R/'decoded/readback-2026/roundtrip-diff.json',R/'decoded/combine-roundtrip-diff.json')
for name in ['original.json','original.txt','original.combine.txt','jed_metadata.json','state_map.json']:
 shutil.copyfile(R/'decoded/readback-2026'/name,R/'decoded'/name)
for name in ['amplcpld_recovered.vhd','amplcpld.ucf']:
 shutil.copyfile(R/'recovered/readback-2026'/name,R/'recovered'/name)
shutil.copyfile(R/'experiments/ise-readback-2026/readback-2026.jed',R/'recovered/readback-2026/amplcpld_recovered.jed')
shutil.copyfile(R/'experiments/ise-readback-2026/readback-2026.jed',R/'recovered/amplcpld_recovered.jed')
for name in ['baseline_comparison.md','semantic_delta.md','jed_analysis.md','final_equivalence.md','remaining_differences.md','status.json']:
 shutil.copyfile(R/'reports/readback-2026'/name,R/'reports'/name)
pins=(R/'reports/previous-input/pinout.md').read_text();pins+='\n## Aktualny golden 2026\n\nPhysical pinout jest taki sam. Nowy JED nie podaje package/speed; VQ100/-7 pochodzi ze schematu. EV_OUT jest combinational passthrough EV_IN; CLK40 ma FAST slew; EV input ma SCHMITT. Nieużywane pads są skonfigurowane jako stałe GND; wcześniejsza kolumna NC opisuje brak połączenia na schemacie. Wszystkie te pola odtworzono w recovered UCF/fitter build. Schemat 3.3 V/1.8 V nie jest pomiarem i nie zmieniono HIGH bank configuration golden.\n';write('reports/pinout.md',pins)
print(json.dumps(status,indent=2))
