# Historia HDL

Pełne mirror clones, bez shallow clone. API forków zachowane w known_hdl/forks.json. Snapshot: 2026-10-04.

Źródło: https://github.com/alice-fit-fee-upgrade/FIT_PM_GW_CPLD i https://github.com/r-smalec/FIT_PM_GW_CPLD.

## upstream: 54 commitów

```
af94653f6097babb7f0343613615904c6fadcfbb refs/heads/dev
35997f3c5b1abc737f72b4fbb634c6527293aa3e refs/heads/main
```

Artefakty buildów (wszystkie drzewa reachable): outputs/vivado_test/design_1_wrapper.bit, outputs/vivado_test/design_1_wrapper.xsa, outputs/vivado_test/design_1_wrapper_with_app.bit, outputs/vivado_test_uart_app/design_1_wrapper.bit, outputs/vivado_test_uart_app/design_1_wrapper.xsa, outputs/vivado_test_uart_app/design_1_wrapper_with_app.bit, outputs/vivado_tests2/design_1_wrapper.bit, outputs/vivado_tests2/design_1_wrapper.xsa, vitis_test/afe_test_platform/export/afe_test_platform/hw/design_1_wrapper.xsa, vivado/fit_pm_dual_range_afe.gen/sources_1/bd/mref/adc_ddr_top/xgui/adc_ddr_top_v1_0.tcl, vivado/fit_pm_dual_range_afe.gen/sources_1/bd/mref/dual_adc_ddr_top/xgui/dual_adc_ddr_top_v1_0.tcl, vivado/fit_pm_dual_range_afe.gen/sources_1/bd/mref/fit_pm_afe/xgui/fit_pm_afe_v1_0.tcl, vivado/fit_pm_dual_range_afe.gen/sources_1/bd/mref/io_dual_adc_ddr_top/xgui/io_dual_adc_ddr_top_v1_0.tcl, vivado/fit_pm_dual_range_afe.gen/sources_1/bd/mref/io_event_calibration/xgui/io_event_calibration_v1_0.tcl, vivado/fit_pm_dual_range_afe.gen/sources_1/bd/mref/io_int_g_drv/xgui/io_int_g_drv_v1_0.tcl, vivado/fit_pm_dual_range_afe.gen/sources_1/bd/mref/io_la_outputs/xgui/io_la_outputs_v1_0.tcl, vivado_test/afe_test.gen/sources_1/bd/mref/io_dual_adc_ddr_top/xgui/io_dual_adc_ddr_top_v1_0.tcl

## r-smalec: 30 commitów

```
95bc8d7df0e6420725acc005701091b8245f70b7 refs/heads/main
```

Artefakty buildów (wszystkie drzewa reachable): brak JED/VM6/NGC/UCF/ISE/XST/raportów.

## Wszystkie warianty amplcpld.vhd

| Repo | SHA256 | Git blob | Ścieżki |
|---|---|---|---|
| upstream | 6c0bcd78026f2b2519c362d30cf0b4f0cef6ff9a88a2e4d30db57fd05e5713e7 | 1ebbf4d99f447095306561f44f88c04877482884 | amplcpld.vhd |
| r-smalec | c5b403cdc500cf69f91580d528aaeb04940faf6b2448bdff14c9b85286f4b450 | 8d06dd126c596624fce2955af14dc6e28293a76e | base/amplcpld.vhd, obsolete/amplcpld.vhd |
| r-smalec | 6c0bcd78026f2b2519c362d30cf0b4f0cef6ff9a88a2e4d30db57fd05e5713e7 | 1ebbf4d99f447095306561f44f88c04877482884 | amplcpld.vhd, base/amplcpld.vhd, src/amplcpld.vhd |

Lista commitów każdego wariantu jest w known_hdl/variants.json. Wszystkie wersje zapisano w known_hdl/variants/.

Baseline: upstream a6c492e (non verified sources), amplcpld.vhd + comps.vhd. HEAD main 35997f3 dodaje testbench/dokumentację. Gałąź dev obejmuje późniejsze projekty Vivado/FPGA; nie jest dowodem wersji produkcyjnej CPLD. Fork ma późniejsze reorganizacje, zmiany symulacyjne i rozbicie modułów. Żaden znaleziony build CPLD nie zastępuje wymaganego baseline ISE.

Brak oryginalnych constraints/ustawień fittera. Wybrano kod najbliższy produkcyjnej strukturze na podstawie 39 równań rejestrów, nie daty wersji readback. Metadane remote refs dotyczą dostępnego publicznego snapshotu; nie obejmują prywatnych/usuniętych, nieosiągalnych commitów.
