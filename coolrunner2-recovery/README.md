# CoolRunner-II firmware recovery for FIT PM12

English is the primary project language. Additional Polish documentation is available in [README.pl.md](README.pl.md) and [docs/reproduce_step_by_step.pl.md](docs/reproduce_step_by_step.pl.md). The recovered HDL and implementation-tool comments are in English. Original inputs, historical sources and recorded logs retain their original content.

The active golden reference is `original/readback-2026/pm_cpld_gold_2026.jed`, supplied as a readback from the physical XC2C128 CPLD. SHA-256:

```text
1748e3c4f0f6152bd395d0a88df1e3a2214ec31fe0e704e11e77b854556f3d95
```

**The final implementation-locked JED matches all 55,341 QF fuses and all decoded configuration fields.** The native ISE fitter alone still produces 346 differing fuses. Zero differences require an explicit post-fit VM6 implementation template derived from the golden configuration, followed by Xilinx `hprep6`. This is not a claim that the original source text or original compiler settings have been recovered.

The historical HDL differs from this golden reference by 1,412 fuses and has confirmed functional differences. The recovered readable HDL, its actual native fitted JED and its implementation-locked JED have been checked separately. No physical CPLD has been programmed. Physical timing measurements and security/DONE/USERCODE outside QF remain unverified.

## Installation and reproduction

Follow the complete [step-by-step setup guide](docs/reproduce_step_by_step.md) for Ubuntu 24.04, Rust, pinned decoders, local GHDL/Python dependencies, ISE 14.7 installation or configuration, compatibility libraries, building and final verification.

From the repository root:

```bash
cd coolrunner2-recovery
make bootstrap
ISE_SETTINGS=/path/to/14.7/ISE_DS/settings64.sh make reproduce
```

`ISE_SETTINGS` can be omitted when ISE is installed at `$HOME/.local/opt/xilinx/14.7/ISE_DS`. ISE binaries, the installer and licenses are supplied separately; they are not redistributed in this repository. See [docs/ise.md](docs/ise.md).

`make reproduce` performs the historical baseline build, golden decoding and lossless round-trip, all-register transition proofs, actual recovered VHDL simulation on 67,430 golden vectors, native ISE build and proof, VM6 implementation locking, vendor JED generation and final zero-difference checks. Native and implementation-locked status are reported separately.

For an already bootstrapped workspace with the decoded golden available, `make implementation-locked` runs the native build and locking stage. It does not replace the complete workflow for a fresh setup. `make reproduce-previous` reproduces the earlier experiment against the previous input without replacing the active recovered artifacts.

## Main artifacts

| Artifact | Purpose |
|---|---|
| [recovered/amplcpld_recovered.vhd](recovered/amplcpld_recovered.vhd) | Readable recovered HDL |
| [recovered/amplcpld.ucf](recovered/amplcpld.ucf) | Physical pins, register placement and I/O configuration |
| [recovered/amplcpld.ptlock.json](recovered/amplcpld.ptlock.json) | Explicit golden-derived PLA allocation and literal-cover template |
| [recovered/amplcpld_recovered.jed](recovered/amplcpld_recovered.jed) | Native ISE output: 346 differing fuses |
| [recovered/amplcpld_implementation_locked.jed](recovered/amplcpld_implementation_locked.jed) | Final output: zero differing QF fuses |
| [decoded/original.json](decoded/original.json), [original.txt](decoded/original.txt) | Complete decoded FB/MC equations and configuration |
| [decoded/state_map.json](decoded/state_map.json) | Recovered signal-to-resource mapping |
| [reports/implementation_lock.md](reports/implementation_lock.md) | Implementation-lock method, evidence and limitations |
| [reports/baseline_comparison.md](reports/baseline_comparison.md), [semantic_delta.md](reports/semantic_delta.md), [final_equivalence.md](reports/final_equivalence.md) | Detailed historical and verification evidence |
| `experiments/ise-readback-2026/` | Native synthesis/fitter artifacts, VM6, JED and comparisons |
| `experiments/vm6-locked-2026/` | Locked VM6, final JED, zero-difference comparisons and proof |
| `tests/readback-2026/` | Transition proofs, simulation vectors and GHDL evidence |
| `tools/jedtool`, `decode_xc2c128`, `compare_jed` | JEDEC parsing, canonical decoding and fuse comparison |

Some historical evidence reports retain their original Polish text; the primary setup guide, architecture description and implementation-lock report are in English. Every remaining native fuse difference is listed in `experiments/readback-2026/remaining-fuses.json`. Tool commands, exit codes and logs are recorded in `experiments/commands.jsonl` and `experiments/logs/`.

`known_hdl/*.bundle` preserves the complete available upstream/fork histories. Sources and hashes are inventoried in `known_hdl/variants.json` and `reports/history.md`. The schematic has 34 sheets; the CPLD is on sheet 10 and the gate circuit on sheet 12. The complete physical pin table is in `reports/pinout.md`.

## What was recovered from the firmware

