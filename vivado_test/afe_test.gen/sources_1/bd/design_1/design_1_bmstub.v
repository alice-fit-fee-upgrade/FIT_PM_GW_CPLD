// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2026 Advanced Micro Devices, Inc. All Rights Reserved.
// -------------------------------------------------------------------------------

`timescale 1 ps / 1 ps

(* BLOCK_STUB = "true" *)
module design_1 (
  UART_DBG_rxd,
  UART_DBG_txd,
  PLL_clk_n,
  PLL_clk_p,
  ADC_MOSI,
  ADC_CLK,
  ADC_RESET,
  ADC_EN1,
  ADC_EN2,
  OSC1,
  ADC_AA_N,
  ADC_AA_P,
  ADC_AB_N,
  ADC_AB_P,
  ADC_A_CLK_N,
  ADC_A_CLK_P,
  ADC_BA_N,
  ADC_BA_P,
  ADC_BB_N,
  ADC_BB_P,
  ADC_B_CLK_N,
  ADC_B_CLK_P
);

  (* X_INTERFACE_INFO = "xilinx.com:interface:uart:1.0 UART_DBG RxD" *)
  (* X_INTERFACE_MODE = "master UART_DBG" *)
  input UART_DBG_rxd;
  (* X_INTERFACE_INFO = "xilinx.com:interface:uart:1.0 UART_DBG TxD" *)
  output UART_DBG_txd;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 PLL CLK_N" *)
  (* X_INTERFACE_MODE = "slave PLL" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME PLL, CAN_DEBUG false, FREQ_HZ 100000000" *)
  input PLL_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 PLL CLK_P" *)
  input PLL_clk_p;
  (* X_INTERFACE_IGNORE = "true" *)
  output ADC_MOSI;
  (* X_INTERFACE_IGNORE = "true" *)
  output ADC_CLK;
  (* X_INTERFACE_IGNORE = "true" *)
  output [0:0]ADC_RESET;
  (* X_INTERFACE_IGNORE = "true" *)
  output [0:0]ADC_EN1;
  (* X_INTERFACE_IGNORE = "true" *)
  output [0:0]ADC_EN2;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.OSC1 CLK" *)
  (* X_INTERFACE_MODE = "slave CLK.OSC1" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.OSC1, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_clk_in1_0, INSERT_VIP 0" *)
  input OSC1;
  (* X_INTERFACE_IGNORE = "true" *)
  input [6:0]ADC_AA_N;
  (* X_INTERFACE_IGNORE = "true" *)
  input [6:0]ADC_AA_P;
  (* X_INTERFACE_IGNORE = "true" *)
  input [6:0]ADC_AB_N;
  (* X_INTERFACE_IGNORE = "true" *)
  input [6:0]ADC_AB_P;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.ADC_A_CLK_N CLK" *)
  (* X_INTERFACE_MODE = "slave CLK.ADC_A_CLK_N" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.ADC_A_CLK_N, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_ADC_A_CLK_N_0, INSERT_VIP 0" *)
  input ADC_A_CLK_N;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.ADC_A_CLK_P CLK" *)
  (* X_INTERFACE_MODE = "slave CLK.ADC_A_CLK_P" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.ADC_A_CLK_P, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_ADC_A_CLK_P_0, INSERT_VIP 0" *)
  input ADC_A_CLK_P;
  (* X_INTERFACE_IGNORE = "true" *)
  input [6:0]ADC_BA_N;
  (* X_INTERFACE_IGNORE = "true" *)
  input [6:0]ADC_BA_P;
  (* X_INTERFACE_IGNORE = "true" *)
  input [6:0]ADC_BB_N;
  (* X_INTERFACE_IGNORE = "true" *)
  input [6:0]ADC_BB_P;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.ADC_B_CLK_N CLK" *)
  (* X_INTERFACE_MODE = "slave CLK.ADC_B_CLK_N" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.ADC_B_CLK_N, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_ADC_B_CLK_N_0, INSERT_VIP 0" *)
  input ADC_B_CLK_N;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.ADC_B_CLK_P CLK" *)
  (* X_INTERFACE_MODE = "slave CLK.ADC_B_CLK_P" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.ADC_B_CLK_P, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_ADC_B_CLK_P_0, INSERT_VIP 0" *)
  input ADC_B_CLK_P;

  // stub module has no contents

endmodule
