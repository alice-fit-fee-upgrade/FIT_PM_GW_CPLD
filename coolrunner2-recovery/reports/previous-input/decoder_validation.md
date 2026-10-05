# Walidacja dekoderów

Project Combine commit 234343d23e737e57f2727630e19008b509d7d522, databases/coolrunner2.zstd. Obsługuje 8 FB, 128 MC, 40 ZIA/FB, 56 PT/FB, OR/XOR, FF, clocks, set/reset, OE, IOB i globalne pola.

Disassemble→assemble golden JED: Hamming distance **0 / 55341**. Porównano wszystkie logical device fuse, niezależnym tools/jedlib.py. Metadane tekstowe nie są identyczne. To walidacja bezstratności konfiguracji, nie dowód poprawności fizycznej wszystkich interpretacji mapy.

xc2bit commit f9ae535d0372c246075d1bb05a409adaed0135e7 kompiluje się. Jednak ZIA_MAP_128 zawiera placeholder IBuf(0) dla każdego źródła. Roundtrip różni się w 244 fuse. Jego initial register polarity opis jest także niespójny z Project Combine i bitstream mapping. Output zachowano jako decoded/xc2bit-untrusted-zia.txt, NIE użyto go do odzyskania logiki. Błędny netlist przeniesiono do experiments/xc2bit-untrusted.netlist.json.

Nie potrzeba charakterizacji nieznanej ZIA z ISE: pełna mapa jest już dostępna w Project Combine. Narzędzia JEDEC upstream jedec i prjcombine-jed są zachowane wraz z repo. Nasz parser dodatkowo kontroluje granice, pokrycie i checksums.

openFPGALoader implementuje XC2C128 programming/read flow w src/xilinx.cpp (snapshot docs/openfpgaloader-xilinx.cpp); nie zastępuje disassemblera równań. Nie uruchomiono żadnej komendy sprzętowej.

Źródła: [Project Combine](https://prjcombine.org/coolrunner2/index.html), [mapa XC2C128](https://prjcombine.org/coolrunner2/devices/xc2c128.html), [xc2bit](https://github.com/azonenberg/openfpga/tree/master/src/xc2bit), [openFPGALoader](https://github.com/trabucayre/openFPGALoader/blob/master/src/xilinx.cpp).
