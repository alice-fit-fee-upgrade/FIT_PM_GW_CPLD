#!/usr/bin/env python3
import collections,json
from pathlib import Path
R=Path(__file__).resolve().parent.parent
def read(p):return json.loads((R/p).read_text())
new=read('decoded/readback-2026/original.json');old=read('experiments/ise-baseline/configuration.json');meta=new['metadata'];raw=read('experiments/readback-2026/baseline-raw-diff.json');diff=read('experiments/readback-2026/baseline-structural-diff.json');roundtrip=read('decoded/readback-2026/roundtrip-diff.json');assert roundtrip['hamming_distance']==0
regions=collections.Counter();pos=0
for fb in new['function_blocks']:
 for label,length in [('ZIA',1120),('PLA AND',4480),('PLA OR',896),('MC/IOB configuration',sum(29 if 'IBUF_MODE' in m['configuration'] else 16 for m in fb['macrocells']))]:
  end=pos+length;regions[f"FB{fb['index']} {label}"]=sum(pos<=b<end for b in raw['different_fuses']);pos=end
assert pos==55316
regions['Globals']=sum(b>=pos for b in raw['different_fuses'])
assert sum(regions.values())==raw['hamming_distance']
(R/'experiments/readback-2026/region-diff.json').write_text(json.dumps(regions,indent=2)+'\n')
lines=['# Nowy golden readback 2026 — pierwszy structural diff','', '**Aktywny golden: original/readback-2026/pm_cpld_gold_2026.jed. Poprzednia deklaracja bit identity dotyczy wyłącznie original/amplcpld.jed, nie tego odczytu.**','',f"SHA256: `{meta['sha256']}`. QF={meta['qf']}, checksum C={meta['declared_checksum']:04X}, transmission={meta['transmission_checksum']:04X}; oba poprawne, wszystkie fuse pokryte.", '',f"Nagłówek: `{meta['header'].strip()}`. DEVICE xc2c128-XXXXX; QP0: ten plik nie deklaruje package ani speed. Mapowanie pinów VQ100 stosujemy na podstawie dostarczonego schematu/targetu, nie QP0.",'',f"Rzeczywisty dotychczasowy build historycznego HDL w ISE 14.7 różni się o **{raw['hamming_distance']}/55341 fuse** i **{diff['structural_difference_count']} canonical scalar fields**. Poprzedni załącznik i poprawiony recovered build miały identyczną konfigurację z tym baseline, więc mają również 1412 fuse różnic względem nowego golden.",'','Decode→assemble nowego golden: **0 fuse różnic**. To waliduje bezstratność dekodowania, nie dowodzi zgodności HDL. Stare SAT/state_map/vectors nie są dowodem dla nowego golden.','', '| Obszar | Różne fuse |','|---|---:|']
lines += [f'| {k} | {v} |' for k,v in regions.items() if v]
lines += ['','## Global configuration','', '| Pole | Nowy golden | Historyczny baseline |','|---|---|---|']
lines += [f'| {k} | {v} | {old["globals"][k]} |' for k,v in new['globals'].items() if v!=old['globals'][k]]
lines += ['', 'HIGH/LOW oznacza wybór konfiguracji bufora, nie zmierzone napięcie zasilania. Nie wyciągamy wniosków o rzeczywistych napięciach z tych etykiet.', '', '## Znane wyjścia: różnice pól','', '| Pin | Pole | Nowy golden | Baseline |','|---:|---|---|---|']
for f,g in zip(new['function_blocks'],old['function_blocks']):
 for m,n in zip(f['macrocells'],g['macrocells']):
  if n['configuration'].get('OE_MUX')!='VCC':continue
  for k,v in m['configuration'].items():
   if v!=n['configuration'].get(k):lines.append(f"| {m['pin']} | {k} | {v} | {n['configuration'].get(k)} |")
lines += ['', 'Pin81/CLK40: nowy golden FAST, baseline SLOW. To rzeczywista różnica ustawienia wyjścia zegarowego. Sama nie wyjaśnia wszystkich 1412 fuse. Zmiany INIT/XOR/register routing wymagają mapowania stanów i interpretacji eksportu readback; nie można automatycznie utożsamiać każdej z nich ze zmianą funkcji.', '', '## Potwierdzona delta event-chain', '', 'Nowy golden: P16 EV_OUT jest wyjściem kombinacyjnym MC_C0B1MC3 z równaniem IOB_C0B5MC3, czyli bezpośrednio P60 EV_IN. Baseline: P16 jest wyjściem rejestru DFFCE na rising FCLK2, z kwalifikacją count=127/cal_str. To różnica funkcjonalna. tools/prove_readback_2026.py sprawdza P16=P60 metodą SAT z AND/OR czytanych bezpośrednio z fuse. Witness: EV_IN wzrasta między krawędziami CLK80, przy starym EVOUT=0; nowy model natychmiast daje 1, baseline nadal 0. Wynik w tests/readback-2026-ev-proof.json.', '', 'Nowy golden ma dodatkowy niezależny toggle STR: FB3/MC8 TFF, falling CT4=P63, T=1. Równolegle istnieje FB6/MC1 toggle warunkowy ENA jak wcześniej. Znaczenie dalszego przetwarzania obu ścieżek wymaga odzyskania struktury.', '', '## Dalsza analiza', '', 'Należy ustalić nowe state mapping, uprościć equations i porównać transition relations oraz osiągalne zachowanie. Liczba różnych pól jest placement-sensitive. Nie deklarujemy obecnie równoważności nowego golden z historycznym ani recovered HDL. Security/DONE/USERCODE poza QF nadal nieweryfikowane. Hardware nie programowany.', '', 'Dokumentacja IS_GND: [Project Combine device structure](https://prjcombine.org/coolrunner2/structure.html) opisuje programmed ground jako stałe wyjście 0. Nowy readback ma 54 takie pola zamiast wcześniejszych niewłączonych wyjść/keeper; nie są to 54 dodatkowe sygnały logiczne.', '', 'Polecenie: tools/analyze_readback_2026. Pełne equations: decoded/readback-2026/original.txt; szczegółowy diff: experiments/readback-2026/baseline-structural-diff.json.']
(R/'reports/readback-2026/baseline_comparison.md').write_text('\n'.join(lines)+'\n')
status=dict(active_golden='original/readback-2026/pm_cpld_gold_2026.jed',sha256=meta['sha256'],baseline_raw_distance=raw['hamming_distance'],baseline_canonical_difference_count=diff['structural_difference_count'],decoder_roundtrip_distance=0,vhdl_bit_identity_verified=False,formal_equivalence_verified=False,hardware_programmed=False)
(R/'reports/readback-2026/status.json').write_text(json.dumps(status,indent=2)+'\n')
print(json.dumps(status,indent=2))
