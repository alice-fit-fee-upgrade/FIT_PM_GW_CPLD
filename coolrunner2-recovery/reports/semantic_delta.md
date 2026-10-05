# Potwierdzona delta nowego odczytu

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