The following description applies to the active 2026 golden reference. Internal names are names assigned to the recovered model, not evidence of the original source identifiers. Functions, FF modes and resource assignments come from fuse decoding and SAT checks. “Calibration” and “inhibit” describe the observed logic and historical context; their application-level interpretation has not been independently confirmed on hardware.

### Clock divider and polarity

The two-bit `CNT` increments on the **falling edge** of `CLK80`. `CLK40=CNT(0)` and `CLK20_P=CNT(1)`, giving divide-by-two and divide-by-four outputs for a periodic input. If the input is actually 80 MHz, the outputs are 40 MHz and 20 MHz; the signal name is not a physical frequency measurement.

`CLK20_N` is a separate register clocked on the same falling edge. Its input is `not(CNT(1) xor CNT(0))`, evaluated from the **old** counter state. With the decoded initial state, its output after the edge is the complement of the updated `CNT(1)`. The recovered HDL retains this actual register rather than replacing it with an output inverter. GCK2/FCLK2 is enabled; the other global clocks and the global clock divider/delay are disabled.

### ENA-qualified STR measurement path

On each falling edge of `STR`, `str_div` toggles only when `ENA=1`. The subsequent path is:

1. `str1` samples `str_div` on a falling CLK80 edge when the old `CNT(0)=0`.
2. `str2` samples `str1` on a rising CLK80 edge.
3. On a rising CLK80 edge, `dly(0)` registers `str1 xor str2`, and `dly(1..6)` shifts the pulse onward.

This detects changes of the synchronized STR state, with ENA qualification at the first toggle. Clocked processes use the previous FF state at an edge; replacing these assignments with immediate updates would change cycle delays.

### Second STR path, independent of ENA

The golden configuration contains an additional `raw_str_toggle`, toggled by every falling STR edge even when `ENA=0`. This path is absent from the historical HDL.

- `raw_sync(0..2)` is a three-register synchronizer updated on rising CLK80 edges.
- `raw_edge` registers `raw_sync(1) xor raw_sync(2)`.
- When `CNT(0)=0`, `raw_stretch` samples the OR of the previous `raw_edge` and the current synchronizer XOR. Otherwise it holds its state.
- Four `inhibit_pipe` bits shift `raw_stretch` only when `CNT(0)=0`.

The timer cannot restart while any `inhibit_pipe` bit is set. ENA suppresses the measurement path, but it does not remove STR activity from this mechanism. The three synchronizer registers were recovered from the configuration; no physical metastability/MTBF analysis was performed.

### Ten-bit timer and restart

`c_count` is a **ten-bit saturating counter**. It increments only when the old `CNT="11"` and holds at 1023. The historical HDL used seven bits, a terminal value of 127 and a different increment condition.

Restart requires all of the following:

```vhdl
CNT(0) = '1'
c_count = 1023
inhibit_pipe = "0000"
cal_phase = CNT(1)
```

Restart loads the counter with zero and toggles `cal_phase`. The recovered HDL expresses the counter as explicit per-bit toggles to retain the golden TFF implementation. At the terminal state all counter bits are one, so toggling every bit loads zero. During ordinary increments, each bit toggles when all lower bits were one.

A single calibration interval cannot be inferred from the counter width alone: restart also depends on phase and the inhibit pipeline. The behavior is defined by the recovered transition relation.

### Calibration pulse, DV and ADC capture

`cal_sample` is set on restart and cleared when `CNT(0)=0`. The final source refinement clears it only if its previous value was one. The register behavior remains the same, while the fitter reproduces the golden literal cover of its enable signal.

The data-capture enable is separate from the STR delay chain:

```vhdl
data_enable <= dly(6) or cal_sample;
```

On each rising CLK80 edge:

- `DV` registers `data_enable`.
- If the old `data_enable=1` and old `CNT(1)=1`, `DOUT(11:0)` captures ADC0 and `DOUT(12)=0`.
- If `data_enable=1` and `CNT(1)=0`, it captures ADC1 and `DOUT(12)=1`.
- When `data_enable=0`, DOUT retains the previous data.

The historical code injected calibration into the beginning of the STR delay chain alongside the XOR. The golden configuration instead adds a separate `cal_sample` at the final enable. Similar delay-chain lengths do not establish equivalence of these mechanisms.

### Combinational event chain

The golden configuration implements **`EV_out <= EV`**, with no register or timer qualification. A separate SAT proof establishes this relation. The historical HDL synchronized EV, used it to control calibration and drove EV_OUT through a register.

This is a confirmed functional difference from the historical source, not just a source-style change. The physical combinational path has propagation delay, which the Boolean model does not measure.

### Registers and initial state

The golden configuration uses **49 FFs**:

| Group | FF count |
|---|---:|
| CNT and separate CLK20_N | 3 |
| str_div, str1, str2 | 3 |
| dly[6:0] and DV | 8 |
| DOUT[12:0] | 13 |
| raw_str_toggle, raw_sync[2:0], raw_edge, raw_stretch | 6 |
| inhibit_pipe[3:0] | 4 |
| c_count[9:0], cal_phase, cal_sample | 12 |
| **Total** | **49** |

