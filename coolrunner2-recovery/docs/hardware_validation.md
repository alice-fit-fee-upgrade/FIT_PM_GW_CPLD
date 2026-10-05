# Późniejsza walidacja PM12

Nie wykonano programowania ani operacji JTAG. Golden Device pozostaje referencją. Ten plan nie jest zgodą na programowanie.

1. Zidentyfikuj fizyczny kanał i urządzenie DD18 instancji powtarzanego bloku PM12. Dokument zawiera 12 kanałów; readback nie identyfikuje kanału. Zapisz rewizję PCB, oznaczenie CPLD, IDCODE, napięcia VCCINT/VCCIO/VCCAUX, typ i poziomy adaptera.
2. Przed jakąkolwiek zmianą wykonaj dwa niezależne readbacki narzędziem wspierającym XC2C128. Zapisz surowe pliki, pełny log, wersję narzędzia i SHA256. Porównaj oba między sobą i z original/readback-2026/pm_cpld_gold_2026.jed przez compare_jed; porównanie bajtów tekstu może różnić się datą. Odczytaj security/USERCODE/status oddzielnie, jeżeli programator je udostępnia.
3. Najpierw obserwuj Golden Device pasywnie. Sonda/analizator musi być dopasowany do 1.8 V/3.3 V i mieć dostateczne pasmo dla CLK80. Nie podawaj sygnałów na istniejące aktywne wyjścia.
4. Zarejestruj ADC_CLK P27, CLK40/Gate_STR1_i P81, INTA_G_DRV P53, INTB_G_DRV P54, CFD_OUT P63, ENA/Gate_STR1_o P64, DV/STR1_ P82, EV_IN P60, EV_OUT P16, DI[12:0]. Próbkowanie synchroniczne ≥ kilka razy CLK80 i oscyloskop do setup/hold/gate shaping. Do rozdzielenia impulsów nanosekundowych potrzebny jest sprzęt o odpowiednim rzeczywistym paśmie, nie wyłącznie nominalnej częstotliwości próbkowania.
5. Sprawdź liczniki /2 i /4 z aktualizacją na opadającym CLK80; CLK20_N komplementuje CLK20_P. Delay/inverter register propaguje z własnym clock-to-out; idealna symulacja nie określa skew.
6. Przy ENA=0 falling STR nie przełącza str_div. Przy ENA=1 przełącza; str1 próbkowany przy falling CLK80 i starym CNT0=0, str2 przy rising CLK80. DV rejestruje dly6 OR cal_sample; data latch enable to ten sam OR. Mux przy CNT1=1 wybiera ADC0 i DI12=0, przy CNT1=0 wybiera ADC1 i DI12=1; inaczej trzyma poprzednie dane.
7. EV_OUT powinien kombinacyjnie podążać za EV_IN, z opóźnieniem propagacji pad→PLA→pad; sprawdź również krótki EV pulse między CLK80 edges. Przy braku STR sprawdź automatyczne impulsy cal_sample wynikające z 10-bit timer/restart. Timer inkrementuje przy CNT=11 do 1023; restart wymaga inhibit_pipe=0000 oraz cal_phase=CNT1. Raw STR path działa również przy ENA=0 i może hamować restart. DV jest rejestrowanym dly6 OR cal_sample; ADC latch enable jest tym samym OR. Wzorcowy przebieg wyliczaj z nowego decoded/readback-2026/original.json i tools/golden_model.py; nie używaj dawnego 7-bit/EV calibration modelu.
8. Programowanie wykonuj dopiero po wyraźnej późniejszej zgodzie, na układzie testowym lub po zatwierdzeniu backup/restore. Skrypt programujący musi wskazywać dokładny chain position/cable i candidate JED, bez security lock. Nie ma tu gotowej aktywnej komendy erase/program z domyślnym urządzeniem.

Przykładowy bezpieczny plik iMPACT do przygotowania identyfikacji (nie został uruchomiony):

```text
setMode -bs
setCable -port auto
identify
quit
```

Odczyt/programowanie z iMPACT trzeba skonfigurować na podstawie faktycznego wykrytego chain. Nie zgaduj pozycji. openFPGALoader jest alternatywą po sprawdzeniu wsparcia danego adaptera i readback formatu; jego domyślna ścieżka dla JED obejmuje programowanie, więc nie uruchamiaj jej jako rzekomego odczytu.

Test vectors logiczne: tests/readback-2026/vectors.txt, generowane deterministycznie. Nie są gotowym wzorcem do elektrycznego podania na całą płytkę, ponieważ ADC/clock/CFD są już napędzane przez istniejące układy.

Aktualny recovered JED ma 346 różnic fuse względem golden mimo dowodu funkcji Boolean. ZIA jest identyczne, lecz alokacja AND/OR różni się i równość wewnętrznych opóźnień nie została wykazana; nie traktuj go jako zweryfikowanego zamiennika czasowego. CLK40 na golden ma FAST slew, EV input SCHMITT, globals HIGH. Podczas readback zachowaj także dokładny tool/command/IDCODE/log, aby wykluczyć błąd eksportu.
