# Verified Xilinx ISE 14.7 CLI environment

Additional Polish version: [ise.pl.md](ise.pl.md). For the complete installation/configuration procedure, use [reproduce_step_by_step.md](reproduce_step_by_step.md).

The user-supplied Linux installer was `Xilinx_ISE_DS_Lin_14.7_1015_1.tar`, SHA-256 `cee0b046c1bbcfafcae59a96c7596c55c5477628c39bafefff8992cb8d33adaa`. The verified WebPACK installation is `$HOME/.local/opt/xilinx/14.7/ISE_DS` on the recovery host. XST, ngdbuild, cpldfit and hprep6 operate from the CLI; the fitter/XST release is P.20131013. No additional license file or AMD login/password was required for the verified build.

The installer archive, installed vendor binaries, licenses and vendor fuse maps are outside the repository. Archive inventory, hashes, batch configuration and installation logs are retained. The published failed installer log is losslessly compressed as `experiments/logs/ise-install.log.gz`.

## Installation configuration

Supply your own installer separately. Generate a local copy of `toolchain/ise-install.batch` with a destination under your own home directory; do not use `/home/codex-hil` on another host. The checked configuration selects WebPACK and disables cable drivers, System Generator and the GUI license manager.

`tools/install_ise_cli.py` runs batchxsetup in a PTY and handles installation prompts. Invoking it accepts the displayed vendor terms. The successful host installation was performed in a PTY; the helper itself was not verified through a second complete installation. See the step-by-step guide for commands and this distinction.

Legacy ncurses5/tinfo5 packages, version 6.3-2ubuntu0.3, are extracted locally under `toolchain/ise-compat/root`. Their hashes are in `toolchain/ise-compat/SHA256SUMS`. Project wrappers set library paths without changing system libraries or requiring sudo for extraction.

The default settings file is `$HOME/.local/opt/xilinx/14.7/ISE_DS/settings64.sh`. Override it with:

```bash
ISE_SETTINGS=/your/path/ISE_DS/settings64.sh make reproduce
```

If your installation requires a license, use the standard `XILINXD_LICENSE_FILE`/`LM_LICENSE_FILE` variables for your own licensing material. Do not store it in Git.

## Problems encountered and fixes

- Installer startup required `libncurses.so.5`: resolved by locally extracted ncurses5/tinfo5.
- EOF on installer stdin caused repeated EULA prompts: the process was stopped; a PTY was used for the successful installation. Both failed and successful logs are preserved.
- settings64 treats its positional argument as the installation prefix: wrappers explicitly pass `dirname(settings)` so `baseline`/`readback-2026` cannot become the prefix.
- Legacy ISE libraries conflict with modern Z3 loading: `build_locked_ise` sources ISE settings only inside a subshell used for hprep6. Python/Z3 then runs outside that environment.
- BUFG warnings for ADC inputs on GCK0/GCK1 pins do not imply those clocks are enabled. Actual output configuration enables only GCK2/FCLK2, matching golden.

Pipeline commands and exit codes are in `tools/build_ise`, `tools/build_locked_ise` and `experiments/commands.jsonl`. The optional userspace/container recipe in `toolchain/ise-userspace` has not been verified end to end; the demonstrated environment is the local Linux userspace.

## Current golden readback and exact implementation

Earlier native zero-difference builds apply to the previous `original/amplcpld.jed`, not the physical 2026 readback. The current configuration has different logic.

The native recovered build uses target XC2C128-7-VQ100, LOC constraints for all internal FFs, an explicit toggle counter and:

```text
-unused ground -terminate keeper -iostd LVCMOS33 -nomlopt -optimize speed
```

Outputs are SLOW except FAST CLK40; EV uses SCHMITT_TRIGGER. The native result has 346 differing fuses in FB1/FB2 AND/OR. All FF placement, ZIA, MC/IOB/global fields, initialization and clocks match; all 49 transition relations pass SAT.

No working native UCF constraint for arbitrary exact PT-row allocation was found. An explicit post-fit VM6 template then locks PLA allocation and an equivalent counter T-input cover. Vendor hprep6 produces a JED with zero differences across all 55,341 QF fuses. The template includes literal covers derived from golden, not just physical placement coordinates. See [../reports/implementation_lock.md](../reports/implementation_lock.md).

ISE includes `ISE/xbr/data/xc2c128.map` and package BSD data. Paths/hashes are recorded in `toolchain/ise-vendor-map-hashes.txt`; proprietary maps are not copied into the repository. Project Combine provides the configuration mapping used here. Security/user fields beyond logical QF are not verified.
