# Baseline KNOWN VHDL + schematic pinout + ISE 14.7 vs golden

Rzeczywisty build historycznych, niezmienionych amplcpld.vhd i comps.vhd: **{'raw': 0, 'canonical': 0}**. Zero oznacza identyczność wszystkich 55341 logicznych fuse i wszystkich pól canonical configuration.

Źródła known_hdl/baseline/ z upstream a6c492e; constraints known_hdl/baseline.ucf (46 połączeń odtworzonych ze schematu). Target xc2c128-7-vq100. XST Speed/level 1; cpldfit unused/terminate keeper. Pipeline xst → ngdbuild → cpldfit → hprep6, wersja P.20131013. Uruchomienie: make baseline.

Pełny raport: baseline_structural_diff.md. Artefakty, równania, raporty i VM6: experiments/ise-baseline/. Raw i structural diff mają zero różnic: zajętość FB/MC, equations, 39 registers, ZIA, PLA AND/OR, pin configuration, globals oraz unused resources są identyczne. Fitter raportuje 41 logic MC (39 FF + 2 combinational), 86 PT i 46 pins. Inferred used w decoderze uwzględnia także wejściowe pads i nie jest liczbą logic MC.

Wynik potwierdza reprodukcję przez ISE 14.7; nie identyfikuje jednoznacznie kompilatora pierwotnego firmware. N VERSION z readback nadal jest metadanymi programu odczytu.

Ostrzeżenia BUFG na A9/A7: pin GCK0/GCK1 jest używany jako zwykłe wejście ADC, BUFG jest ignorowany. Dekodowany rezultat potwierdza wyłącznie FCLK2 na pin27. Ostrzeżenie domyślnej ścieżki repository nie wpłynęło na wynik. Logi zachowano.
