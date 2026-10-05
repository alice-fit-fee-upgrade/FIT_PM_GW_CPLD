# Analiza nowego JEDEC

SHA256 `1748e3c4f0f6152bd395d0a88df1e3a2214ec31fe0e704e11e77b854556f3d95`; oryginalny załącznik i zachowana kopia są identyczne. QF=55341, pełne pokrycie. C checksum AC57 i transmission E87B poprawne.

Header:
```
JEDEC Programming File for /home/ise/Desktop/bits/pm_cpld_gold_2026.jed
Date: Fri Jul 10 10:09:57 2026
```
Wszystkie records poza L:
```
QF55341
QP0
F0
X0
N DEVICE xc2c128-XXXXX
CAC57
```

DEVICE xc2c128-XXXXX i QP0 nie określają package/speed. Target VQ100/-7 pochodzi z użytkownika i schematu. N VERSION nie występuje. Nagłówek i ścieżka /home/ise/Desktop są metadanymi programu eksportującego, nie fuse i nie dowodem kompilatora. Użytkownik podał ten plik jako rzeczywisty readback; narzędzie/komenda/IDCODE i log sesji nie są jeszcze dostarczone.

Security/G record brak; nie określamy protection/DONE/USERCODE spoza QF. Układ 8 FB, 128 MC, 49 inferred used registers. Project Combine decode→assemble: 0 fuse różnic. Global configuration:
```
BANK0_IBUF_VOLT=HIGH
BANK0_OBUF_VOLT=HIGH
BANK1_IBUF_VOLT=HIGH
BANK1_OBUF_VOLT=HIGH
CLKDIV_DELAY_ENABLE=0
CLKDIV_DIV=16
CLKDIV_ENABLE=0
DGE_ENABLE=0
FCLK0_ENABLE=0
FCLK1_ENABLE=0
FCLK2_ENABLE=1
FOE0_MUX=NONE
FOE1_MUX=NONE
FOE2_MUX=NONE
FOE3_MUX=NONE
FSR_ENABLE=0
FSR_INV=1
TERM_MODE=KEEPER
VREF_ENABLE=0
```

HIGH to wybór bufora, nie pomiar zasilania. FCLK2 włączony, pozostałe clocks/GSR/GTS/divider/delay/DataGate/VREF wyłączone. Wszystkie użyte FF bez async set/reset; 48 INIT=1 i CLK20_N INIT=0. Nieużywane I/O programmed ground, nie keeper. Szczegółowy pinout i schemat są zachowane.
