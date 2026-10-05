# Próba wymuszenia product terms przez dyrektywy ISE

Testowano rzeczywiste XST/ngdbuild/cpldfit/hprep6 na XC2C128-7-VQ100. Zachowano wszystkie źródła, raporty i wyniki w experiments/matching-2026/directive-*.

| Wariant | Fuse diff | SAT 49 rejestrów |
|---|---:|---|
| wcześniejszy speed build | 380 | PASS |
| jawne zerowanie cal_sample tylko gdy poprzedni stan=1 | 346 | PASS |
| ten sam kod + KEEP na cal_sample i c_count9 | 346 | PASS |
| ten sam kod + NOREDUCE na cal_sample i c_count9 | 822 | PASS |
| MAXPT=3 na obu tych sygnałach | 868 | PASS |
| NOREDUCE na raw_edge/raw_stretch | 348 | PASS |
| COLLAPSE tylko na c_count9 | 346 | PASS |
| MAXPT=3 tylko na c_count9 | 346 | PASS |
| LOC raw_edge=FB2_P0 (probe) | build failed | — |

Wariant 346 promowano jako aktualny recovered HDL. Źródło jawnie warunkuje clear rejestru cal_sample jego poprzednim stanem. To odtwarza golden CE equation bez dodawania nieskutecznego KEEP do głównego UCF. GHDL: 67430 golden vectors PASS; actual fitted JED: 49/49 UNSAT, init/clocks PASS. Wszystkie istniejące pin/FF LOC zachowano; MC configuration, ZIA i globals nadal identyczne.

Nie uzyskano dokładnego rozmieszczenia pojedynczych product terms dyrektywami. LOC FB2_P0 został odrzucony przez ngdbuild: obiekty NET raw_edge nie zawierają ani nie sterują instancjami odpowiedniego typu; constraint usunięto. MAXPT określa limit liczby terms, nie indeks fizycznego wiersza. KEEP zachowuje węzeł, NOREDUCE zmienia optymalizację, COLLAPSE łączy logikę; ich przyjęcie nie jest potwierdzeniem PT placement locking.

Jedna odrzucona składnia nie dowodzi, że każda forma dokładnego lockowania jest niemożliwa. Nie znaleziono działającej dyrektywy PT-row placement. Pozostała droga to kontrola reprezentacji równań/alokatora lub jawny backend implementacyjny; decode→assemble golden=0 nie będzie przedstawiane jako sukces native VHDL→ISE.

W aktualnym wyniku comb enable cal_sample jest już zgodny nawet na poziomie literal cover. Różne cover pozostaje tylko w FB1/MC7 (c_count9). Pozostałe zmiany są permutacją AND rows i odpowiednich OR connections. Bit identity i timing equivalence pozostają niepotwierdzone.

Dokumentację lokalnych property mappings sprawdzono w ISE/data/cpld.prp. Próba pobrania oficjalnego UG625: AMD URL 404, legacy Xilinx URL zwrócił HTML, zachowany jako experiments/logs/ug625-download-response.html. Nie użyto go jako PDF ani dowodu wsparcia nieznanych constraints.
