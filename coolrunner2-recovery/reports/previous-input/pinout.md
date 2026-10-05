# Pinout FIT PM12

Źródło: dołączony PDF, arkusz 10/34 (DD18), wizualnie sprawdzony. Nazwy HDL dopasowano do równań golden JED; brak historycznego UCF. Kierunki Gate_STR1 wynikają także z obwodu na arkuszu 12.

| Pin | Zasób | Sieć | HDL | Kierunek JED | Otoczenie | Funkcja specjalna |
|---:|---|---|---|---|---|---|
| 1 | IOB_C0B2MC2 | NC | — | NC | unconnected | GOE2 |
| 2 | IOB_C0B2MC1 | NC | — | NC | unconnected | GOE3 |
| 3 | IOB_C0B0MC15 | NC | — | NC | unconnected | GOE0 |
| 4 | IOB_C0B0MC14 | NC | — | NC | unconnected | GOE1 |
| 5 | VCCAUX | P3V3 | — | power | power/ground | VCCAUX |
| 6 | IOB_C0B0MC12 | NC | — | NC | unconnected |  |
| 7 | IOB_C0B0MC11 | NC | — | NC | unconnected |  |
| 8 | IOB_C0B0MC10 | NC | — | NC | unconnected |  |
| 9 | IOB_C0B0MC5 | NC | — | NC | unconnected |  |
| 10 | IOB_C0B0MC4 | NC | — | NC | unconnected |  |
| 11 | IOB_C0B0MC3 | NC | — | NC | unconnected |  |
| 12 | IOB_C0B0MC2 | NC | — | NC | unconnected |  |
| 13 | IOB_C0B0MC0 | NC | — | NC | unconnected |  |
| 14 | IOB_C0B1MC1 | NC | — | NC | unconnected |  |
| 15 | IOB_C0B1MC2 | NC | — | NC | unconnected |  |
| 16 | IOB_C0B1MC3 | EV_OUT_ | EV_out | output | event-chain output |  |
| 17 | IOB_C0B1MC4 | NC | — | NC | unconnected |  |
| 18 | IOB_C0B1MC5 | ADCA_D11 | ADC0<11> | input | ADC A digital data |  |
| 19 | IOB_C0B1MC10 | ADCA_D10 | ADC0<10> | input | ADC A digital data |  |
| 20 | VCCIO0 | P3V3 | — | power | power/ground | VCCIO0 |
| 21 | GND | GND | — | power | power/ground | GND |
| 22 | IOB_C0B1MC12 | ADCA_D9 | ADC0<9> | input | ADC A digital data | GCLK0 |
| 23 | IOB_C0B1MC13 | ADCA_D7 | ADC0<7> | input | ADC A digital data | GCLK1 |
| 24 | IOB_C0B1MC14 | ADCA_D8 | ADC0<8> | input | ADC A digital data | CDR |
| 25 | GND | GND | — | power | power/ground | GND |
| 26 | VCCINT | P1V8 | — | power | power/ground | VCCINT |
| 27 | IOB_C0B1MC15 | ADC_CLK | CLK80 | input | ADC clock fanout, ADC clock distribution | GCLK2 |
| 28 | IOB_C0B3MC0 | ADCA_D6 | ADC0<6> | input | ADC A digital data | DGE |
| 29 | IOB_C0B3MC3 | ADCA_D5 | ADC0<5> | input | ADC A digital data |  |
| 30 | IOB_C0B3MC4 | ADCA_D4 | ADC0<4> | input | ADC A digital data |  |
| 31 | GND | GND | — | power | power/ground | GND |
| 32 | IOB_C0B3MC5 | ADCA_D3 | ADC0<3> | input | ADC A digital data |  |
| 33 | IOB_C0B3MC6 | ADCA_D2 | ADC0<2> | input | ADC A digital data |  |
| 34 | IOB_C0B3MC10 | ADCA_D1 | ADC0<1> | input | ADC A digital data |  |
| 35 | IOB_C0B3MC11 | ADCA_D0 | ADC0<0> | input | ADC A digital data |  |
| 36 | IOB_C0B3MC12 | ADCB_D11 | ADC1<11> | input | ADC B digital data |  |
| 37 | IOB_C0B3MC13 | ADCB_D10 | ADC1<10> | input | ADC B digital data |  |
| 38 | VCCIO0 | P3V3 | — | power | power/ground | VCCIO0 |
| 39 | IOB_C0B3MC14 | ADCB_D9 | ADC1<9> | input | ADC B digital data |  |
| 40 | IOB_C0B3MC15 | ADCB_D8 | ADC1<8> | input | ADC B digital data |  |
| 41 | IOB_C0B7MC15 | ADCB_D7 | ADC1<7> | input | ADC B digital data |  |
| 42 | IOB_C0B7MC14 | ADCB_D6 | ADC1<6> | input | ADC B digital data |  |
| 43 | IOB_C0B7MC13 | ADCB_D5 | ADC1<5> | input | ADC B digital data |  |
| 44 | IOB_C0B7MC12 | ADCB_D4 | ADC1<4> | input | ADC B digital data |  |
| 45 | TDI | CPLD_TDI | — | input | JTAG chain | TDI |
| 46 | IOB_C0B7MC11 | ADCB_D3 | ADC1<3> | input | ADC B digital data |  |
| 47 | TMS | CPLD_TMS | — | input | JTAG chain | TMS |
| 48 | TCK | CPLD_TCK | — | input | JTAG chain | TCK |
| 49 | IOB_C0B7MC5 | ADCB_D2 | ADC1<2> | input | ADC B digital data |  |
| 50 | IOB_C0B7MC3 | ADCB_D1 | ADC1<1> | input | ADC B digital data |  |
| 51 | VCCIO0 | P3V3 | — | power | power/ground | VCCIO0 |
| 52 | IOB_C0B7MC2 | ADCB_D0 | ADC1<0> | input | ADC B digital data |  |
| 53 | IOB_C0B7MC1 | INTA_G_DRV | CLK20_P | output | Integrator A gate driver |  |
| 54 | IOB_C0B5MC15 | INTB_G_DRV | CLK20_N | output | Integrator B gate driver |  |
| 55 | IOB_C0B5MC13 | NC | — | NC | unconnected |  |
| 56 | IOB_C0B5MC11 | NC | — | NC | unconnected |  |
| 57 | VCCINT | P1V8 | — | power | power/ground | VCCINT |
| 58 | IOB_C0B5MC5 | NC | — | NC | unconnected |  |
| 59 | IOB_C0B5MC4 | NC | — | NC | unconnected |  |
| 60 | IOB_C0B5MC3 | EV_IN_ | EV | input | event-chain input |  |
| 61 | IOB_C0B5MC2 | NC | — | NC | unconnected |  |
| 62 | GND | GND | — | power | power/ground | GND |
| 63 | IOB_C0B5MC1 | CFD_OUT | STR | input | DD1 pin7 LVPECL→LVTTL receiver output, sheet 12 |  |
| 64 | IOB_C0B5MC0 | Gate_STR1_o | ENA | input | DD1 pin6 Gate receiver output, sheet 12 |  |
| 65 | IOB_C0B4MC0 | NC | — | NC | unconnected |  |
| 66 | IOB_C0B4MC1 | NC | — | NC | unconnected |  |
| 67 | IOB_C0B4MC2 | NC | — | NC | unconnected |  |
| 68 | IOB_C0B4MC4 | NC | — | NC | unconnected |  |
| 69 | GND | GND | — | power | power/ground | GND |
| 70 | IOB_C0B4MC6 | NC | — | NC | unconnected |  |
| 71 | IOB_C0B4MC10 | NC | — | NC | unconnected |  |
| 72 | IOB_C0B4MC11 | NC | — | NC | unconnected |  |
| 73 | IOB_C0B4MC12 | NC | — | NC | unconnected |  |
| 74 | IOB_C0B4MC13 | NC | — | NC | unconnected |  |
| 75 | GND | GND | — | power | power/ground | GND |
| 76 | IOB_C0B4MC14 | NC | — | NC | unconnected |  |
| 77 | IOB_C0B6MC0 | NC | — | NC | unconnected |  |
| 78 | IOB_C0B6MC1 | NC | — | NC | unconnected |  |
| 79 | IOB_C0B6MC3 | NC | — | NC | unconnected |  |
| 80 | IOB_C0B6MC4 | NC | — | NC | unconnected |  |
| 81 | IOB_C0B6MC5 | Gate_STR1_i | CLK40 | output | DA2/R1/R9 gate shaping input, sheet 12 |  |
| 82 | IOB_C0B6MC10 | STR1_ | DV | output | FPGA data-valid input |  |
| 83 | TDO | CPLD_TDO | — | output | JTAG chain | TDO |
| 84 | GND | GND | — | power | power/ground | GND |
| 85 | IOB_C0B6MC12 | DI12_ | DOUT<12> | output | FPGA ADC data bus |  |
| 86 | IOB_C0B6MC13 | DI11_ | DOUT<11> | output | FPGA ADC data bus |  |
| 87 | IOB_C0B6MC14 | DI10_ | DOUT<10> | output | FPGA ADC data bus |  |
| 88 | VCCIO1 | P1V8 | — | power | power/ground | VCCIO1 |
| 89 | IOB_C0B6MC15 | DI9_ | DOUT<9> | output | FPGA ADC data bus |  |
| 90 | IOB_C0B2MC15 | DI8_ | DOUT<8> | output | FPGA ADC data bus |  |
| 91 | IOB_C0B2MC14 | DI7_ | DOUT<7> | output | FPGA ADC data bus |  |
| 92 | IOB_C0B2MC13 | DI6_ | DOUT<6> | output | FPGA ADC data bus |  |
| 93 | IOB_C0B2MC12 | DI5_ | DOUT<5> | output | FPGA ADC data bus |  |
| 94 | IOB_C0B2MC10 | DI4_ | DOUT<4> | output | FPGA ADC data bus |  |
| 95 | IOB_C0B2MC6 | DI3_ | DOUT<3> | output | FPGA ADC data bus |  |
| 96 | IOB_C0B2MC5 | DI2_ | DOUT<2> | output | FPGA ADC data bus |  |
| 97 | IOB_C0B2MC4 | DI1_ | DOUT<1> | output | FPGA ADC data bus |  |
| 98 | VCCIO1 | P1V8 | — | power | power/ground | VCCIO1 |
| 99 | IOB_C0B2MC3 | DI0_ | DOUT<0> | output | FPGA ADC data bus | GSR |
| 100 | GND | GND | — | power | power/ground | GND |

