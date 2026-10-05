# Od świeżego systemu do JED identycznego w fuse

Ta instrukcja dotyczy **nowego odczytu `pm_cpld_gold_2026.jed`**, nie wcześniejszego `amplcpld.jed`. Wszystkie polecenia wykonuj w Bash. Build nie uruchamia programatora.

Wynik docelowy: `recovered/amplcpld_implementation_locked.jed`, 0 różnic we wszystkich 55 341 QF fuse. Pipeline korzysta z jawnego szablonu implementacji odczytanego z golden; samo VHDL + native fitter ISE pozostawia 346 różnic. Nagłówki/daty kontenera JEDEC mogą się różnić. Security/DONE/USERCODE poza QF nie są objęte wynikiem.

## 1. System i podstawowe pakiety

Potwierdzone środowisko: Ubuntu 24.04.4 LTS, Linux x86_64, Python 3.12. Dostarczone pakiety GHDL wymagają glibc >= 2.38. Inne systemy, kontener z `toolchain/ise-userspace` i VM nie były zweryfikowane w pełnym workflow.

Na Ubuntu 24.04:

```bash
sudo apt-get update
sudo apt-get install --yes git make build-essential pkg-config curl ca-certificates python3 python3-venv dpkg-dev libssl-dev
uname -m
getconf GNU_LIBC_VERSION
python3 --version
```

Oczekuj `x86_64`, glibc przynajmniej 2.38 i Python 3.12. Potrzebny jest internet do pobrania Rust, źródeł decoderów i zależności. Instalacja ISE oraz kompilacja Rust zajmują dużo miejsca; sprawdź wolny dysk przed rozpoczęciem. Nie podajemy niezmierzonego minimalnego wymaganego rozmiaru.

## 2. Pobranie repozytorium

Do czasu merge PR #2 użyj gałęzi recovery:

```bash
git clone --branch recovery/xc2c128-golden-2026 https://github.com/alice-fit-fee-upgrade/FIT_PM_GW_CPLD.git
cd FIT_PM_GW_CPLD/coolrunner2-recovery
```

Po merge można pobrać `main`; katalog pozostaje `coolrunner2-recovery`. Wszystkie dalsze ścieżki są względem tego katalogu.

Sprawdź oryginalne dane i dostarczone pakiety:

```bash
sha256sum -c original/readback-2026/SHA256SUMS
sha256sum -c original/SHA256SUMS
sha256sum -c schematic/SHA256SUMS
sha256sum -c toolchain/package-sha256.txt
sha256sum -c toolchain/ise-compat/SHA256SUMS
sha256sum -c docs/PUBLICATION_SHA256SUMS
```

Każda pozycja musi dać `OK`. Manifest publikacji dotyczy stanu plików przy checkout, przed regenerowaniem logów/raportów przez build. Nie jest manifestem późniejszego stanu wygenerowanych plików.

## 3. Rust i bootstrap narzędzi

Jeśli nie masz `rustup`, zainstaluj go dostarczonym skryptem. Skrypt pobiera instalator przez internet, a nie zawiera binariów Rust:

```bash
sh toolchain/rustup-init.sh -y --profile minimal --default-toolchain none
export PATH="$HOME/.cargo/bin:$PATH"
rustup toolchain install 1.99.0 --profile minimal
rustc +1.99.0 --version
cargo +1.99.0 --version
make bootstrap
```

Jeśli masz `rustup`, pomiń tylko pierwsze polecenie. Potwierdzone wersje: rustc/cargo 1.99.0, GHDL 4.1.0, sympy 1.14.0, mpmath 1.3.0, z3-solver 5.1.0.0. Szczegóły: `toolchain/versions.txt`, `toolchain/requirements.lock` i Cargo locks.

`make bootstrap`:

1. Pobiera Project Combine commit `234343d23e737e57f2727630e19008b509d7d522` oraz openfpga commit `f9ae535d0372c246075d1bb05a409adaed0135e7`.
2. Kopiuje przypięte Cargo locks i kompiluje decoder/assembler CoolRunner-II.
3. Tworzy `toolchain/venv` i instaluje Python dependencies z weryfikacją hashy.
4. Weryfikuje i rozpakowuje GHDL/GNAT `.deb` lokalnie w `toolchain/ghdl`.
5. Odtwarza pełne mirrors historycznego HDL z `known_hdl/*.bundle`.
6. Rozpakowuje ncurses5/tinfo5 dla ISE w `toolchain/ise-compat/root`.

xc2bit pozostaje narzędziem diagnostycznym: jego mapa ZIA XC2C128 okazała się niekompletna. Autorytatywny decoder/assembler w tym workflow to przypięty Project Combine.

Kontrola po bootstrap:

```bash
tools/ghdl --version
toolchain/venv/bin/python -c 'import sympy, z3; print(sympy.__version__); print(z3.get_version_string())'
test -x toolchain/prjcombine/target/release/coolrunner2_dis
test -x toolchain/prjcombine/target/release/coolrunner2_as
tools/jedtool original/readback-2026/pm_cpld_gold_2026.jed
```

