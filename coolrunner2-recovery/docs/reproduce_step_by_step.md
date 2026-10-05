# Step-by-step setup and fuse-identical JEDEC reproduction

Additional Polish version: [reproduce_step_by_step.pl.md](reproduce_step_by_step.pl.md).

This guide targets the **new `pm_cpld_gold_2026.jed` readback**, not the earlier `amplcpld.jed`. Run commands in Bash. The build does not invoke a programmer.

The target output is `recovered/amplcpld_implementation_locked.jed`, with zero differences across all 55,341 QF fuses. The workflow uses an explicit golden-derived implementation template; native VHDL + ISE fitting alone leaves 346 differences. JEDEC container headers/timestamps may differ. Security/DONE/USERCODE outside QF are not covered.

## 1. Operating system and base packages

Verified environment: Ubuntu 24.04.4 LTS, Linux x86_64, Python 3.12. The supplied GHDL packages require glibc >= 2.38. Other distributions, the optional `toolchain/ise-userspace` container and VM configurations have not been verified through the complete workflow.

On Ubuntu 24.04:

```bash
sudo apt-get update
sudo apt-get install --yes git make build-essential pkg-config curl ca-certificates python3 python3-venv dpkg-dev libssl-dev
uname -m
getconf GNU_LIBC_VERSION
python3 --version
```

Expect `x86_64`, glibc at least 2.38 and Python 3.12. Internet access is required for Rust, decoder sources and dependencies. ISE installation and Rust compilation require substantial disk space; check available storage first. No unmeasured minimum disk requirement is claimed.

## 2. Clone the repository

Until PR #2 is merged, use the recovery branch:

```bash
git clone --branch recovery/xc2c128-golden-2026 https://github.com/alice-fit-fee-upgrade/FIT_PM_GW_CPLD.git
cd FIT_PM_GW_CPLD/coolrunner2-recovery
```

After merge, `main` can be used; the workspace remains `coolrunner2-recovery`. All subsequent paths are relative to this directory.

Verify original inputs and supplied packages:

```bash
sha256sum -c original/readback-2026/SHA256SUMS
sha256sum -c original/SHA256SUMS
sha256sum -c schematic/SHA256SUMS
sha256sum -c toolchain/package-sha256.txt
sha256sum -c toolchain/ise-compat/SHA256SUMS
sha256sum -c docs/PUBLICATION_SHA256SUMS
```

Every entry must report `OK`. The publication manifest covers the checked-out publication snapshot, before a build regenerates logs/reports. It does not describe subsequently regenerated files.

## 3. Rust and tool bootstrap

If `rustup` is not installed, use the supplied script. It downloads the installer from the internet; the repository does not include Rust binaries:

```bash
sh toolchain/rustup-init.sh -y --profile minimal --default-toolchain none
export PATH="$HOME/.cargo/bin:$PATH"
rustup toolchain install 1.99.0 --profile minimal
rustc +1.99.0 --version
cargo +1.99.0 --version
make bootstrap
```

If `rustup` is already installed, skip only the first command. Verified versions: rustc/cargo 1.99.0, GHDL 4.1.0, sympy 1.14.0, mpmath 1.3.0 and z3-solver 5.1.0.0. Details are in `toolchain/versions.txt`, `toolchain/requirements.lock` and the Cargo locks.

`make bootstrap`:

1. Fetches Project Combine commit `234343d23e737e57f2727630e19008b509d7d522` and openfpga commit `f9ae535d0372c246075d1bb05a409adaed0135e7`.
2. Copies pinned Cargo locks and builds the CoolRunner-II decoder/assembler.
3. Creates `toolchain/venv` and installs Python dependencies with hash verification.
4. Verifies and extracts the GHDL/GNAT `.deb` packages locally into `toolchain/ghdl`.
5. Restores complete historical HDL mirrors from `known_hdl/*.bundle`.
6. Extracts ncurses5/tinfo5 for ISE into `toolchain/ise-compat/root`.

xc2bit is retained for diagnostics: its XC2C128 ZIA mapping proved incomplete. The authoritative decoder/assembler in this workflow is the pinned Project Combine implementation.

Check the bootstrap result:

```bash
tools/ghdl --version
toolchain/venv/bin/python -c 'import sympy, z3; print(sympy.__version__); print(z3.get_version_string())'
test -x toolchain/prjcombine/target/release/coolrunner2_dis
test -x toolchain/prjcombine/target/release/coolrunner2_as
tools/jedtool original/readback-2026/pm_cpld_gold_2026.jed
```