## Sprzeczności i ograniczenia

- Arkusz 10 opisuje pin 64 jako CLK40 out; golden konfiguruje go jako wejście ENA. Pin 81 jest wyjściem CNT(0). Te ustalenia zgadzają się z kierunkiem buforów arkusza 12.
- Etykieta ENA in przy ADCB_D10 jest luźną adnotacją, a nie połączeniem elektrycznym. ENA jest pinem 64, co potwierdza T input FB6/MC1.
- ADCA_D10_/ADCA_D11_ i ADCB_D11_ mają lokalne etykiety z podkreśleniem, lecz porty arkusza bez niego. Zachowano nazwy portów; nie interpretowano podkreślenia jako inwersji.
- Speed grade i VQ100 w JED są metadanymi, nie odczytem identyfikatora/speed bin fizycznego krzemu. Schemat deklaruje XC2C128-7VQG100C.
- Wartości LOW/HIGH konfiguracji banków nie są pomiarem napięcia zasilania. Schemat wskazuje bank 1 (ISE bank 0) 3.3 V i bank 2 (ISE bank 1) 1.8 V. Rzeczywiste buildy ISE potwierdziły identyczność konfiguracji banków. Recovered UCF ustala piny i 18 wyjść SLEW=SLOW; baseline UCF ustala tylko piny.