Ostatnie polecenie parsuje JEDEC i pokazuje metadata/checksums, bez operacji sprzętowych. Zasady instalacji `rustup`: [oficjalna dokumentacja](https://rust-lang.github.io/rustup/installation/index.html).

## 4. Xilinx ISE 14.7 — istniejąca instalacja

ISE nie jest dołączone do repo. Jeśli masz już działającą Linux x86_64 instalację ISE 14.7:

```bash
export ISE_SETTINGS=/twoja/sciezka/14.7/ISE_DS/settings64.sh
test -f "$ISE_SETTINGS"
```

Przejdź do kroku 6. Domyślnie narzędzia używają `$HOME/.local/opt/xilinx/14.7/ISE_DS/settings64.sh`.

## 5. Xilinx ISE 14.7 — nowa instalacja

Dostarcz osobno legalnie uzyskany Linux installer `Xilinx_ISE_DS_Lin_14.7_1015_1.tar`. Sprawdzony hash archiwum:

```text
cee0b046c1bbcfafcae59a96c7596c55c5477628c39bafefff8992cb8d33adaa
```

Poniższa ścieżka jest przykładem; zmień wartość zmiennej na lokalny plik:

```bash
export CPLD_ISE_ARCHIVE=/tmp/Xilinx_ISE_DS_Lin_14.7_1015_1.tar
python3 - <<'PY'
import hashlib, os
from pathlib import Path
p = Path(os.environ['CPLD_ISE_ARCHIVE'])
h = hashlib.sha256()
with p.open('rb') as stream:
    for block in iter(lambda: stream.read(1024 * 1024), b''):
        h.update(block)
assert h.hexdigest() == 'cee0b046c1bbcfafcae59a96c7596c55c5477628c39bafefff8992cb8d33adaa'
print('ISE archive SHA256 OK')
PY
mkdir -p "$HOME/.local/opt/ise-installer"
tar -xf "$CPLD_ISE_ARCHIVE" -C "$HOME/.local/opt/ise-installer"
```

Przygotuj config z katalogiem instalacji swojego użytkownika. Nie używaj w ciemno dostarczonej ścieżki `/home/codex-hil`:

```bash
python3 - <<'PY'
from pathlib import Path
src = Path('toolchain/ise-install.batch').read_text().splitlines()
destination = Path.home() / '.local/opt/xilinx'
lines = ['destination_dir=' + str(destination) if line.startswith('destination_dir=') else line for line in src]
Path('experiments/ise-install-local.batch').write_text('\n'.join(lines) + '\n')
print(destination)
PY
```

Config wybiera WebPACK, wyłącza cable drivers, System Generator i GUI license manager. Helper PTY odpowiada na warunki instalacji producenta; jego uruchomienie oznacza ich akceptację. Odczytaj warunki producenta przed użyciem.

```bash
python3 tools/install_ise_cli.py \
  "$HOME/.local/opt/ise-installer/Xilinx_ISE_DS_Lin_14.7_1015_1" \
  --batch experiments/ise-install-local.batch
export ISE_SETTINGS="$HOME/.local/opt/xilinx/14.7/ISE_DS/settings64.sh"
test -f "$ISE_SETTINGS"
```

Sprawdzona instalacja na tym hoście została wykonana w PTY. Helper odtwarza obsługę promptów, ale nie był sprawdzony przez drugą pełną instalację ISE. Log helpera: `experiments/logs/ise-install-pty.log`. Nie należy przedstawiać tej ścieżki instalatora jako osobno przetestowanej świeżej instalacji.

Dla sprawdzonego WebPACK build nie wymagał dodatkowego pliku licencji. Jeśli Twoja instalacja go wymaga, ustaw zwykłe `XILINXD_LICENSE_FILE`/`LM_LICENSE_FILE` na lokalną licencję zgodnie z warunkami producenta. Nie dodawaj jej do Git.

## 6. Kontrola CLI ISE w izolowanym shellu

Nie source'uj settings64 globalnie do shellu uruchamiającego Z3. Stare biblioteki ISE mogą kolidować z jego bibliotekami C++. Użyj subshell:

```bash
(
  source "$ISE_SETTINGS" "$(dirname "$ISE_SETTINGS")"
  export LD_LIBRARY_PATH="$PWD/toolchain/ise-compat/root/lib/x86_64-linux-gnu:$PWD/toolchain/ise-compat/root/usr/lib/x86_64-linux-gnu${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
  for program in xst ngdbuild cpldfit hprep6; do
    command -v "$program"
  done
  cpldfit -h
)
```

Ważne: drugi argument `source` musi być prefixem `ISE_DS`. Bez niego settings64 może uznać argument skryptu, np. `baseline`, za katalog instalacji. Wrappery projektu już obsługują prefix i compatibility libraries.

## 7. Pełne odtworzenie

```bash
make reproduce > experiments/logs/reproduce-local.log 2>&1
```

Proces kończy się kodem 0 wyłącznie po zaliczeniu checks. Log można obserwować z drugiego terminala przez `tail -f experiments/logs/reproduce-local.log`.

Sekwencja:

1. Historyczny HDL → ISE baseline.
2. Parsowanie i dekodowanie nowego golden; decode→assemble roundtrip.
3. SAT wszystkich 49 funkcji przejścia golden i kontrola clocks/init.
4. Symulacja rzeczywistego recovered VHDL: 67 430 golden vectors.
5. Recovered VHDL/UCF → XST → ngdbuild → cpldfit → hprep6; native fit: 346 fuse różnic.
6. SAT wszystkich 49 funkcji przejścia faktycznego native JED.
7. Jawny lock FB1/FB2 PLA w VM6 i równoważnego wejścia T `c_count(9)`.
8. Xilinx hprep6 → locked JED; raw/canonical comparison wymagają 0, SAT ponownie 49/49.

Szybszy wariant, gdy decoder/zależności i dotychczasowe decoded golden już są przygotowane:

```bash
make implementation-locked
```

Ten target wykonuje native build i lock; nie zastępuje pełnego `make reproduce` ze świeżego środowiska.

## 8. Samodzielne sprawdzenie bit identity

```bash
tools/compare_jed \
  original/readback-2026/pm_cpld_gold_2026.jed \
  recovered/amplcpld_implementation_locked.jed \
  > experiments/locked-self-check.json
python3 - <<'PY'
import json
from pathlib import Path
raw = json.loads(Path('experiments/locked-self-check.json').read_text())
canonical = json.loads(Path('experiments/vm6-locked-2026/structural-diff.json').read_text())
proof = json.loads(Path('experiments/vm6-locked-2026/transition-proof.json').read_text())
assert raw['hamming_distance'] == 0
assert canonical['structural_difference_count'] == 0
assert proof['all_passed'] and proof['register_count'] == 49
print('PASS: 0 fuse differences; 0 canonical differences; 49/49 state proofs')
PY
sha256sum -c original/readback-2026/SHA256SUMS
```

Nie używaj `cmp` ani równości SHA256 dwóch tekstowych JED jako kryterium konfiguracji: nagłówki zawierają daty i ścieżki. SHA256 golden służy ochronie materiału wejściowego; fuse diff sprawdza konfigurację urządzenia.

## 9. Gdzie są wyniki

| Plik/katalog | Znaczenie |
|---|---|
| `recovered/amplcpld_recovered.vhd`, `amplcpld.ucf` | Czytelny HDL i pin/placement/config constraints |
| `recovered/amplcpld.ptlock.json` | Jawny template PLA z golden, zawierający też literal cover |
| `recovered/amplcpld_recovered.jed` | Native ISE output, 346 różnic |
| `recovered/amplcpld_implementation_locked.jed` | Final QF fuse-identical output |
| `experiments/vm6-locked-2026/design.vm6` | Faktyczny VM6 po lock |
| `experiments/vm6-locked-2026/raw-diff.json` | Raw Hamming=0 |
| `experiments/vm6-locked-2026/structural-diff.json` | Canonical difference count=0 |
| `experiments/vm6-locked-2026/transition-proof.json` | 49/49 UNSAT, zgodne init/clocks |
| `tests/readback-2026/ghdl-equivalence.log` | PASS: 67430 golden vectors |
| `reports/implementation_lock.md` | Zakres i ograniczenia wyniku |
| `experiments/commands.jsonl`, `experiments/logs/` | Polecenia, exit codes i logi |

## 10. Typowe problemy

- `cargo`/`rustup` nie znalezione: ustaw `PATH="$HOME/.cargo/bin:$PATH"`; build używa przypiętej wersji 1.99.0.
- GHDL zgłasza `GLIBC_x.y not found`: użyj Ubuntu 24.04/glibc >=2.38; dostarczone `.deb` nie są uniwersalne.
- ISE nie znajduje ncurses5/tinfo5: wykonaj `make bootstrap`; wrapper dodaje lokalne compatibility directories, bez zastępowania bibliotek systemowych.
- Z3 zgłasza `libz3.so.5.1 not found` po source settings64: uruchom workflow w nowym shellu. Nie eksportuj starych ISE library paths globalnie. `build_locked_ise` uruchamia ISE w subshell.
- `ISE missing`: ustaw pełne `ISE_SETTINGS`, nie ścieżkę do samego `xst`.
- Guard blokady VM6 albo SAT odrzuca build: zachowaj log. Nie wyłączaj guard i nie podstawiaj gotowego golden JED. Zmieniony HDL/opcje mogą nie spełniać założeń template.
- 346 różnic w native JED to oczekiwany wynik. Zero ma dać osobny `amplcpld_implementation_locked.jed`.
- Pobranie ISE/Rust/dependencies nie działa: zachowane artefakty pozwalają sprawdzić final JED bez reinstalacji, lecz pełny rebuild wymaga narzędzi.
