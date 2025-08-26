// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2025 Advanced Micro Devices, Inc. All Rights Reserved.
// -------------------------------------------------------------------------------

`timescale 1 ps / 1 ps

(* BLOCK_STUB = "true" *)
module design_1 (
  UART_DBG_rxd,
  UART_DBG_txd,
  PLL_clk_n,
  PLL_clk_p,
  S11,
  S21,
  S31,
  S41,
  XIO,
  ADC_EN1,
  ADC_EN2,
  ADC_RESET,
  ADC_CLK,
  ADC_MOSI,
  ADC_MISO,
  Gate_STR1_i,
  Gate_STR1_o,
  CLK_A_OUT_N,
  CLK_A_OUT_P,
  CLK_B_OUT_N,
  CLK_B_OUT_P,
  Event1_N,
  Event1_P,
  Event2_N,
  Event2_P,
  Event3_N,
  Event3_P,
  Event4_N,
  Event4_P,
  Calibration_P,
  Calibration_N,
  CFD_OUT,
  OSC1,
  INT_A_G_DRV_N,
  INT_A_G_DRV_P,
  INT_B_G_DRV_N,
  INT_B_G_DRV_P,
  LA0,
  LACK0,
  LACK1,
  LA1,
  ADC_AA_N,
  ADC_AA_P,
  ADC_AB_N,
  ADC_AB_P,
  ADC_BA_N,
  ADC_BA_P,
  ADC_BB_N,
  ADC_BB_P
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
  output [0:0]S11;
  (* X_INTERFACE_IGNORE = "true" *)
  output [0:0]S21;
  (* X_INTERFACE_IGNORE = "true" *)
  output [0:0]S31;
  (* X_INTERFACE_IGNORE = "true" *)
  output [0:0]S41;
  (* X_INTERFACE_IGNORE = "true" *)
  inout [2:0]XIO;
  (* X_INTERFACE_IGNORE = "true" *)
  output [0:0]ADC_EN1;
  (* X_INTERFACE_IGNORE = "true" *)
  output [0:0]ADC_EN2;
  (* X_INTERFACE_IGNORE = "true" *)
  output [0:0]ADC_RESET;
  (* X_INTERFACE_IGNORE = "true" *)
  output ADC_CLK;
  (* X_INTERFACE_IGNORE = "true" *)
  output ADC_MOSI;
  (* X_INTERFACE_IGNORE = "true" *)
  input ADC_MISO;
  (* X_INTERFACE_IGNORE = "true" *)
  output Gate_STR1_i;
  (* X_INTERFACE_IGNORE = "true" *)
  input Gate_STR1_o;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_A_OUT_N CLK" *)
  (* X_INTERFACE_MODE = "slave CLK.CLK_A_OUT_N" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_A_OUT_N, FREQ_HZ 240000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_ADC_CLK_N_0, INSERT_VIP 0" *)
  input CLK_A_OUT_N;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_A_OUT_P CLK" *)
  (* X_INTERFACE_MODE = "slave CLK.CLK_A_OUT_P" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_A_OUT_P, FREQ_HZ 240000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_ADC_CLK_P_0, INSERT_VIP 0" *)
  input CLK_A_OUT_P;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_B_OUT_N CLK" *)
  (* X_INTERFACE_MODE = "slave CLK.CLK_B_OUT_N" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_B_OUT_N, FREQ_HZ 240000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_ADC_CLK_N_1, INSERT_VIP 0" *)
  input CLK_B_OUT_N;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 CLK.CLK_B_OUT_P CLK" *)
  (* X_INTERFACE_MODE = "slave CLK.CLK_B_OUT_P" *)
  (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME CLK.CLK_B_OUT_P, FREQ_HZ 240000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_ADC_CLK_P_1, INSERT_VIP 0" *)
  input CLK_B_OUT_P;
  (* X_INTERFACE_IGNORE = "true" *)
  input Event1_N;
  (* X_INTERFACE_IGNORE = "true" *)
  input Event1_P;
  (* X_INTERFACE_IGNORE = "true" *)
  input Event2_N;
  (* X_INTERFACE_IGNORE = "true" *)
  input Event2_P;
  (* X_INTERFACE_IGNORE = "true" *)
  input Event3_N;
  (* X_INTERFACE_IGNORE = "true" *)
  input Event3_P;
  (* X_INTERFACE_IGNORE = "true" *)
  input Event4_N;
  (* X_INTERFACE_IGNORE = "true" *)
  input Event4_P;
  (* X_INTERFACE_IGNORE = "true" *)
  output Calibration_P;
  (* X_INTERFACE_IGNORE = "true" *)
  output Calibration_N;
  (* X_INTERFACE_IGNORE = "true" *)
  input CFD_OUT;
  (* X_INTERFACE_IGNORE = "true" *)
  input OSC1;
  (* X_INTERFACE_IGNORE = "true" *)
  output INT_A_G_DRV_N;
  (* X_INTERFACE_IGNORE = "true" *)
  output INT_A_G_DRV_P;
  (* X_INTERFACE_IGNORE = "true" *)
  output INT_B_G_DRV_N;
  (* X_INTERFACE_IGNORE = "true" *)
  output INT_B_G_DRV_P;
  (* X_INTERFACE_IGNORE = "true" *)
  output [15:0]LA0;
  (* X_INTERFACE_IGNORE = "true" *)
  output LACK0;
  (* X_INTERFACE_IGNORE = "true" *)
  output LACK1;
  (* X_INTERFACE_IGNORE = "true" *)
  output [15:0]LA1;
  (* X_INTERFACE_IGNORE = "true" *)
  input [6:0]ADC_AA_N;
  (* X_INTERFACE_IGNORE = "true" *)
  input [6:0]ADC_AA_P;
  (* X_INTERFACE_IGNORE = "true" *)
  input [6:0]ADC_AB_N;
  (* X_INTERFACE_IGNORE = "true" *)
  input [6:0]ADC_AB_P;
  (* X_INTERFACE_IGNORE = "true" *)
  input [6:0]ADC_BA_N;
  (* X_INTERFACE_IGNORE = "true" *)
  input [6:0]ADC_BA_P;
  (* X_INTERFACE_IGNORE = "true" *)
  input [6:0]ADC_BB_N;
  (* X_INTERFACE_IGNORE = "true" *)
  input [6:0]ADC_BB_P;

  // stub module has no contents

endmodule
