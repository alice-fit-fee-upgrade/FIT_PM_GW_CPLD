//Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
//Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
//Date        : Wed Mar  4 22:36:10 2026
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
    ADC_A_CLK_N,
    ADC_A_CLK_P,
    ADC_BA_N,
    ADC_BA_P,
    ADC_BB_N,
    ADC_BB_P,
    ADC_B_CLK_N,
    ADC_B_CLK_P,
    ADC_CLK,
    ADC_EN1,
    ADC_EN2,
    ADC_MOSI,
    ADC_RESET,
    OSC1,
    PLL_clk_n,
    PLL_clk_p,
    UART_DBG_rxd,
    UART_DBG_txd);
  input [6:0]ADC_AA_N;
  input [6:0]ADC_AA_P;
  input [6:0]ADC_AB_N;
  input [6:0]ADC_AB_P;
  input ADC_A_CLK_N;
  input ADC_A_CLK_P;
  input [6:0]ADC_BA_N;
  input [6:0]ADC_BA_P;
  input [6:0]ADC_BB_N;
  input [6:0]ADC_BB_P;
  input ADC_B_CLK_N;
  input ADC_B_CLK_P;
  output ADC_CLK;
  output [0:0]ADC_EN1;
  output [0:0]ADC_EN2;
  output ADC_MOSI;
  output [0:0]ADC_RESET;
  input OSC1;
  input PLL_clk_n;
  input PLL_clk_p;
  input UART_DBG_rxd;
  output UART_DBG_txd;

  wire [6:0]ADC_AA_N;
  wire [6:0]ADC_AA_P;
  wire [6:0]ADC_AB_N;
  wire [6:0]ADC_AB_P;
  wire ADC_A_CLK_N;
  wire ADC_A_CLK_P;
  wire [6:0]ADC_BA_N;
  wire [6:0]ADC_BA_P;
  wire [6:0]ADC_BB_N;
  wire [6:0]ADC_BB_P;
  wire ADC_B_CLK_N;
  wire ADC_B_CLK_P;
  wire ADC_CLK;
  wire [0:0]ADC_EN1;
  wire [0:0]ADC_EN2;
  wire ADC_MOSI;
  wire [0:0]ADC_RESET;
  wire OSC1;
  wire PLL_clk_n;
  wire PLL_clk_p;
  wire UART_DBG_rxd;
  wire UART_DBG_txd;

  design_1 design_1_i
       (.ADC_AA_N(ADC_AA_N),
        .ADC_AA_P(ADC_AA_P),
        .ADC_AB_N(ADC_AB_N),
        .ADC_AB_P(ADC_AB_P),
        .ADC_A_CLK_N(ADC_A_CLK_N),
        .ADC_A_CLK_P(ADC_A_CLK_P),
        .ADC_BA_N(ADC_BA_N),
        .ADC_BA_P(ADC_BA_P),
        .ADC_BB_N(ADC_BB_N),
        .ADC_BB_P(ADC_BB_P),
        .ADC_B_CLK_N(ADC_B_CLK_N),
        .ADC_B_CLK_P(ADC_B_CLK_P),
        .ADC_CLK(ADC_CLK),
        .ADC_EN1(ADC_EN1),
        .ADC_EN2(ADC_EN2),
        .ADC_MOSI(ADC_MOSI),
        .ADC_RESET(ADC_RESET),
        .OSC1(OSC1),
        .PLL_clk_n(PLL_clk_n),
        .PLL_clk_p(PLL_clk_p),
        .UART_DBG_rxd(UART_DBG_rxd),
        .UART_DBG_txd(UART_DBG_txd));
endmodule
