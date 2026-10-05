# Delta semantyczna

**Nie ma delty konfiguracji między historycznym HDL skompilowanym w ISE 14.7 a produkcyjnym golden: 0/55341 fuse, canonical diff 0.** Nie ma dowodu brakującego register, zmienionego countera, delay, mux ani event-chain.

Mapowanie 39 rejestrów: decoded/previous-input/state_map.json. Golden equations/config: decoded/previous-input/original.json i original.txt. SAT sprawdził wszystkie 39 next-state relations; tests/transition-proof.json zawiera wyniki per register.

Recovered czytelny VHDL zachowuje strukturę historycznej implementacji: counter 7-bit saturating, delay 8-stage, ADC mux z hold i CE=dly6, event synchronizer 3-stage oraz str toggle przy falling CFD_OUT i ENA. Używa numeric_std i jawnej inicjalizacji 38 FF=0. Complementary CLK20_N jest jawnym FF INIT=1, D=XNOR(CNT0,CNT1) na falling FCLK2 (FB6/MC16). Historyczne not CNT1 zostało przez fitter zaimplementowane dokładnie tym samym FF; invariant CLK20_N=not CNT1 jest zachowany w osiągalnych stanach.

Pierwszy recovered build miał tylko 18 zmian IOB_SLEW FAST zamiast SLOW. Wszystkie equations, registers, placement, routing, globals i unused były już identyczne. Dodanie 18 jawnych NET SLEW=SLOW w recovered/amplcpld.ucf dało końcowe **0 fuse i 0 canonical differences**. Pełny pierwszy diff i artefakty: reports/recovered_before_slew_diff.md oraz experiments/ise-recovered-before-slew/.

Historyczny HDL bez init ma U w symulacji; ISE nadaje fizyczne init zgodne z golden, co teraz potwierdzono rzeczywistym baseline. Recovered opisuje te stany jawnie. Nie dodawano hipotetycznych funkcji produkcyjnych.
