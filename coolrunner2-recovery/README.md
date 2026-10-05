# CoolRunner-II FIT PM12 recovery

Aktywny golden: `original/readback-2026/pm_cpld_gold_2026.jed`, dostarczony jako odczyt fizycznego CPLD. SHA256: `1748e3c4f0f6152bd395d0a88df1e3a2214ec31fe0e704e11e77b854556f3d95`.

**Nowy readback różni się od historycznego HDL/baseline o 1412 fuse i ma potwierdzone różnice funkcjonalne. Odzyskano nowy czytelny VHDL; jego faktyczny wynik kompilacji ISE ma 49/49 funkcji przejścia zgodnych z golden, wraz z init/clocks. Sam native fitter pozostawia 346 fuse różnic. Dodatkowy jawny implementation lock VM6 + hprep6 daje 0/55341 fuse różnic względem golden. Timing equivalence nie została wykazana.**

Poprzedni załącznik `original/amplcpld.jed` (hash 89a231fd…645e6) pozostaje zachowany. Dla niego oba poprzednie buildy miały zero różnic; ten wynik nie dotyczy nowego golden. Poprzednie źródła/decode/raporty są pod `*/previous-input/`. Oryginalne dane nie zostały zmienione. Sprzętu nie programowano.

## Odtworzenie

```bash
cd coolrunner2-recovery
make bootstrap
make reproduce
```

To wykonuje historyczny baseline, dekodowanie nowego golden i bezstratny roundtrip, strukturalny diff, SAT wszystkich 49 register transitions, symulację rzeczywistego recovered VHDL na 67430 wektorach, nowy build ISE, SAT faktycznego fitted JED oraz końcowe raporty. Workflow sprawdza również 0 fuse różnic po implementation lock. Sam native fitter nie jest bit-identical. `reports/status.json` jawnie zawiera `vhdl_bit_identity_verified=false`.

Ze świeżego checkoutu: Linux x86_64/glibc ≥2.38 dla zachowanych GHDL packages; git, make, Python3, dpkg-deb, C/C++ build tools, Rust/rustup 1.99.0. `make bootstrap` odtwarza przypięte decoder sources, Cargo locks, hashed Python dependencies, GHDL i compatibility libraries oraz pełne mirrors z Git bundles. Rust bootstrap jest w toolchain/rustup-init.sh. Biblioteki są rozpakowane lokalnie, bez sudo. Bootstrap wymaga internetu.

ISE dostarczony osobno: na tym hoście `$HOME/.local/opt/xilinx/14.7/ISE_DS`. Instalator, hash, userspace i obejścia opisano w [docs/ise.md](docs/ise.md). Inny prefix: `ISE_SETTINGS=/path/to/ISE_DS/settings64.sh make reproduce`. Vendor binaries/license nie są redystrybuowane. Na tym hoście CLI działa bez dodatkowego pliku licencji.

Historyczny workflow dla poprzedniego wejścia: `make reproduce-previous`. Nie nadpisuje aktualnych głównych recovered/decode/raportów.

## Artefakty

- [recovered/amplcpld_recovered.vhd](recovered/amplcpld_recovered.vhd), [amplcpld.ucf](recovered/amplcpld.ucf) i wynikowy JED — dotyczą nowego golden; kopie w recovered/readback-2026.
- [decoded/original.json](decoded/original.json), [original.txt](decoded/original.txt), state_map.json — nowy golden, wszystkie FB/MC/equations/configuration.
- [reports/baseline_comparison.md](reports/baseline_comparison.md), [semantic_delta.md](reports/semantic_delta.md), [final_equivalence.md](reports/final_equivalence.md) i [remaining_differences.md](reports/remaining_differences.md).
- experiments/readback-2026/remaining-fuses.json — każdy pozostały różny fuse, region i wyjaśnienie; experiments/ise-readback-2026 — pełny final fit/VM6/NGC/NGD/JED/logs/configuration/diff.
- tests/readback-2026 — golden i fitted SAT, wektory, GHDL evidence. Dowód EV_OUT=EV_IN: tests/readback-2026-ev-proof.json.
- tools/jedtool, decode_xc2c128, compare_jed, compare_config.py — narzędzia porównań. Główny decoder: Project Combine; xc2bit XC2C128 ZIA table jest niekompletna, zachowano jego wynik jako untrusted.
- known_hdl/*.bundle — pełna historia upstream i publicznego forka; variants.json i reports/history.md — źródła/hashes/historyczne artefakty.

PDF ma 34 arkusze, CPLD na 10, gate circuit na 12. P64/Gate_STR1_o jest ENA input; P81/Gate_STR1_i jest CLK40 output. Luźna adnotacja CLK40 out przy P64 jest sprzeczna z połączeniami. Pełny pinout100: reports/pinout.md.

Polecenia/exit codes: experiments/commands.jsonl; logi: experiments/logs. Pierwsze discovery jest opisane osobno w docs/session_commands.md, bez udawania pełnego transcriptu. Plan testów fizycznych: docs/hardware_validation.md. Fizyczny security/DONE/USERCODE poza QF, readback reader/IDCODE/session log oraz analogowe zachowanie pozostają nieweryfikowane.

Eksperymenty dalszego dopasowania: [matching_experiments.md](reports/readback-2026/matching_experiments.md). Pozostałe 346 fuse są wyłącznie w PLA AND/OR FB1/FB2; ZIA i wszystkie pola MC są już zgodne. Analiza permutacji terms: `experiments/ise-readback-2026/pt-allocation.json`.

Próby dyrektyw: [directive_placement.md](reports/readback-2026/directive_placement.md).

## Wymuszona implementacja

Dodatkowy backend VM6 daje **0/55341 fuse różnic**: [raport](reports/implementation_lock.md). Plik: `recovered/amplcpld_implementation_locked.jed`. `make reproduce` wykonuje również ten krok; `make implementation-locked` wykonuje native build i lock. Native fitter bez tego kroku nadal daje 346 różnic. Template `recovered/amplcpld.ptlock.json` zawiera alokację i równoważne równania PLA odczytane z golden; nie jest to samo UCF ani dowód odzyskania historycznego źródła.
