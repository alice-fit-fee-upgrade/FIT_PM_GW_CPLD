//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
//Date        : Tue Aug 26 17:04:13 2025
//Host        : KP-LABS98 running 64-bit major release  (build 9200)
//Command     : generate_target design_1_wrapper.bd
//Design      : design_1_wrapper
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module design_1_wrapper
   (ADC_AA_N,
    ADC_AA_P,
    ADC_AB_N,
    ADC_AB_P,
    ADC_BA_N,
    ADC_BA_P,
    ADC_BB_N,
    ADC_BB_P,
    ADC_CLK,
    ADC_EN1,
    ADC_EN2,
    ADC_MISO,
    ADC_MOSI,
    ADC_RESET,
    CFD_OUT,
    CLK_A_OUT_N,
    CLK_A_OUT_P,
    CLK_B_OUT_N,
    CLK_B_OUT_P,
    Calibration_N,
    Calibration_P,
    Event1_N,
    Event1_P,
    Event2_N,
    Event2_P,
    Event3_N,
    Event3_P,
    Event4_N,
    Event4_P,
    Gate_STR1_i,
    Gate_STR1_o,
    INT_A_G_DRV_N,
    INT_A_G_DRV_P,
    INT_B_G_DRV_N,
    INT_B_G_DRV_P,
    LA0,
    LA1,
    LACK0,
    LACK1,
    OSC1,
    PLL_clk_n,
    PLL_clk_p,
    S11,
    S21,
    S31,
    S41,
    UART_DBG_rxd,
    UART_DBG_txd,
    XIO);
  input [6:0]ADC_AA_N;
  input [6:0]ADC_AA_P;
  input [6:0]ADC_AB_N;
  input [6:0]ADC_AB_P;
  input [6:0]ADC_BA_N;
  input [6:0]ADC_BA_P;
  input [6:0]ADC_BB_N;
  input [6:0]ADC_BB_P;
  output ADC_CLK;
  output [0:0]ADC_EN1;
  output [0:0]ADC_EN2;
  input ADC_MISO;
  output ADC_MOSI;
  output [0:0]ADC_RESET;
  input CFD_OUT;
  input CLK_A_OUT_N;
  input CLK_A_OUT_P;
  input CLK_B_OUT_N;
  input CLK_B_OUT_P;
  output Calibration_N;
  output Calibration_P;
  input Event1_N;
  input Event1_P;
  input Event2_N;
  input Event2_P;
  input Event3_N;
  input Event3_P;
  input Event4_N;
  input Event4_P;
  output Gate_STR1_i;
  input Gate_STR1_o;
  output INT_A_G_DRV_N;
  output INT_A_G_DRV_P;
  output INT_B_G_DRV_N;
  output INT_B_G_DRV_P;
  output [15:0]LA0;
  output [15:0]LA1;
  output LACK0;
  output LACK1;
  input OSC1;
  input PLL_clk_n;
  input PLL_clk_p;
  output [0:0]S11;
  output [0:0]S21;
  output [0:0]S31;
  output [0:0]S41;
  input UART_DBG_rxd;
  output UART_DBG_txd;
  inout [2:0]XIO;

  wire [6:0]ADC_AA_N;
  wire [6:0]ADC_AA_P;
  wire [6:0]ADC_AB_N;
  wire [6:0]ADC_AB_P;
  wire [6:0]ADC_BA_N;
  wire [6:0]ADC_BA_P;
  wire [6:0]ADC_BB_N;
  wire [6:0]ADC_BB_P;
  wire ADC_CLK;
  wire [0:0]ADC_EN1;
  wire [0:0]ADC_EN2;
  wire ADC_MISO;
  wire ADC_MOSI;
  wire [0:0]ADC_RESET;
  wire CFD_OUT;
  wire CLK_A_OUT_N;
  wire CLK_A_OUT_P;
  wire CLK_B_OUT_N;
  wire CLK_B_OUT_P;
  wire Calibration_N;
  wire Calibration_P;
  wire Event1_N;
  wire Event1_P;
  wire Event2_N;
  wire Event2_P;
  wire Event3_N;
  wire Event3_P;
  wire Event4_N;
  wire Event4_P;
  wire Gate_STR1_i;
  wire Gate_STR1_o;
  wire INT_A_G_DRV_N;
  wire INT_A_G_DRV_P;
  wire INT_B_G_DRV_N;
  wire INT_B_G_DRV_P;
  wire [15:0]LA0;
  wire [15:0]LA1;
  wire LACK0;
  wire LACK1;
  wire OSC1;
  wire PLL_clk_n;
  wire PLL_clk_p;
  wire [0:0]S11;
  wire [0:0]S21;
  wire [0:0]S31;
  wire [0:0]S41;
  wire UART_DBG_rxd;
  wire UART_DBG_txd;
  wire [2:0]XIO;

  design_1 design_1_i
       (.ADC_AA_N(ADC_AA_N),
        .ADC_AA_P(ADC_AA_P),
        .ADC_AB_N(ADC_AB_N),
        .ADC_AB_P(ADC_AB_P),
        .ADC_BA_N(ADC_BA_N),
        .ADC_BA_P(ADC_BA_P),
        .ADC_BB_N(ADC_BB_N),
        .ADC_BB_P(ADC_BB_P),
        .ADC_CLK(ADC_CLK),
        .ADC_EN1(ADC_EN1),
        .ADC_EN2(ADC_EN2),
        .ADC_MISO(ADC_MISO),
        .ADC_MOSI(ADC_MOSI),
        .ADC_RESET(ADC_RESET),
        .CFD_OUT(CFD_OUT),
        .CLK_A_OUT_N(CLK_A_OUT_N),
        .CLK_A_OUT_P(CLK_A_OUT_P),
        .CLK_B_OUT_N(CLK_B_OUT_N),
        .CLK_B_OUT_P(CLK_B_OUT_P),
        .Calibration_N(Calibration_N),
        .Calibration_P(Calibration_P),
        .Event1_N(Event1_N),
        .Event1_P(Event1_P),
        .Event2_N(Event2_N),
        .Event2_P(Event2_P),
        .Event3_N(Event3_N),
        .Event3_P(Event3_P),
        .Event4_N(Event4_N),
        .Event4_P(Event4_P),
        .Gate_STR1_i(Gate_STR1_i),
        .Gate_STR1_o(Gate_STR1_o),
        .INT_A_G_DRV_N(INT_A_G_DRV_N),
        .INT_A_G_DRV_P(INT_A_G_DRV_P),
        .INT_B_G_DRV_N(INT_B_G_DRV_N),
        .INT_B_G_DRV_P(INT_B_G_DRV_P),
        .LA0(LA0),
        .LA1(LA1),
        .LACK0(LACK0),
        .LACK1(LACK1),
        .OSC1(OSC1),
        .PLL_clk_n(PLL_clk_n),
        .PLL_clk_p(PLL_clk_p),
        .S11(S11),
        .S21(S21),
        .S31(S31),
        .S41(S41),
        .UART_DBG_rxd(UART_DBG_rxd),
        .UART_DBG_txd(UART_DBG_txd),
        .XIO(XIO));
endmodule