The last command parses JEDEC metadata/checksums without hardware operations. See the [official rustup installation documentation](https://rust-lang.github.io/rustup/installation/index.html).

## 4. Xilinx ISE 14.7: use an existing installation

ISE is not included in this repository. If you already have a working Linux x86_64 ISE 14.7 installation:

```bash
export ISE_SETTINGS=/your/path/14.7/ISE_DS/settings64.sh
test -f "$ISE_SETTINGS"
```

Proceed to step 6. The default location is `$HOME/.local/opt/xilinx/14.7/ISE_DS/settings64.sh`.

## 5. Xilinx ISE 14.7: install from a separately supplied archive

Supply a legally obtained Linux installer, `Xilinx_ISE_DS_Lin_14.7_1015_1.tar`. The verified archive SHA-256 is:

```text
cee0b046c1bbcfafcae59a96c7596c55c5477628c39bafefff8992cb8d33adaa
```

The following archive path is an example. Adjust it to your local file:

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

Generate a configuration for your own user account. Do not blindly use the supplied `/home/codex-hil` destination:

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

The configuration selects WebPACK and disables cable drivers, System Generator and the GUI license manager. The PTY helper responds to the vendor’s installation terms; invoking it constitutes acceptance. Read those terms before using the helper.

```bash
python3 tools/install_ise_cli.py \
  "$HOME/.local/opt/ise-installer/Xilinx_ISE_DS_Lin_14.7_1015_1" \
  --batch experiments/ise-install-local.batch
export ISE_SETTINGS="$HOME/.local/opt/xilinx/14.7/ISE_DS/settings64.sh"
test -f "$ISE_SETTINGS"
```

The verified installation on the recovery host was performed in a PTY. The helper reproduces prompt handling but was not tested through a second complete ISE installation. Its log is `experiments/logs/ise-install-pty.log`; this helper path must not be represented as an independently verified fresh installation.

The verified WebPACK build did not require an additional license file. If your installation requires one, configure `XILINXD_LICENSE_FILE`/`LM_LICENSE_FILE` for your local license under the vendor’s terms. Do not commit licensing material.

## 6. Check ISE CLI in an isolated shell

Do not source settings64 globally into the shell running Z3. Legacy ISE libraries can conflict with its C++ libraries. Use a subshell:

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

The second `source` argument must be the `ISE_DS` prefix. Otherwise settings64 may interpret a script argument, such as `baseline`, as the installation directory. Project wrappers already handle the prefix and compatibility libraries.

## 7. Run complete reproduction

```bash
make reproduce > experiments/logs/reproduce-local.log 2>&1
```

The workflow returns exit code zero only after its checks pass. Monitor it from another terminal with `tail -f experiments/logs/reproduce-local.log`.

Sequence:

1. Historical HDL → ISE baseline.
2. Parse/decode the active golden and run a decode→assemble round-trip.
3. Prove all 49 golden transitions with SAT and check initialization/clocks.
4. Simulate actual recovered VHDL on 67,430 golden vectors.
5. Recovered VHDL/UCF → XST → ngdbuild → cpldfit → hprep6; native fit: 346 differing fuses.
6. Prove all 49 transitions of the actual native JED with SAT.
7. Explicitly lock FB1/FB2 PLA allocation in VM6 and the equivalent `c_count(9)` T-input cover.
8. Xilinx hprep6 → locked JED; raw/canonical comparisons must both be zero and SAT must pass 49/49 again.

For an already prepared workspace with tools/dependencies and the decoded golden available:

```bash
make implementation-locked
```

This target performs the native build and lock. It does not replace complete `make reproduce` from a fresh environment.

## 8. Independently verify fuse identity

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

Do not use `cmp` or matching SHA-256 values of the two text JED files as the configuration criterion: headers contain timestamps and paths. Golden SHA-256 protects the input; fuse comparison checks the device configuration.

## 9. Output locations

| File/directory | Meaning |
|---|---|
| `recovered/amplcpld_recovered.vhd`, `amplcpld.ucf` | Readable HDL and pin/placement/configuration constraints |
| `recovered/amplcpld.ptlock.json` | Explicit golden-derived PLA template, including literal covers |
| `recovered/amplcpld_recovered.jed` | Native ISE output: 346 differences |
| `recovered/amplcpld_implementation_locked.jed` | Final QF fuse-identical output |
| `experiments/vm6-locked-2026/design.vm6` | Actual locked VM6 |
| `experiments/vm6-locked-2026/raw-diff.json` | Raw Hamming distance=0 |
| `experiments/vm6-locked-2026/structural-diff.json` | Canonical difference count=0 |
| `experiments/vm6-locked-2026/transition-proof.json` | 49/49 UNSAT with matching initialization/clocks |
| `tests/readback-2026/ghdl-equivalence.log` | PASS: 67430 golden vectors |
| `reports/implementation_lock.md` | Method, scope and limitations |
| `experiments/commands.jsonl`, `experiments/logs/` | Commands, exit codes and logs |

## 10. Troubleshooting

- `cargo`/`rustup` not found: set `PATH="$HOME/.cargo/bin:$PATH"`. Builds use pinned version 1.99.0.
- GHDL reports `GLIBC_x.y not found`: use Ubuntu 24.04/glibc >=2.38; the supplied `.deb` packages are not universal.
- ISE cannot find ncurses5/tinfo5: run `make bootstrap`. Wrappers add local compatibility directories without replacing system libraries.
- Z3 reports `libz3.so.5.1 not found` after sourcing settings64: start the workflow in a fresh shell. Do not export legacy ISE library paths globally. `build_locked_ise` invokes ISE in a subshell.
- `ISE missing`: set the complete `ISE_SETTINGS` path, not just the path to `xst`.
- A VM6-lock guard or SAT check rejects the build: preserve the log. Do not disable guards or substitute the golden JED as output. Modified HDL/options may violate template assumptions.
- 346 differences in the native JED are expected. Zero differences must be obtained in the separate `amplcpld_implementation_locked.jed`.
- ISE/Rust/dependency retrieval fails: preserved artifacts allow final JED verification without reinstalling, but a full rebuild requires the tools.
