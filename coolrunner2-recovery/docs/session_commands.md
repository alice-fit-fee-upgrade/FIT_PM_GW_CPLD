# Indeks komend i usterek sesji

To odtworzony indeks wstępnego discovery; surowe tool outputs istnieją w rozmowie. Od wdrożenia run_logged.py wykonywane pipeline argv/cwd/UTC/exit code są zapisywane w experiments/commands.jsonl. Pełny udany przebieg automatyczny jest w experiments/bootstrap.log i reproduce.log. Wstępne wywołania nie mają kompletnego surowego zapisu terminala w repo; nie ukrywamy tej luki audytu.

## Discovery

```bash
pwd
cat /home/codex-hil/AGENTS.md
command -v cargo rustc xst curl python3 pdftotext docker yosys ghdl
find /opt /home/codex-hil -iname '*ise*' -o -name xst -o -name cpldfit
find /opt /usr/local /home/codex-hil/.local -type f -name settings64.sh
git clone --mirror https://github.com/alice-fit-fee-upgrade/FIT_PM_GW_CPLD.git known_hdl/upstream.git
git clone known_hdl/upstream.git known_hdl/checkout
git clone --mirror https://github.com/r-smalec/FIT_PM_GW_CPLD.git known_hdl/fork-r-smalec.git
curl -fsSL https://api.github.com/repos/alice-fit-fee-upgrade/FIT_PM_GW_CPLD/forks -o known_hdl/forks.json
git clone https://github.com/alice-fit-fee-upgrade/FIT_PM12_PCB.git schematic/upstream
git clone https://github.com/azonenberg/openfpga.git toolchain/openfpga
git clone https://github.com/prjunnamed/prjcombine.git toolchain/prjcombine
git --git-dir=known_hdl/upstream.git log --all --oneline -- '*amplcpld*'
git --git-dir=known_hdl/fork-r-smalec.git log --all --oneline -- '*amplcpld*'
git --git-dir=known_hdl/upstream.git log --all --format=fuller --name-status
git --git-dir=known_hdl/fork-r-smalec.git log --all --format=fuller --name-status
git --git-dir=known_hdl/upstream.git bundle create known_hdl/upstream.bundle --all
git --git-dir=known_hdl/fork-r-smalec.git bundle create known_hdl/fork-r-smalec.bundle --all
git --git-dir=known_hdl/upstream.git bundle verify known_hdl/upstream.bundle
git --git-dir=known_hdl/fork-r-smalec.git bundle verify known_hdl/fork-r-smalec.bundle
pdftotext -layout schematic/FIT_PM12.pdf schematic/FIT_PM12.txt
pdftoppm -f 10 -l 10 -scale-to 2200 -png -singlefile schematic/FIT_PM12.pdf schematic/cpld-page10
pdftoppm -f 12 -l 12 -scale-to 2200 -png -singlefile schematic/FIT_PM12.pdf schematic/gate-page12
```

Wejściowe attachments skopiowano bez nadpisania do original/amplcpld.jed i schematic/FIT_PM12.pdf. Zachowano SHA256; końcowe sprawdzenie attachment JED daje ten sam hash. PDF arkusz 13 obejmuje PSU, więc wcześniejszy screenshot gate-page13 nie jest źródłem kierunków Gate. Właściwy arkusz to 12; raport poprawiono po wizualnym sprawdzeniu.

## Narzędzia i obejścia

- `rg` nie jest zainstalowany. Pierwsze próby wyszukiwania nie znalazły plików przez brak programu; użyto find/grep.
- `cargo/rustc` początkowo nieobecne. Pobrano https://sh.rustup.rs do toolchain/rustup-init.sh i uruchomiono `sh ... -y --profile minimal`. Zainstalowano Rust 1.99.0; source revisions i Cargo.lock zachowano. Build xc2bit miał niegroźny warning lifetime, log zachowany.
- `python3 -m venv toolchain/venv` nie zadziałał z powodu ensurepip. Użyto zachowanego https://bootstrap.pypa.io/get-pip.py w lokalnym venv. bootstrap używa teraz `--without-pip` i ten sam helper. Sympy 1.14.0, z3-solver 5.1.0.0, mpmath 1.3.0; wymagania i wheel hashes w requirements.lock. Sympy ostatecznie nie jest wymagany przez proof.
- `sudo -n true` zwróciło password required; nie wykonano instalacji z sudo. `apt-get download ghdl-mcode ghdl-common libgnat-13` pobrało .deb; `dpkg-deb -x` rozpakował je lokalnie. Początkowe GHDL_PREFIX kończące się na mcode nie znajdowało std library; właściwy prefiks mcode/vhdl zapisano w tools/ghdl.
- xc2bit decoding działa, ale ZIA_MAP_128 ma placeholders i roundtrip różni 244 fuse. Nie użyto błędnego netlistu. Project Combine roundtrip różni 0 fuse. Pierwszy compare_jed nie obsługiwał braku F record w kompletnym generated JED; parser poprawiono: brak F jest dozwolony tylko przy pełnym pokryciu fuse.
- Readback ma makrokomórki buried bez pól IOB/REG_D_MUX. Dekoder/model używa dla nich jawnego default XOR zgodnego z architekturą.
- Download vendor docs `cgd.pdf`/`ds094.pdf` z amd.com kończył się HTTP/2 INTERNAL_ERROR lub brakiem odpowiedzi po przełączeniu HTTP/1.1. Zatrzymano wyłącznie własny zawieszony proces curl. Nie zapisano kompletnego lokalnego PDF dokumentacji vendor.
- Oficjalny link ISE Linux kieruje do account.amd.com i wymaga sesji, redirect errorcode=19. Próba guessed URL download.amd.com/direct/ise/14.7/... dała HTTP404. tools/build_ise baseline kończy się exit3 z komunikatem brak ISE_SETTINGS. Nie utworzono baseline.jed.

Aktualny, odtwarzalny zestaw komend do build/decode/proof/simulation jest w Makefile oraz tools/bootstrap. Nie trzeba odtwarzać nieudanych prób.

## New physical readback target (2026)

New input preserved separately with SHA256 1748e3c4...556f3d95; old artifacts archived under previous-input. Actual reproducible commands are tools/analyze_readback_2026, tools/verify_readback_2026.py, tools/build_ise readback-2026, tools/finish_readback_2026.py, make reproduce and make reproduce-previous. These pipeline calls, argv, logs and exit codes are recorded in experiments/commands.jsonl. Interactive discovery/source edits are available in session tool output; this document is a summary, not a complete raw transcript.

Experiment sequence: unlocked functional recovered HDL; golden LOC/default IOSTANDARD; explicit TFF counter; nomlopt; density/EV Schmitt. Source snapshots and artifacts are preserved in experiments/readback-2026/fit-* and final experiments/ise-readback-2026. New proof is 49-state; prior 39-state proof is scoped to prior input. Both workflows were executed successfully after moving primary artifacts to the new target.

## Native matching, speed fitter

`make reproduce` passed with 380 native fuse differences, all in FB1/FB2 AND/OR. ZIA, all MC fields, globals and placement match. 49/49 fitted-state SAT and 67430 GHDL vectors passed. `tools/report_matching.py` indexes isolated experiments; `tools/analyze_pt_allocation.py` separates PT permutation from literal-cover changes. No hardware commands were run. Main source unchanged; main fitter changed density to speed. Exact cpldfit argv and source hashes are stored in experiments/commands.jsonl and experiment.json.
