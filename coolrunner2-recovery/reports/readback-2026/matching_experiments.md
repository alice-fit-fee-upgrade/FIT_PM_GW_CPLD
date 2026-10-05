# Native ISE matching experiments

Source snapshots, fitter reports, JED, raw/canonical diffs and proof attempts are preserved in experiments/matching-2026. Technology variants are diagnostic architecture transcriptions, not recovered historical source.

| Variant | Build exit | SAT exit | Fuse diff | Canonical diff |
|---|---:|---:|---:|---:|
| adc-explicit-fd | 0 | 0 | 978 | 952 |
| count0-maxdelay-speed | 0 | 0 | 380 | 504 |
| counter-ascending | 0 | 0 | 380 | 504 |
| counter-explicit-ftcp | 0 | 0 | 979 | 947 |
| counter-split-terminal | 0 | 0 | 730 | 863 |
| counter-xor-terminal | 0 | 0 | 976 | 957 |
| counter9-cover | 0 | 0 | 736 | 861 |
| counter9-noreduce | 0 | 0 | 728 | 839 |
| directive-ce-golden | 0 | 0 | 346 | 471 |
| directive-counter-collapse | 0 | 0 | 346 | 471 |
| directive-counter-maxpt | 0 | 0 | 346 | 471 |
| directive-fb2-noreduce | 0 | 0 | 348 | 471 |
| directive-keep-cal | 0 | 0 | 346 | 471 |
| directive-maxpt-cal | 0 | 0 | 868 | 915 |
| directive-pt-loc-probe | 245 | — | — | — |
| directive-selective-noreduce | 0 | 0 | 822 | 890 |
| hold-data-negative | 0 | 0 | 979 | 943 |
| init-high | 0 | 0 | 976 | 957 |
| keep-collapse-enable | 0 | 0 | 976 | 957 |
| nested-counter-default | 0 | 0 | 1039 | 992 |
| nested-counter-reg-t | 2 | — | — | — |
| nested-counter-reg-tff | 0 | 0 | 1006 | 960 |
| period80-speed | 0 | 0 | 380 | 504 |
| rename-inhibit | 0 | 0 | 392 | 513 |
| rename-phase | 0 | 0 | 380 | 504 |
| rename-prior | 0 | 0 | 380 | 504 |
| rename-timer | 0 | 0 | 380 | 504 |
| speed-area | 0 | 0 | 388 | 498 |
| speed-counter-xor | 0 | 0 | 380 | 504 |
| speed-ftcp | 0 | 0 | 387 | 490 |
| speed-hold-negative | 0 | 0 | 916 | 941 |
| speed-mlopt | 0 | 0 | 380 | 504 |
| speed-nested-tff | 127 | — | — | — |
| speed-nested-tff-retry | 0 | 0 | 424 | 528 |
| speed-only | 0 | 0 | 380 | 504 |
| speed-technology | 0 | 0 | 927 | 1001 |
| speed-xor-flag | 0 | 0 | 380 | 504 |
| technology-kept-sop-xor | 0 | 0 | 1022 | 986 |
| technology-noreduce | 0 | 0 | 974 | 1009 |
| technology-sop-xor | 2 | — | — | — |
| weight-inputs-zero | 0 | 0 | 976 | 957 |
| weight-pterms-zero | 0 | 0 | 976 | 957 |
| weight-speed-high | 0 | 0 | 976 | 957 |
| wysiwyg-flat | 0 | 0 | 1002 | 967 |
| wysiwyg-mlopt | 0 | 0 | 1002 | 967 |
| xst-area-level1 | 0 | 0 | 966 | 957 |
| xst-area-level2 | 0 | 0 | 968 | 957 |
| xst-speed-level2 | 0 | 0 | 978 | 958 |

Speed fitter initially gave 380; explicit golden cal_sample clear condition gives 346. PERIOD/MAXDELAY adds no change. ZIA, MC/IOB fields, globals and state placement match. Only FB1/FB2 AND/OR differ. FB2 literal covers match after PT permutation; Only the highest counter bit has a different literal cover in the current build. Details: experiments/ise-readback-2026/pt-allocation.json.

Failed speed-nested-tff build was caused by editing a running shell script: resumed reading hit a changed byte offset. Retry passed. Use atomic file replacement or edit between builds. REG="T" is invalid; REG="TFF" is accepted. Undocumented WEMAP/NO_OPTX variables are diagnostic only; no CR-II effect established. Renaming cases initially failed proof name lookup; explicit aliases subsequently gave 49/49 proofs, original failed logs preserved.

To reproduce an individual experiment, use its preserved source.vhd/source.ucf, commands recorded in experiment.json and tools/match_experiment.py with a fresh experiment name. Earlier default density versus current speed is explicitly recorded in cpldfit argv.
