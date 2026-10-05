Wersja podstawowa po angielsku: [ise.md](ise.md).

# Działające ISE 14.7 CLI

Instalator dostarczony przez użytkownika: `/tmp/Xilinx_ISE_DS_Lin_14.7_1015_1.tar`. SHA256: `cee0b046c1bbcfafcae59a96c7596c55c5477628c39bafefff8992cb8d33adaa`. Wersja fittera/XST P.20131013. Instalacja WebPACK: `/home/codex-hil/.local/opt/xilinx/14.7/ISE_DS`. XST, ngdbuild, cpldfit i hprep6 działają z CLI; historyczne buildy odtwarzają wszystkie fuse poprzedniego wejścia; zakres nowego odczytu opisano poniżej. W tej sesji nie był potrzebny dodatkowy plik licencji ani login/hasło do AMD.

Vendor archive i zainstalowane binaries pozostają poza repo. Zachowano hash, archive inventory, batch config oraz logi. Lokalny userspace bez sudo: legacy ncurses5/tinfo5 są rozpakowane wyłącznie w toolchain/ise-compat/root. Pakiety Ubuntu 6.3-2ubuntu0.3 i ich hashes są zachowane w repo.

## Odtworzenie instalacji

Własny legalnie uzyskany instalator umieść pod wskazaną ścieżką. Dostosuj destination_dir w toolchain/ise-install.batch do swojego użytkownika. Wywołanie helpera akceptuje wyświetlane warunki instalacji producenta. Sterowniki kabli i GUI zarządzania licencją są wyłączone.

```bash
sha256sum /tmp/Xilinx_ISE_DS_Lin_14.7_1015_1.tar
mkdir -p "$HOME/.local/opt/ise-installer"
tar -xf /tmp/Xilinx_ISE_DS_Lin_14.7_1015_1.tar -C "$HOME/.local/opt/ise-installer"
sha256sum -c toolchain/ise-compat/SHA256SUMS
mkdir -p toolchain/ise-compat/root
for package in toolchain/ise-compat/packages/*.deb; do
  dpkg-deb -x "$package" toolchain/ise-compat/root
done
python3 tools/install_ise_cli.py "$HOME/.local/opt/ise-installer/Xilinx_ISE_DS_Lin_14.7_1015_1"
make reproduce
```

Domyślny settings64.sh jest pod `$HOME/.local/opt/xilinx/14.7/ISE_DS/`. Inny prefix: `ISE_SETTINGS=/path/to/ISE_DS/settings64.sh make reproduce`. Jeśli dana instalacja wymaga licencji, użyj standardowego XILINXD_LICENSE_FILE/LM_LICENSE_FILE; nie zapisuj sekretów w repo.

## Napotkane problemy

- Installer wymaga libncurses.so.5; rozwiązanie to lokalnie rozpakowane ncurses5/tinfo5, bez zmiany systemu.
- stdin=EOF powodował powtarzanie promptu EULA. Przerwano własny proces; nieudany log jest bardzo duży; w publikowanym snapshot zachowano go bezstratnie jako ise-install.log.gz. Udana instalacja była wykonana w PTY, log ise-install-interactive.log. Helper install_ise_cli.py odtwarza obsługę promptów; sam helper nie został sprawdzony przez ponowną instalację całego ISE.
- settings64.sh interpretuje argument pozycyjny jako prefix instalacji. build_ise przekazuje jawnie dirname(settings), aby argument baseline/recovered nie stał się błędną ścieżką.
- Ostrzeżenia BUFG na A9/A7 dotyczą zwykłych wejść ADC na pinach GCK0/GCK1. Wynik ma jedynie aktywne GCK2/FCLK2, zgodnie z golden.

Pipeline i wszystkie argv/exit codes są w tools/build_ise oraz experiments/commands.jsonl. Artefakty XST/NGD/VM6/raport/JED są zachowane w experiments/ise-baseline i ise-recovered. Kontener w toolchain/ise-userspace pozostaje opcjonalną, nietestowaną alternatywą; potwierdzony jest lokalny userspace tego hosta.

## Placement i vendor maps — wcześniejsze wejście

Automatycznie wygenerowano recovered/placement_candidate.ucf na podstawie state_map.json. Nie był potrzebny: zwykłe pin constraints i ustawienia fittera już odtwarzają dokładnie placement, routing oraz product terms. Candidate LOC pozostaje eksperymentalny; nie deklarujemy przetestowanej obsługi każdej składni ani nazw po syntezie. Nie trzeba wymuszać nieużywanych GSR/GTS. Pin27 wskazuje GCK2.

ISE zawiera ISE/xbr/data/xc2c128.map oraz pliki BSD VQ100. Ścieżki/hashes zachowano w toolchain/ise-vendor-map-hashes.txt, bez kopiowania vendor maps do repo. Mapa obejmuje także fizyczne security/user fields poza logical QF; ten projekt nie weryfikuje ich stanu. Project Combine dostarcza kompletną mapę konfiguracji, więc nie było potrzeby charakterizacji formatów od zera.

## Aktualny readback 2026

Poprzednie zero-diff buildy dotyczą amplcpld.jed z 2024. Aktualny target pm_cpld_gold_2026.jed ma inną logikę. Nowy recovered build używa LOC wszystkich wewnętrznych FF, jawnego toggle countera, -unused ground -terminate keeper -iostd LVCMOS33 -nomlopt -optimize speed, SLOW outputs z wyjątkiem FAST CLK40 i SCHMITT_TRIGGER na EV. Pozostaje 346 fuse różnic wyłącznie w PLA AND/OR; 49/49 next-state functions/init/clocks i IOB/globals/placement są sprawdzone. Reports/remaining_differences.md wyjaśnia regiony. Wszystkie faktycznie testowane LOC przyjęto bez unmatched NET; native PT-row lock przez UCF nie został znaleziony. Dodatkowy post-fit VM6 implementation lock daje 0 fuse różnic; patrz reports/implementation_lock.md.
