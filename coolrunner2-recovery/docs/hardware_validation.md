# Planned FIT PM12 hardware validation

Additional Polish version: [hardware_validation.pl.md](hardware_validation.pl.md).

No CPLD programming or JTAG operation was performed. The working original remains the Golden Device. This plan does not authorize programming; that requires separate explicit approval.

1. Identify the physical channel and DD18 instance in the repeated PM12 block. The schematic contains 12 channels; the readback does not identify its channel. Record PCB revision, CPLD marking, IDCODE, VCCINT/VCCIO/VCCAUX voltages and adapter type/levels.
2. Before making changes, obtain two independent readbacks with a tool supporting XC2C128. Preserve raw files, full logs, tool version and SHA-256. Compare their fuses with each other and `original/readback-2026/pm_cpld_gold_2026.jed` using `compare_jed`; text timestamps may differ. Read security/USERCODE/status separately if supported.
3. Observe the Golden Device passively first. Probes/analyzer must accommodate the actual 1.8 V/3.3 V levels and CLK80 bandwidth. Do not drive signals onto existing active outputs.
4. Capture ADC_CLK/P27, CLK40/Gate_STR1_i/P81, INTA_G_DRV/P53, INTB_G_DRV/P54, CFD_OUT/P63, ENA/Gate_STR1_o/P64, DV/STR1_/P82, EV_IN/P60, EV_OUT/P16 and DI[12:0]. Use an oscilloscope for setup/hold and gate shaping. Nanosecond pulses require adequate actual analog bandwidth, not just a quoted digital sampling rate.
5. Check divide-by-two/divide-by-four outputs updating on falling CLK80. CLK20_N complements CLK20_P in the decoded reachable state. Its own clock-to-output delay means ideal simulation does not establish output skew.
6. At ENA=0, falling STR does not toggle str_div. At ENA=1, it does. str1 samples on falling CLK80 with old CNT0=0; str2 samples on rising CLK80. DV registers dly6 OR cal_sample, also used as ADC capture enable. CNT1=1 selects ADC0 and DI12=0; CNT1=0 selects ADC1 and DI12=1; otherwise data holds.
7. EV_OUT should follow EV_IN combinationally with pad-to-logic-to-pad propagation delay. Check a short EV pulse between CLK80 edges. Without STR activity, observe automatic cal_sample pulses from the ten-bit timer/restart. The timer increments at CNT=11 to 1023; restart requires inhibit_pipe=0000 and cal_phase=CNT1. The raw STR path operates even at ENA=0 and can inhibit restart. Derive expected traces from the current decoded golden and `tools/golden_model.py`, not the earlier seven-bit EV-calibration model.
8. Program only after explicit subsequent approval, preferably on a test device or after an approved backup/restore procedure. Programmer commands must specify the actual chain position, cable and intended JED, without security locking. No default erase/program command is provided.

A prepared iMPACT identification-only batch, not executed:

```text
setMode -bs
setCable -port auto
identify
quit
```

Readback/programming must be configured for the actually detected chain; do not guess positions. openFPGALoader is an alternative only after checking adapter and readback-format support. Its default JED path includes programming, so it must not be invoked as though it were a read-only operation.

Logical vectors in `tests/readback-2026/vectors.txt` are generated deterministically. They are not directly applicable as electrical drive vectors for the assembled board, where ADC/clock/CFD sources are already connected.

The native recovered JED has 346 differing fuses despite Boolean-equivalence proofs. ZIA matches, but AND/OR allocation differs and internal timing equivalence is unproved. The separate `recovered/amplcpld_implementation_locked.jed` matches all 55,341 QF fuses; security/DONE/USERCODE outside QF and actual board measurements remain unverified. Golden CLK40 is FAST, EV is SCHMITT and buffer selections are HIGH. Preserve reader/tool/command/IDCODE logs to establish export provenance.
