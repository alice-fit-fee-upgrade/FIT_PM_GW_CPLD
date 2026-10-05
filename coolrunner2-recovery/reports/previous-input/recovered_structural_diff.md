# recovered: ISE 14.7 vs golden

Raw fuse Hamming distance: **0/55341**.
Canonical scalar field differences: **0**. Counts are placement-sensitive, not functional errors.

| Region | Changed canonical fields |
|---|---:|

| FB | Golden registers | Candidate registers | Golden enabled outputs | Candidate enabled outputs |
|---:|---:|---:|---:|---:|
| 1 | 15 | 15 | 0 | 0 |
| 2 | 5 | 5 | 1 | 1 |
| 3 | 9 | 9 | 9 | 9 |
| 4 | 0 | 0 | 0 | 0 |
| 5 | 0 | 0 | 0 | 0 |
| 6 | 3 | 3 | 1 | 1 |
| 7 | 6 | 6 | 6 | 6 |
| 8 | 1 | 1 | 1 | 1 |

## Global fields

| Field | Golden | Candidate |
|---|---|---|
| BANK0_IBUF_VOLT | LOW | LOW |
| BANK0_OBUF_VOLT | LOW | LOW |
| BANK1_IBUF_VOLT | LOW | LOW |
| BANK1_OBUF_VOLT | LOW | LOW |
| CLKDIV_DELAY_ENABLE | 0 | 0 |
| CLKDIV_DIV | 16 | 16 |
| CLKDIV_ENABLE | 0 | 0 |
| DGE_ENABLE | 0 | 0 |
| FCLK0_ENABLE | 0 | 0 |
| FCLK1_ENABLE | 0 | 0 |
| FCLK2_ENABLE | 1 | 1 |
| FOE0_MUX | NONE | NONE |
| FOE1_MUX | NONE | NONE |
| FOE2_MUX | NONE | NONE |
| FOE3_MUX | NONE | NONE |
| FSR_ENABLE | 0 | 0 |
| FSR_INV | 1 | 1 |
| TERM_MODE | KEEPER | KEEPER |
| VREF_ENABLE | 0 | 0 |

## Changed pin configuration

| Pin | Resource | Field | Golden | Candidate |
|---:|---|---|---|---|

## Evidence

All fit/synthesis reports, equations and VM6: experiments/ise-recovered/. Full structural-diff.json contains individual ZIA, AND/OR, register clock/mode/reset/init and I/O field changes. Configuration.json preserves the candidate independently.

A relocated register or different PT decomposition can change many fuses. Functional equivalence must use fitter equations/net names to establish state mapping. No programming was performed.
