# Explicit VM6 implementation locking

Additional Polish version: [implementation_lock.pl.md](implementation_lock.pl.md).

**The final output has zero differences across all 55,341 QF fuses and zero canonical configuration differences against `pm_cpld_gold_2026.jed`.** Output: `recovered/amplcpld_implementation_locked.jed`.

Pipeline: recovered VHDL + UCF → XST → ngdbuild → cpldfit → native VM6 → `lock_vm6_placement.py` + `amplcpld.ptlock.json` → locked VM6 → Xilinx hprep6 → JED.

This is **not** a fuse-identical native fitter result or recovery of the historical source/options. The native fitter still produces 346 differences. The additional backend locks physical PLA rows in FB1/FB2 and uses an equivalent literal cover for the highest counter bit’s T input. The template comes from the decoded golden configuration and contains AND equations, not just placement coordinates. The golden JED or ready-made fuse bits are not copied into the output: hprep6 generates JED from the actual modified fitter VM6.

ZIA, clocks, initialization, all macrocell/IOB/global fields come from the native fit and must already match. Every other sum cover must agree before locking. The differing c_count9 T input is checked with SAT before replacement. The wrapper re-proves all 49 native transitions before locking and all 49 after JED generation. A negative test rejects a changed REG_INIT without creating output. The original SHA-256 remains preserved.

Artifacts: `experiments/vm6-locked-2026/design.vm6`, `design.lock.json`, raw/canonical comparisons and the 49/49 UNSAT proof. Actual vendor log: `experiments/logs/vm6-locked-hprep6.log`. Reproduce with `make reproduce` for the complete workflow or `make implementation-locked` for native build plus lock. Guards, comparison and proof failures stop the workflow.

The final JED matches all QF fuses. Text headers/timestamps and the transmission checksum can differ because hprep6 creates its own JEDEC container. Security/DONE/USERCODE outside QF are not confirmed. No hardware was programmed and no board timing measurements were performed.

ISE settings are loaded in a subshell used only for hprep6, preventing legacy ISE libraries from interfering with modern Z3. The initial libz3.so failure is preserved in `locked-pipeline.log`; the corrected pipeline passed.
