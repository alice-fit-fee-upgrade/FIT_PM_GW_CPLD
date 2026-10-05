# Źródła i licencje

Golden JEDEC i FIT PM12 PDF pochodzą od użytkownika. PDF zawiera notę CERN OHL v2; zachowano cały dokument. Publiczny HDL upstream/fork zachowano wraz z pełną historią i komentarzami; brak pliku licencji w wybranych drzewach nie oznacza przeniesienia praw.

Project Combine: https://github.com/prjunnamed/prjcombine, commit 234343d23e737e57f2727630e19008b509d7d522, LICENSE-0BSD.txt i LICENSE-Apache-2.0.txt w źródłach. openfpga/xc2bit: https://github.com/azonenberg/openfpga, commit f9ae535d0372c246075d1bb05a409adaed0135e7, BSD-2-Clause comments w źródłach. Dekodery pobiera bootstrap i zachowuje je w workspace.

GHDL: GPL, Ubuntu source package https://launchpad.net/ubuntu/+source/ghdl/4.1.0+dfsg-0ubuntu2.1. Zachowane binarne .deb posiadają notices w toolchain/ghdl/usr/share/doc po rozpakowaniu. GNU runtime libgnat: https://launchpad.net/ubuntu/+source/gcc-13/13.3.0-6ubuntu2~24.04.1. To lokalne środowisko pracy, nie obraz zawierający vendor ISE.

Python packages, pinned versions i hashes: toolchain/requirements.lock. Z3/Sympy/mpmath zachowują własne notices w venv/site-packages.

Snapshot openFPGALoader xilinx.cpp jest materiałem badawczym z https://github.com/trabucayre/openFPGALoader, jego notices pozostają w pliku. Nie został skompilowany ani uruchomiony na sprzęcie. Xilinx ISE nie został dołączony/redystrybuowany; skrypt wykorzystuje lokalną instalację użytkownika.
