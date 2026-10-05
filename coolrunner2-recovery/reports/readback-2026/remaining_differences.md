# Pozostałe różnice recovered ISE → nowy golden

**346/55341 różnych fuse; 471 canonical field differences. Bit identity nie osiągnięto.**

| Obszar | Liczba fuse | Wyjaśnienie |
|---|---:|---|
| FB1 PLA AND | 230 | Different product-term literals/allocation and factoring. Raw-fuse SAT proves all state next functions equal; internal combinational propagation delay may differ. |
| FB1 PLA OR | 78 | Different product-term connections/order and XOR decomposition. Local transitions are proved equal, not physical timing. |
| FB2 PLA AND | 26 | Different product-term literals/allocation and factoring. Raw-fuse SAT proves all state next functions equal; internal combinational propagation delay may differ. |
| FB2 PLA OR | 12 | Different product-term connections/order and XOR decomposition. Local transitions are proved equal, not physical timing. |

Wszystkie 49 state assignments mają ten sam FB/MC. Clocks/init/SR są zgodne; globals i wszystkie fizyczne pola IOB (w tym slew i Schmitt) są identyczne. Nieużywane pads mają IS_GND w obu konfiguracjach. Nie ma różnicy funkcji przejścia; jest różnica realizacji Boolean equations i wewnętrznych połączeń. To może wpływać na propagation delays. Nie deklarujemy timing equivalence.

## Każde różne pole MC configuration

| Path | Golden | Candidate |
|---|---|---|

Pełna lista każdego różnego fuse z regionem/wyjaśnieniem: experiments/readback-2026/remaining-fuses.json. Wszystkie zmienione ZIA, AND i OR fields: experiments/ise-readback-2026/structural-diff.json. Nie przypisujemy tekstowych metadanych do device fuse differences.

Próby: baseline 1412; recovered bez LOC 1509; placement+default IOSTANDARD 1249; explicit TFF 978; nomlopt 978; density+EV Schmitt 976; speed fitter 380. Każdy build zachowany w experiments/readback-2026/fit-*/ lub final experiments/ise-readback-2026. Counter DFF→TFF i LOC wybierano na podstawie decoded modes/placement, nie ślepego score. Nie znaleziono potwierdzonego UCF sterującego dowolną alokacją PT/ZIA; dalsze exact match wymaga identyfikacji oryginalnego stylu źródła/opcji syntezy lub kontroli kolejności/minimalizacji product terms. Nie dowodzimy, że bit identity jest niemożliwe.