48 FFs have INIT=1; CLK20_N has INIT=0. CNT therefore starts at 3, the timer at 1023 and DOUT at all ones. No asynchronous set/reset is active. Global GSR/GTS are disabled. These initial values are part of the decoded configuration, not assumptions added to the testbench.

See [decoded/state_map.json](decoded/state_map.json) for every FB/MC assignment. Examples: c_count9=FB1/MC7, cal_phase=FB1/MC8, cal_sample=FB2/MC16 and raw_str_toggle=FB3/MC8. CLK80 uses GCK2 on pin 27; STR is on pin 63 and clocks two toggle FFs. Initialization and event clocks are included in formal comparisons.

### I/O configuration and schematic findings

The schematic establishes the VQ100/-7 target. The new JEDEC identifies `xc2c128-XXXXX`, so package and speed grade are not established by that file alone. See `reports/pinout.md` for the full table.

- P64, `Gate_STR1_o`, is the ENA input; P81, `Gate_STR1_i`, is the CLK40 output. A loose CLK40 annotation near P64 conflicts with the wiring; the discrepancy is documented rather than silently swapping pins.
- CLK40/P81 uses **FAST slew**; the previous file used SLOW.
- EV/P60 uses a **SCHMITT** input; the previous file used PLAIN.
- Both banks select HIGH for input/output buffer configuration; the previous file selected LOW.
- 54 unused pads use programmed ground `IS_GND` with termination disabled, instead of the previous keeper/output-disabled configuration.
- The global clock divider and its delay, DataGate and VREF are disabled.

The decoder’s HIGH/LOW labels are buffer-selection fields, not voltage measurements. The schematic indicates bank0 VCCIO=3.3 V and bank1 VCCIO=1.8 V. The golden configuration was preserved rather than “corrected” based on an assumption. No numerical analog FAST/SLOW delay is claimed without measurement or timing evidence.

## How the fuse-identical result was obtained

| Stage | Difference from the active golden |
|---|---:|
| Historical HDL + correct pinout + ISE 14.7 | 1,412 fuses, including functional differences |
| Recovered HDL, placement and I/O, density fitter | 976 fuses |
| Speed fitter | 380 fuses |
| Explicit golden-style cal_sample clear | 346 fuses |
| Native VM6 + implementation lock + Xilinx hprep6 | **0 fuses, 0 canonical fields** |

At the native 346-fuse stage, all MC/IOB fields, ZIA, initialization/clocks, placement and globals already match. Remaining differences are in FB1/FB2 AND/OR: physical PT-row ordering and an alternative cover of the highest timer bit’s T input. Tested UCF KEEP/COLLAPSE/MAXPT/NOREDUCE constraints did not force exact row assignment; a probe LOC for a single PT was rejected.

`tools/lock_vm6_placement.py` uses the explicit golden-derived `recovered/amplcpld.ptlock.json`. This template contains **allocation and literal covers**, not just placement coordinates. The backend checks the existing configuration and other sum covers, proves equivalence of the changed T input with SAT, assigns physical PLA rows and passes the actual modified fitter VM6 to vendor `hprep6`. This is a reproducible implementation lock, not recovery of the original source bytes or a fuse-identical result from the native fitter alone.

The final JED is then checked again: all 55,341 QF fuses match the golden reference, canonical field differences are zero and 49/49 transitions/init/clocks agree. The golden JED is not copied into the output. Native and locked artifacts remain separate.

Method and evidence: [reports/implementation_lock.md](reports/implementation_lock.md), [reports/final_equivalence.md](reports/final_equivalence.md) and [reports/readback-2026/directive_placement.md](reports/readback-2026/directive_placement.md).

## Evidence and remaining limitations

Confirmed: original SHA-256 preservation, valid JEDEC checksums, full QF coverage, lossless decode→assemble, all 49 local transition relations for every Boolean state/input, initialization and clocks, actual recovered VHDL simulation on 67,430 vectors and final locked-JED fuse identity. Next-state models use raw AND/OR fuses and Project Combine routing. Native and locked JEDs were proved separately. There is no separate formal VHDL-frontend proof; the compiled result has SAT proofs and the source has simulation evidence.

Not confirmed: physical timings, metastability, setup/hold across clock-domain edges or a post-programming hardware test. No CPLD was programmed. Identity applies to QF fuses, not text-container timestamps/headers or security/DONE/USERCODE outside QF. The readback tool/command/IDCODE session remains undocumented. `N VERSION P.20131013` in the previous file does not establish the original firmware compiler; the new readback has no such record.

The previous attachment, `original/amplcpld.jed` (SHA-256 beginning `89a231fd`), is preserved. Earlier zero-difference native builds apply only to that input. Their sources, decoding and reports are retained under `*/previous-input/`. Hardware validation planning is described in [docs/hardware_validation.md](docs/hardware_validation.md).
