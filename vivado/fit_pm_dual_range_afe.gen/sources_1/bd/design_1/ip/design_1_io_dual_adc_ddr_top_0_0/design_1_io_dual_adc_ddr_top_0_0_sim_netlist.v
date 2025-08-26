// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Tue Aug 26 14:56:37 2025
// Host        : KP-LABS98 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/rsmalec/_FPGA/_PW/FIT_PM_GW_CPLD/vivado/fit_pm_dual_range_afe/fit_pm_dual_range_afe.gen/sources_1/bd/design_1/ip/design_1_io_dual_adc_ddr_top_0_0/design_1_io_dual_adc_ddr_top_0_0_sim_netlist.v
// Design      : design_1_io_dual_adc_ddr_top_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcau10p-ffvb676-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_io_dual_adc_ddr_top_0_0,io_dual_adc_ddr_top,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "io_dual_adc_ddr_top,Vivado 2024.2" *) 
(* NotValidForBitStream *)
module design_1_io_dual_adc_ddr_top_0_0
   (rstn,
    ADC_A_CLK_P,
    ADC_A_CLK_N,
    ADC_AA_P,
    ADC_AA_N,
    ADC_AB_P,
    ADC_AB_N,
    ADC_A_CLK,
    ADC_AA,
    ADC_AB,
    ADC_B_CLK_P,
    ADC_B_CLK_N,
    ADC_BA_P,
    ADC_BA_N,
    ADC_BB_P,
    ADC_BB_N,
    ADC_B_CLK,
    ADC_BA,
    ADC_BB);
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rstn RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rstn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rstn;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ADC_A_CLK_P CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ADC_A_CLK_P, FREQ_HZ 240000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_ADC_CLK_P_0, INSERT_VIP 0" *) input ADC_A_CLK_P;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ADC_A_CLK_N CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ADC_A_CLK_N, FREQ_HZ 240000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_ADC_CLK_N_0, INSERT_VIP 0" *) input ADC_A_CLK_N;
  input [6:0]ADC_AA_P;
  input [6:0]ADC_AA_N;
  input [6:0]ADC_AB_P;
  input [6:0]ADC_AB_N;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ADC_A_CLK CLK" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ADC_A_CLK, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_io_dual_adc_ddr_top_0_0_ADC_A_CLK, INSERT_VIP 0" *) output ADC_A_CLK;
  output [13:0]ADC_AA;
  output [13:0]ADC_AB;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ADC_B_CLK_P CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ADC_B_CLK_P, FREQ_HZ 240000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_ADC_CLK_P_1, INSERT_VIP 0" *) input ADC_B_CLK_P;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ADC_B_CLK_N CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ADC_B_CLK_N, FREQ_HZ 240000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_ADC_CLK_N_1, INSERT_VIP 0" *) input ADC_B_CLK_N;
  input [6:0]ADC_BA_P;
  input [6:0]ADC_BA_N;
  input [6:0]ADC_BB_P;
  input [6:0]ADC_BB_N;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ADC_B_CLK CLK" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ADC_B_CLK, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_io_dual_adc_ddr_top_0_0_ADC_B_CLK, INSERT_VIP 0" *) output ADC_B_CLK;
  output [13:0]ADC_BA;
  output [13:0]ADC_BB;

  wire [13:0]ADC_AA;
  (* IBUF_LOW_PWR *) wire [6:0]ADC_AA_N;
  (* IBUF_LOW_PWR *) wire [6:0]ADC_AA_P;
  wire [13:0]ADC_AB;
  (* IBUF_LOW_PWR *) wire [6:0]ADC_AB_N;
  (* IBUF_LOW_PWR *) wire [6:0]ADC_AB_P;
  wire ADC_A_CLK;
  (* IBUF_LOW_PWR *) wire ADC_A_CLK_N;
  (* IBUF_LOW_PWR *) wire ADC_A_CLK_P;
  wire [13:0]ADC_BA;
  (* IBUF_LOW_PWR *) wire [6:0]ADC_BA_N;
  (* IBUF_LOW_PWR *) wire [6:0]ADC_BA_P;
  wire [13:0]ADC_BB;
  (* IBUF_LOW_PWR *) wire [6:0]ADC_BB_N;
  (* IBUF_LOW_PWR *) wire [6:0]ADC_BB_P;
  wire ADC_B_CLK;
  (* IBUF_LOW_PWR *) wire ADC_B_CLK_N;
  (* IBUF_LOW_PWR *) wire ADC_B_CLK_P;
  wire rstn;

  design_1_io_dual_adc_ddr_top_0_0_io_dual_adc_ddr_top inst
       (.ADC_AA(ADC_AA),
        .ADC_AA_N(ADC_AA_N),
        .ADC_AA_P(ADC_AA_P),
        .ADC_AB(ADC_AB),
        .ADC_AB_N(ADC_AB_N),
        .ADC_AB_P(ADC_AB_P),
        .ADC_A_CLK(ADC_A_CLK),
        .ADC_A_CLK_N(ADC_A_CLK_N),
        .ADC_A_CLK_P(ADC_A_CLK_P),
        .ADC_BA(ADC_BA),
        .ADC_BA_N(ADC_BA_N),
        .ADC_BA_P(ADC_BA_P),
        .ADC_BB(ADC_BB),
        .ADC_BB_N(ADC_BB_N),
        .ADC_BB_P(ADC_BB_P),
        .ADC_B_CLK(ADC_B_CLK),
        .ADC_B_CLK_N(ADC_B_CLK_N),
        .ADC_B_CLK_P(ADC_B_CLK_P),
        .rstn(rstn));
endmodule

(* ORIG_REF_NAME = "adc_ddr_top" *) 
module design_1_io_dual_adc_ddr_top_0_0_adc_ddr_top
   (ADC_A_CLK,
    ADC_AA,
    ADC_AB,
    ADC_A_CLK_P,
    ADC_A_CLK_N,
    ADC_AA_P,
    ADC_AA_N,
    \adcAA_d_reg[13]_0 ,
    ADC_AB_P,
    ADC_AB_N);
  output ADC_A_CLK;
  output [13:0]ADC_AA;
  output [13:0]ADC_AB;
  input ADC_A_CLK_P;
  input ADC_A_CLK_N;
  input [6:0]ADC_AA_P;
  input [6:0]ADC_AA_N;
  input \adcAA_d_reg[13]_0 ;
  input [6:0]ADC_AB_P;
  input [6:0]ADC_AB_N;

  wire [13:0]ADC_AA;
  wire [6:0]ADC_AA_N;
  wire [6:0]ADC_AA_P;
  wire [13:0]ADC_AB;
  wire [6:0]ADC_AB_N;
  wire [6:0]ADC_AB_P;
  wire ADC_A_CLK;
  wire ADC_A_CLK_N;
  wire ADC_A_CLK_P;
  wire \adcAA_d_reg[13]_0 ;
  wire adcAA_ddr_0;
  wire adcAA_ddr_1;
  wire adcAA_ddr_2;
  wire adcAA_ddr_3;
  wire adcAA_ddr_4;
  wire adcAA_ddr_5;
  wire adcAA_ddr_6;
  wire adcAB_d_q1_0;
  wire adcAB_d_q1_1;
  wire adcAB_d_q1_2;
  wire adcAB_d_q1_3;
  wire adcAB_d_q1_4;
  wire adcAB_d_q1_5;
  wire adcAB_d_q1_6;
  wire adcAB_d_q2_0;
  wire adcAB_d_q2_1;
  wire adcAB_d_q2_2;
  wire adcAB_d_q2_3;
  wire adcAB_d_q2_4;
  wire adcAB_d_q2_5;
  wire adcAB_d_q2_6;
  wire adcAB_ddr_0;
  wire adcAB_ddr_1;
  wire adcAB_ddr_2;
  wire adcAB_ddr_3;
  wire adcAB_ddr_4;
  wire adcAB_ddr_5;
  wire adcAB_ddr_6;
  wire adcA_clk_buff;
  wire [13:0]p_7_out;

  FDCE \adcAA_d_reg[0] 
       (.C(ADC_A_CLK),
        .CE(1'b1),
        .CLR(\adcAA_d_reg[13]_0 ),
        .D(p_7_out[0]),
        .Q(ADC_AA[0]));
  FDCE \adcAA_d_reg[10] 
       (.C(ADC_A_CLK),
        .CE(1'b1),
        .CLR(\adcAA_d_reg[13]_0 ),
        .D(p_7_out[10]),
        .Q(ADC_AA[10]));
  FDCE \adcAA_d_reg[11] 
       (.C(ADC_A_CLK),
        .CE(1'b1),
        .CLR(\adcAA_d_reg[13]_0 ),
        .D(p_7_out[11]),
        .Q(ADC_AA[11]));
  FDCE \adcAA_d_reg[12] 
       (.C(ADC_A_CLK),
        .CE(1'b1),
        .CLR(\adcAA_d_reg[13]_0 ),
        .D(p_7_out[12]),
        .Q(ADC_AA[12]));
  FDCE \adcAA_d_reg[13] 
       (.C(ADC_A_CLK),
        .CE(1'b1),
        .CLR(\adcAA_d_reg[13]_0 ),
        .D(p_7_out[13]),
        .Q(ADC_AA[13]));
  FDCE \adcAA_d_reg[1] 
       (.C(ADC_A_CLK),
        .CE(1'b1),
        .CLR(\adcAA_d_reg[13]_0 ),
        .D(p_7_out[1]),
        .Q(ADC_AA[1]));
  FDCE \adcAA_d_reg[2] 
       (.C(ADC_A_CLK),
        .CE(1'b1),
        .CLR(\adcAA_d_reg[13]_0 ),
        .D(p_7_out[2]),
        .Q(ADC_AA[2]));
  FDCE \adcAA_d_reg[3] 
       (.C(ADC_A_CLK),
        .CE(1'b1),
        .CLR(\adcAA_d_reg[13]_0 ),
        .D(p_7_out[3]),
        .Q(ADC_AA[3]));
  FDCE \adcAA_d_reg[4] 
       (.C(ADC_A_CLK),
        .CE(1'b1),
        .CLR(\adcAA_d_reg[13]_0 ),
        .D(p_7_out[4]),
        .Q(ADC_AA[4]));
  FDCE \adcAA_d_reg[5] 
       (.C(ADC_A_CLK),
        .CE(1'b1),
        .CLR(\adcAA_d_reg[13]_0 ),
        .D(p_7_out[5]),
        .Q(ADC_AA[5]));
  FDCE \adcAA_d_reg[6] 
       (.C(ADC_A_CLK),
        .CE(1'b1),
        .CLR(\adcAA_d_reg[13]_0 ),
        .D(p_7_out[6]),
        .Q(ADC_AA[6]));
  FDCE \adcAA_d_reg[7] 
       (.C(ADC_A_CLK),
        .CE(1'b1),
        .CLR(\adcAA_d_reg[13]_0 ),
        .D(p_7_out[7]),
        .Q(ADC_AA[7]));
  FDCE \adcAA_d_reg[8] 
       (.C(ADC_A_CLK),
        .CE(1'b1),
        .CLR(\adcAA_d_reg[13]_0 ),
        .D(p_7_out[8]),
        .Q(ADC_AA[8]));
  FDCE \adcAA_d_reg[9] 
       (.C(ADC_A_CLK),
        .CE(1'b1),
        .CLR(\adcAA_d_reg[13]_0 ),
        .D(p_7_out[9]),
        .Q(ADC_AA[9]));
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  (* box_type = "PRIMITIVE" *) 
  IBUFDS #(
    .DIFF_TERM("FALSE"),
    .IOSTANDARD("DEFAULT")) 
    \adcAA_ddr_IN[0].adcAA_ibufds 
       (.I(ADC_AA_P[0]),
        .IB(ADC_AA_N[0]),
        .O(adcAA_ddr_0));
  (* box_type = "PRIMITIVE" *) 
  IDDRE1 #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .IS_CB_INVERTED(1'b1),
    .IS_C_INVERTED(1'b0)) 
    \adcAA_ddr_IN[0].adcAA_iddre1 
       (.C(ADC_A_CLK),
        .CB(ADC_A_CLK),
        .D(adcAA_ddr_0),
        .Q1(p_7_out[0]),
        .Q2(p_7_out[1]),
        .R(\adcAA_d_reg[13]_0 ));
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  (* box_type = "PRIMITIVE" *) 
  IBUFDS #(
    .DIFF_TERM("FALSE"),
    .IOSTANDARD("DEFAULT")) 
    \adcAA_ddr_IN[1].adcAA_ibufds 
       (.I(ADC_AA_P[1]),
        .IB(ADC_AA_N[1]),
        .O(adcAA_ddr_1));
  (* box_type = "PRIMITIVE" *) 
  IDDRE1 #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .IS_CB_INVERTED(1'b1),
    .IS_C_INVERTED(1'b0)) 
    \adcAA_ddr_IN[1].adcAA_iddre1 
       (.C(ADC_A_CLK),
        .CB(ADC_A_CLK),
        .D(adcAA_ddr_1),
        .Q1(p_7_out[2]),
        .Q2(p_7_out[3]),
        .R(\adcAA_d_reg[13]_0 ));
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  (* box_type = "PRIMITIVE" *) 
  IBUFDS #(
    .DIFF_TERM("FALSE"),
    .IOSTANDARD("DEFAULT")) 
    \adcAA_ddr_IN[2].adcAA_ibufds 
       (.I(ADC_AA_P[2]),
        .IB(ADC_AA_N[2]),
        .O(adcAA_ddr_2));
  (* box_type = "PRIMITIVE" *) 
  IDDRE1 #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .IS_CB_INVERTED(1'b1),
    .IS_C_INVERTED(1'b0)) 
    \adcAA_ddr_IN[2].adcAA_iddre1 
       (.C(ADC_A_CLK),
        .CB(ADC_A_CLK),
        .D(adcAA_ddr_2),
        .Q1(p_7_out[4]),
        .Q2(p_7_out[5]),
        .R(\adcAA_d_reg[13]_0 ));
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  (* box_type = "PRIMITIVE" *) 
  IBUFDS #(
    .DIFF_TERM("FALSE"),
    .IOSTANDARD("DEFAULT")) 
    \adcAA_ddr_IN[3].adcAA_ibufds 
       (.I(ADC_AA_P[3]),
        .IB(ADC_AA_N[3]),
        .O(adcAA_ddr_3));
  (* box_type = "PRIMITIVE" *) 
  IDDRE1 #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .IS_CB_INVERTED(1'b1),
    .IS_C_INVERTED(1'b0)) 
    \adcAA_ddr_IN[3].adcAA_iddre1 
       (.C(ADC_A_CLK),
        .CB(ADC_A_CLK),
        .D(adcAA_ddr_3),
        .Q1(p_7_out[6]),
        .Q2(p_7_out[7]),
        .R(\adcAA_d_reg[13]_0 ));
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  (* box_type = "PRIMITIVE" *) 
  IBUFDS #(
    .DIFF_TERM("FALSE"),
    .IOSTANDARD("DEFAULT")) 
    \adcAA_ddr_IN[4].adcAA_ibufds 
       (.I(ADC_AA_P[4]),
        .IB(ADC_AA_N[4]),
        .O(adcAA_ddr_4));
  (* box_type = "PRIMITIVE" *) 
  IDDRE1 #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .IS_CB_INVERTED(1'b1),
    .IS_C_INVERTED(1'b0)) 
    \adcAA_ddr_IN[4].adcAA_iddre1 
       (.C(ADC_A_CLK),
        .CB(ADC_A_CLK),
        .D(adcAA_ddr_4),
        .Q1(p_7_out[8]),
        .Q2(p_7_out[9]),
        .R(\adcAA_d_reg[13]_0 ));
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  (* box_type = "PRIMITIVE" *) 
  IBUFDS #(
    .DIFF_TERM("FALSE"),
    .IOSTANDARD("DEFAULT")) 
    \adcAA_ddr_IN[5].adcAA_ibufds 
       (.I(ADC_AA_P[5]),
        .IB(ADC_AA_N[5]),
        .O(adcAA_ddr_5));
  (* box_type = "PRIMITIVE" *) 
  IDDRE1 #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .IS_CB_INVERTED(1'b1),
    .IS_C_INVERTED(1'b0)) 
    \adcAA_ddr_IN[5].adcAA_iddre1 
       (.C(ADC_A_CLK),
        .CB(ADC_A_CLK),
        .D(adcAA_ddr_5),
        .Q1(p_7_out[10]),
        .Q2(p_7_out[11]),
        .R(\adcAA_d_reg[13]_0 ));
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  (* box_type = "PRIMITIVE" *) 
  IBUFDS #(
    .DIFF_TERM("FALSE"),
    .IOSTANDARD("DEFAULT")) 
    \adcAA_ddr_IN[6].adcAA_ibufds 
       (.I(ADC_AA_P[6]),
        .IB(ADC_AA_N[6]),
        .O(adcAA_ddr_6));
  (* box_type = "PRIMITIVE" *) 
  IDDRE1 #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .IS_CB_INVERTED(1'b1),
    .IS_C_INVERTED(1'b0)) 
    \adcAA_ddr_IN[6].adcAA_iddre1 
       (.C(ADC_A_CLK),
        .CB(ADC_A_CLK),
        .D(adcAA_ddr_6),
        .Q1(p_7_out[12]),
        .Q2(p_7_out[13]),
        .R(\adcAA_d_reg[13]_0 ));
  FDCE \adcAB_d_reg[0] 
       (.C(ADC_A_CLK),
        .CE(1'b1),
        .CLR(\adcAA_d_reg[13]_0 ),
        .D(adcAB_d_q1_0),
        .Q(ADC_AB[0]));
  FDCE \adcAB_d_reg[10] 
       (.C(ADC_A_CLK),
        .CE(1'b1),
        .CLR(\adcAA_d_reg[13]_0 ),
        .D(adcAB_d_q1_5),
        .Q(ADC_AB[10]));
  FDCE \adcAB_d_reg[11] 
       (.C(ADC_A_CLK),
        .CE(1'b1),
        .CLR(\adcAA_d_reg[13]_0 ),
        .D(adcAB_d_q2_5),
        .Q(ADC_AB[11]));
  FDCE \adcAB_d_reg[12] 
       (.C(ADC_A_CLK),
        .CE(1'b1),
        .CLR(\adcAA_d_reg[13]_0 ),
        .D(adcAB_d_q1_6),
        .Q(ADC_AB[12]));
  FDCE \adcAB_d_reg[13] 
       (.C(ADC_A_CLK),
        .CE(1'b1),
        .CLR(\adcAA_d_reg[13]_0 ),
        .D(adcAB_d_q2_6),
        .Q(ADC_AB[13]));
  FDCE \adcAB_d_reg[1] 
       (.C(ADC_A_CLK),
        .CE(1'b1),
        .CLR(\adcAA_d_reg[13]_0 ),
        .D(adcAB_d_q2_0),
        .Q(ADC_AB[1]));
  FDCE \adcAB_d_reg[2] 
       (.C(ADC_A_CLK),
        .CE(1'b1),
        .CLR(\adcAA_d_reg[13]_0 ),
        .D(adcAB_d_q1_1),
        .Q(ADC_AB[2]));
  FDCE \adcAB_d_reg[3] 
       (.C(ADC_A_CLK),
        .CE(1'b1),
        .CLR(\adcAA_d_reg[13]_0 ),
        .D(adcAB_d_q2_1),
        .Q(ADC_AB[3]));
  FDCE \adcAB_d_reg[4] 
       (.C(ADC_A_CLK),
        .CE(1'b1),
        .CLR(\adcAA_d_reg[13]_0 ),
        .D(adcAB_d_q1_2),
        .Q(ADC_AB[4]));
  FDCE \adcAB_d_reg[5] 
       (.C(ADC_A_CLK),
        .CE(1'b1),
        .CLR(\adcAA_d_reg[13]_0 ),
        .D(adcAB_d_q2_2),
        .Q(ADC_AB[5]));
  FDCE \adcAB_d_reg[6] 
       (.C(ADC_A_CLK),
        .CE(1'b1),
        .CLR(\adcAA_d_reg[13]_0 ),
        .D(adcAB_d_q1_3),
        .Q(ADC_AB[6]));
  FDCE \adcAB_d_reg[7] 
       (.C(ADC_A_CLK),
        .CE(1'b1),
        .CLR(\adcAA_d_reg[13]_0 ),
        .D(adcAB_d_q2_3),
        .Q(ADC_AB[7]));
  FDCE \adcAB_d_reg[8] 
       (.C(ADC_A_CLK),
        .CE(1'b1),
        .CLR(\adcAA_d_reg[13]_0 ),
        .D(adcAB_d_q1_4),
        .Q(ADC_AB[8]));
  FDCE \adcAB_d_reg[9] 
       (.C(ADC_A_CLK),
        .CE(1'b1),
        .CLR(\adcAA_d_reg[13]_0 ),
        .D(adcAB_d_q2_4),
        .Q(ADC_AB[9]));
  (* XILINX_LEGACY_PRIM = "BUFG" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE" *) 
  (* box_type = "PRIMITIVE" *) 
  BUFGCE #(
    .CE_TYPE("ASYNC"),
    .SIM_DEVICE("ULTRASCALE_PLUS")) 
    adcA_clk_bufg
       (.CE(1'b1),
        .I(adcA_clk_buff),
        .O(ADC_A_CLK));
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  (* box_type = "PRIMITIVE" *) 
  IBUFDS #(
    .DIFF_TERM("FALSE"),
    .IOSTANDARD("DEFAULT")) 
    adcA_clk_ibufds
       (.I(ADC_A_CLK_P),
        .IB(ADC_A_CLK_N),
        .O(adcA_clk_buff));
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  (* box_type = "PRIMITIVE" *) 
  IBUFDS #(
    .DIFF_TERM("FALSE"),
    .IOSTANDARD("DEFAULT")) 
    \adcA_ddr_IN[0].adcAB_ibufds 
       (.I(ADC_AB_P[0]),
        .IB(ADC_AB_N[0]),
        .O(adcAB_ddr_0));
  (* box_type = "PRIMITIVE" *) 
  IDDRE1 #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .IS_CB_INVERTED(1'b1),
    .IS_C_INVERTED(1'b0)) 
    \adcA_ddr_IN[0].adcAB_iddre1 
       (.C(ADC_A_CLK),
        .CB(ADC_A_CLK),
        .D(adcAB_ddr_0),
        .Q1(adcAB_d_q1_0),
        .Q2(adcAB_d_q2_0),
        .R(\adcAA_d_reg[13]_0 ));
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  (* box_type = "PRIMITIVE" *) 
  IBUFDS #(
    .DIFF_TERM("FALSE"),
    .IOSTANDARD("DEFAULT")) 
    \adcA_ddr_IN[1].adcAB_ibufds 
       (.I(ADC_AB_P[1]),
        .IB(ADC_AB_N[1]),
        .O(adcAB_ddr_1));
  (* box_type = "PRIMITIVE" *) 
  IDDRE1 #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .IS_CB_INVERTED(1'b1),
    .IS_C_INVERTED(1'b0)) 
    \adcA_ddr_IN[1].adcAB_iddre1 
       (.C(ADC_A_CLK),
        .CB(ADC_A_CLK),
        .D(adcAB_ddr_1),
        .Q1(adcAB_d_q1_1),
        .Q2(adcAB_d_q2_1),
        .R(\adcAA_d_reg[13]_0 ));
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  (* box_type = "PRIMITIVE" *) 
  IBUFDS #(
    .DIFF_TERM("FALSE"),
    .IOSTANDARD("DEFAULT")) 
    \adcA_ddr_IN[2].adcAB_ibufds 
       (.I(ADC_AB_P[2]),
        .IB(ADC_AB_N[2]),
        .O(adcAB_ddr_2));
  (* box_type = "PRIMITIVE" *) 
  IDDRE1 #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .IS_CB_INVERTED(1'b1),
    .IS_C_INVERTED(1'b0)) 
    \adcA_ddr_IN[2].adcAB_iddre1 
       (.C(ADC_A_CLK),
        .CB(ADC_A_CLK),
        .D(adcAB_ddr_2),
        .Q1(adcAB_d_q1_2),
        .Q2(adcAB_d_q2_2),
        .R(\adcAA_d_reg[13]_0 ));
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  (* box_type = "PRIMITIVE" *) 
  IBUFDS #(
    .DIFF_TERM("FALSE"),
    .IOSTANDARD("DEFAULT")) 
    \adcA_ddr_IN[3].adcAB_ibufds 
       (.I(ADC_AB_P[3]),
        .IB(ADC_AB_N[3]),
        .O(adcAB_ddr_3));
  (* box_type = "PRIMITIVE" *) 
  IDDRE1 #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .IS_CB_INVERTED(1'b1),
    .IS_C_INVERTED(1'b0)) 
    \adcA_ddr_IN[3].adcAB_iddre1 
       (.C(ADC_A_CLK),
        .CB(ADC_A_CLK),
        .D(adcAB_ddr_3),
        .Q1(adcAB_d_q1_3),
        .Q2(adcAB_d_q2_3),
        .R(\adcAA_d_reg[13]_0 ));
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  (* box_type = "PRIMITIVE" *) 
  IBUFDS #(
    .DIFF_TERM("FALSE"),
    .IOSTANDARD("DEFAULT")) 
    \adcA_ddr_IN[4].adcAB_ibufds 
       (.I(ADC_AB_P[4]),
        .IB(ADC_AB_N[4]),
        .O(adcAB_ddr_4));
  (* box_type = "PRIMITIVE" *) 
  IDDRE1 #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .IS_CB_INVERTED(1'b1),
    .IS_C_INVERTED(1'b0)) 
    \adcA_ddr_IN[4].adcAB_iddre1 
       (.C(ADC_A_CLK),
        .CB(ADC_A_CLK),
        .D(adcAB_ddr_4),
        .Q1(adcAB_d_q1_4),
        .Q2(adcAB_d_q2_4),
        .R(\adcAA_d_reg[13]_0 ));
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  (* box_type = "PRIMITIVE" *) 
  IBUFDS #(
    .DIFF_TERM("FALSE"),
    .IOSTANDARD("DEFAULT")) 
    \adcA_ddr_IN[5].adcAB_ibufds 
       (.I(ADC_AB_P[5]),
        .IB(ADC_AB_N[5]),
        .O(adcAB_ddr_5));
  (* box_type = "PRIMITIVE" *) 
  IDDRE1 #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .IS_CB_INVERTED(1'b1),
    .IS_C_INVERTED(1'b0)) 
    \adcA_ddr_IN[5].adcAB_iddre1 
       (.C(ADC_A_CLK),
        .CB(ADC_A_CLK),
        .D(adcAB_ddr_5),
        .Q1(adcAB_d_q1_5),
        .Q2(adcAB_d_q2_5),
        .R(\adcAA_d_reg[13]_0 ));
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  (* box_type = "PRIMITIVE" *) 
  IBUFDS #(
    .DIFF_TERM("FALSE"),
    .IOSTANDARD("DEFAULT")) 
    \adcA_ddr_IN[6].adcAB_ibufds 
       (.I(ADC_AB_P[6]),
        .IB(ADC_AB_N[6]),
        .O(adcAB_ddr_6));
  (* box_type = "PRIMITIVE" *) 
  IDDRE1 #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .IS_CB_INVERTED(1'b1),
    .IS_C_INVERTED(1'b0)) 
    \adcA_ddr_IN[6].adcAB_iddre1 
       (.C(ADC_A_CLK),
        .CB(ADC_A_CLK),
        .D(adcAB_ddr_6),
        .Q1(adcAB_d_q1_6),
        .Q2(adcAB_d_q2_6),
        .R(\adcAA_d_reg[13]_0 ));
endmodule

(* ORIG_REF_NAME = "adc_ddr_top" *) 
module design_1_io_dual_adc_ddr_top_0_0_adc_ddr_top_0
   (ADC_B_CLK,
    rstn_0,
    ADC_BA,
    ADC_BB,
    ADC_B_CLK_P,
    ADC_B_CLK_N,
    ADC_BA_P,
    ADC_BA_N,
    ADC_BB_P,
    ADC_BB_N,
    rstn);
  output ADC_B_CLK;
  output rstn_0;
  output [13:0]ADC_BA;
  output [13:0]ADC_BB;
  input ADC_B_CLK_P;
  input ADC_B_CLK_N;
  input [6:0]ADC_BA_P;
  input [6:0]ADC_BA_N;
  input [6:0]ADC_BB_P;
  input [6:0]ADC_BB_N;
  input rstn;

  wire [13:0]ADC_BA;
  wire [6:0]ADC_BA_N;
  wire [6:0]ADC_BA_P;
  wire [13:0]ADC_BB;
  wire [6:0]ADC_BB_N;
  wire [6:0]ADC_BB_P;
  wire ADC_B_CLK;
  wire ADC_B_CLK_N;
  wire ADC_B_CLK_P;
  wire adcAA_ddr_0;
  wire adcAA_ddr_1;
  wire adcAA_ddr_2;
  wire adcAA_ddr_3;
  wire adcAA_ddr_4;
  wire adcAA_ddr_5;
  wire adcAA_ddr_6;
  wire adcAB_d_q1_0;
  wire adcAB_d_q1_1;
  wire adcAB_d_q1_2;
  wire adcAB_d_q1_3;
  wire adcAB_d_q1_4;
  wire adcAB_d_q1_5;
  wire adcAB_d_q1_6;
  wire adcAB_d_q2_0;
  wire adcAB_d_q2_1;
  wire adcAB_d_q2_2;
  wire adcAB_d_q2_3;
  wire adcAB_d_q2_4;
  wire adcAB_d_q2_5;
  wire adcAB_d_q2_6;
  wire adcAB_ddr_0;
  wire adcAB_ddr_1;
  wire adcAB_ddr_2;
  wire adcAB_ddr_3;
  wire adcAB_ddr_4;
  wire adcAB_ddr_5;
  wire adcAB_ddr_6;
  wire adcA_clk_buff;
  wire [13:0]p_7_out;
  wire rstn;
  wire rstn_0;

  LUT1 #(
    .INIT(2'h1)) 
    \adcAA_d[13]_i_1 
       (.I0(rstn),
        .O(rstn_0));
  FDCE \adcAA_d_reg[0] 
       (.C(ADC_B_CLK),
        .CE(1'b1),
        .CLR(rstn_0),
        .D(p_7_out[0]),
        .Q(ADC_BA[0]));
  FDCE \adcAA_d_reg[10] 
       (.C(ADC_B_CLK),
        .CE(1'b1),
        .CLR(rstn_0),
        .D(p_7_out[10]),
        .Q(ADC_BA[10]));
  FDCE \adcAA_d_reg[11] 
       (.C(ADC_B_CLK),
        .CE(1'b1),
        .CLR(rstn_0),
        .D(p_7_out[11]),
        .Q(ADC_BA[11]));
  FDCE \adcAA_d_reg[12] 
       (.C(ADC_B_CLK),
        .CE(1'b1),
        .CLR(rstn_0),
        .D(p_7_out[12]),
        .Q(ADC_BA[12]));
  FDCE \adcAA_d_reg[13] 
       (.C(ADC_B_CLK),
        .CE(1'b1),
        .CLR(rstn_0),
        .D(p_7_out[13]),
        .Q(ADC_BA[13]));
  FDCE \adcAA_d_reg[1] 
       (.C(ADC_B_CLK),
        .CE(1'b1),
        .CLR(rstn_0),
        .D(p_7_out[1]),
        .Q(ADC_BA[1]));
  FDCE \adcAA_d_reg[2] 
       (.C(ADC_B_CLK),
        .CE(1'b1),
        .CLR(rstn_0),
        .D(p_7_out[2]),
        .Q(ADC_BA[2]));
  FDCE \adcAA_d_reg[3] 
       (.C(ADC_B_CLK),
        .CE(1'b1),
        .CLR(rstn_0),
        .D(p_7_out[3]),
        .Q(ADC_BA[3]));
  FDCE \adcAA_d_reg[4] 
       (.C(ADC_B_CLK),
        .CE(1'b1),
        .CLR(rstn_0),
        .D(p_7_out[4]),
        .Q(ADC_BA[4]));
  FDCE \adcAA_d_reg[5] 
       (.C(ADC_B_CLK),
        .CE(1'b1),
        .CLR(rstn_0),
        .D(p_7_out[5]),
        .Q(ADC_BA[5]));
  FDCE \adcAA_d_reg[6] 
       (.C(ADC_B_CLK),
        .CE(1'b1),
        .CLR(rstn_0),
        .D(p_7_out[6]),
        .Q(ADC_BA[6]));
  FDCE \adcAA_d_reg[7] 
       (.C(ADC_B_CLK),
        .CE(1'b1),
        .CLR(rstn_0),
        .D(p_7_out[7]),
        .Q(ADC_BA[7]));
  FDCE \adcAA_d_reg[8] 
       (.C(ADC_B_CLK),
        .CE(1'b1),
        .CLR(rstn_0),
        .D(p_7_out[8]),
        .Q(ADC_BA[8]));
  FDCE \adcAA_d_reg[9] 
       (.C(ADC_B_CLK),
        .CE(1'b1),
        .CLR(rstn_0),
        .D(p_7_out[9]),
        .Q(ADC_BA[9]));
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  (* box_type = "PRIMITIVE" *) 
  IBUFDS #(
    .DIFF_TERM("FALSE"),
    .IOSTANDARD("DEFAULT")) 
    \adcAA_ddr_IN[0].adcAA_ibufds 
       (.I(ADC_BA_P[0]),
        .IB(ADC_BA_N[0]),
        .O(adcAA_ddr_0));
  (* box_type = "PRIMITIVE" *) 
  IDDRE1 #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .IS_CB_INVERTED(1'b1),
    .IS_C_INVERTED(1'b0)) 
    \adcAA_ddr_IN[0].adcAA_iddre1 
       (.C(ADC_B_CLK),
        .CB(ADC_B_CLK),
        .D(adcAA_ddr_0),
        .Q1(p_7_out[0]),
        .Q2(p_7_out[1]),
        .R(rstn_0));
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  (* box_type = "PRIMITIVE" *) 
  IBUFDS #(
    .DIFF_TERM("FALSE"),
    .IOSTANDARD("DEFAULT")) 
    \adcAA_ddr_IN[1].adcAA_ibufds 
       (.I(ADC_BA_P[1]),
        .IB(ADC_BA_N[1]),
        .O(adcAA_ddr_1));
  (* box_type = "PRIMITIVE" *) 
  IDDRE1 #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .IS_CB_INVERTED(1'b1),
    .IS_C_INVERTED(1'b0)) 
    \adcAA_ddr_IN[1].adcAA_iddre1 
       (.C(ADC_B_CLK),
        .CB(ADC_B_CLK),
        .D(adcAA_ddr_1),
        .Q1(p_7_out[2]),
        .Q2(p_7_out[3]),
        .R(rstn_0));
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  (* box_type = "PRIMITIVE" *) 
  IBUFDS #(
    .DIFF_TERM("FALSE"),
    .IOSTANDARD("DEFAULT")) 
    \adcAA_ddr_IN[2].adcAA_ibufds 
       (.I(ADC_BA_P[2]),
        .IB(ADC_BA_N[2]),
        .O(adcAA_ddr_2));
  (* box_type = "PRIMITIVE" *) 
  IDDRE1 #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .IS_CB_INVERTED(1'b1),
    .IS_C_INVERTED(1'b0)) 
    \adcAA_ddr_IN[2].adcAA_iddre1 
       (.C(ADC_B_CLK),
        .CB(ADC_B_CLK),
        .D(adcAA_ddr_2),
        .Q1(p_7_out[4]),
        .Q2(p_7_out[5]),
        .R(rstn_0));
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  (* box_type = "PRIMITIVE" *) 
  IBUFDS #(
    .DIFF_TERM("FALSE"),
    .IOSTANDARD("DEFAULT")) 
    \adcAA_ddr_IN[3].adcAA_ibufds 
       (.I(ADC_BA_P[3]),
        .IB(ADC_BA_N[3]),
        .O(adcAA_ddr_3));
  (* box_type = "PRIMITIVE" *) 
  IDDRE1 #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .IS_CB_INVERTED(1'b1),
    .IS_C_INVERTED(1'b0)) 
    \adcAA_ddr_IN[3].adcAA_iddre1 
       (.C(ADC_B_CLK),
        .CB(ADC_B_CLK),
        .D(adcAA_ddr_3),
        .Q1(p_7_out[6]),
        .Q2(p_7_out[7]),
        .R(rstn_0));
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  (* box_type = "PRIMITIVE" *) 
  IBUFDS #(
    .DIFF_TERM("FALSE"),
    .IOSTANDARD("DEFAULT")) 
    \adcAA_ddr_IN[4].adcAA_ibufds 
       (.I(ADC_BA_P[4]),
        .IB(ADC_BA_N[4]),
        .O(adcAA_ddr_4));
  (* box_type = "PRIMITIVE" *) 
  IDDRE1 #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .IS_CB_INVERTED(1'b1),
    .IS_C_INVERTED(1'b0)) 
    \adcAA_ddr_IN[4].adcAA_iddre1 
       (.C(ADC_B_CLK),
        .CB(ADC_B_CLK),
        .D(adcAA_ddr_4),
        .Q1(p_7_out[8]),
        .Q2(p_7_out[9]),
        .R(rstn_0));
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  (* box_type = "PRIMITIVE" *) 
  IBUFDS #(
    .DIFF_TERM("FALSE"),
    .IOSTANDARD("DEFAULT")) 
    \adcAA_ddr_IN[5].adcAA_ibufds 
       (.I(ADC_BA_P[5]),
        .IB(ADC_BA_N[5]),
        .O(adcAA_ddr_5));
  (* box_type = "PRIMITIVE" *) 
  IDDRE1 #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .IS_CB_INVERTED(1'b1),
    .IS_C_INVERTED(1'b0)) 
    \adcAA_ddr_IN[5].adcAA_iddre1 
       (.C(ADC_B_CLK),
        .CB(ADC_B_CLK),
        .D(adcAA_ddr_5),
        .Q1(p_7_out[10]),
        .Q2(p_7_out[11]),
        .R(rstn_0));
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  (* box_type = "PRIMITIVE" *) 
  IBUFDS #(
    .DIFF_TERM("FALSE"),
    .IOSTANDARD("DEFAULT")) 
    \adcAA_ddr_IN[6].adcAA_ibufds 
       (.I(ADC_BA_P[6]),
        .IB(ADC_BA_N[6]),
        .O(adcAA_ddr_6));
  (* box_type = "PRIMITIVE" *) 
  IDDRE1 #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .IS_CB_INVERTED(1'b1),
    .IS_C_INVERTED(1'b0)) 
    \adcAA_ddr_IN[6].adcAA_iddre1 
       (.C(ADC_B_CLK),
        .CB(ADC_B_CLK),
        .D(adcAA_ddr_6),
        .Q1(p_7_out[12]),
        .Q2(p_7_out[13]),
        .R(rstn_0));
  FDCE \adcAB_d_reg[0] 
       (.C(ADC_B_CLK),
        .CE(1'b1),
        .CLR(rstn_0),
        .D(adcAB_d_q1_0),
        .Q(ADC_BB[0]));
  FDCE \adcAB_d_reg[10] 
       (.C(ADC_B_CLK),
        .CE(1'b1),
        .CLR(rstn_0),
        .D(adcAB_d_q1_5),
        .Q(ADC_BB[10]));
  FDCE \adcAB_d_reg[11] 
       (.C(ADC_B_CLK),
        .CE(1'b1),
        .CLR(rstn_0),
        .D(adcAB_d_q2_5),
        .Q(ADC_BB[11]));
  FDCE \adcAB_d_reg[12] 
       (.C(ADC_B_CLK),
        .CE(1'b1),
        .CLR(rstn_0),
        .D(adcAB_d_q1_6),
        .Q(ADC_BB[12]));
  FDCE \adcAB_d_reg[13] 
       (.C(ADC_B_CLK),
        .CE(1'b1),
        .CLR(rstn_0),
        .D(adcAB_d_q2_6),
        .Q(ADC_BB[13]));
  FDCE \adcAB_d_reg[1] 
       (.C(ADC_B_CLK),
        .CE(1'b1),
        .CLR(rstn_0),
        .D(adcAB_d_q2_0),
        .Q(ADC_BB[1]));
  FDCE \adcAB_d_reg[2] 
       (.C(ADC_B_CLK),
        .CE(1'b1),
        .CLR(rstn_0),
        .D(adcAB_d_q1_1),
        .Q(ADC_BB[2]));
  FDCE \adcAB_d_reg[3] 
       (.C(ADC_B_CLK),
        .CE(1'b1),
        .CLR(rstn_0),
        .D(adcAB_d_q2_1),
        .Q(ADC_BB[3]));
  FDCE \adcAB_d_reg[4] 
       (.C(ADC_B_CLK),
        .CE(1'b1),
        .CLR(rstn_0),
        .D(adcAB_d_q1_2),
        .Q(ADC_BB[4]));
  FDCE \adcAB_d_reg[5] 
       (.C(ADC_B_CLK),
        .CE(1'b1),
        .CLR(rstn_0),
        .D(adcAB_d_q2_2),
        .Q(ADC_BB[5]));
  FDCE \adcAB_d_reg[6] 
       (.C(ADC_B_CLK),
        .CE(1'b1),
        .CLR(rstn_0),
        .D(adcAB_d_q1_3),
        .Q(ADC_BB[6]));
  FDCE \adcAB_d_reg[7] 
       (.C(ADC_B_CLK),
        .CE(1'b1),
        .CLR(rstn_0),
        .D(adcAB_d_q2_3),
        .Q(ADC_BB[7]));
  FDCE \adcAB_d_reg[8] 
       (.C(ADC_B_CLK),
        .CE(1'b1),
        .CLR(rstn_0),
        .D(adcAB_d_q1_4),
        .Q(ADC_BB[8]));
  FDCE \adcAB_d_reg[9] 
       (.C(ADC_B_CLK),
        .CE(1'b1),
        .CLR(rstn_0),
        .D(adcAB_d_q2_4),
        .Q(ADC_BB[9]));
  (* XILINX_LEGACY_PRIM = "BUFG" *) 
  (* XILINX_TRANSFORM_PINMAP = "VCC:CE" *) 
  (* box_type = "PRIMITIVE" *) 
  BUFGCE #(
    .CE_TYPE("ASYNC"),
    .SIM_DEVICE("ULTRASCALE_PLUS")) 
    adcA_clk_bufg
       (.CE(1'b1),
        .I(adcA_clk_buff),
        .O(ADC_B_CLK));
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  (* box_type = "PRIMITIVE" *) 
  IBUFDS #(
    .DIFF_TERM("FALSE"),
    .IOSTANDARD("DEFAULT")) 
    adcA_clk_ibufds
       (.I(ADC_B_CLK_P),
        .IB(ADC_B_CLK_N),
        .O(adcA_clk_buff));
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  (* box_type = "PRIMITIVE" *) 
  IBUFDS #(
    .DIFF_TERM("FALSE"),
    .IOSTANDARD("DEFAULT")) 
    \adcA_ddr_IN[0].adcAB_ibufds 
       (.I(ADC_BB_P[0]),
        .IB(ADC_BB_N[0]),
        .O(adcAB_ddr_0));
  (* box_type = "PRIMITIVE" *) 
  IDDRE1 #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .IS_CB_INVERTED(1'b1),
    .IS_C_INVERTED(1'b0)) 
    \adcA_ddr_IN[0].adcAB_iddre1 
       (.C(ADC_B_CLK),
        .CB(ADC_B_CLK),
        .D(adcAB_ddr_0),
        .Q1(adcAB_d_q1_0),
        .Q2(adcAB_d_q2_0),
        .R(rstn_0));
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  (* box_type = "PRIMITIVE" *) 
  IBUFDS #(
    .DIFF_TERM("FALSE"),
    .IOSTANDARD("DEFAULT")) 
    \adcA_ddr_IN[1].adcAB_ibufds 
       (.I(ADC_BB_P[1]),
        .IB(ADC_BB_N[1]),
        .O(adcAB_ddr_1));
  (* box_type = "PRIMITIVE" *) 
  IDDRE1 #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .IS_CB_INVERTED(1'b1),
    .IS_C_INVERTED(1'b0)) 
    \adcA_ddr_IN[1].adcAB_iddre1 
       (.C(ADC_B_CLK),
        .CB(ADC_B_CLK),
        .D(adcAB_ddr_1),
        .Q1(adcAB_d_q1_1),
        .Q2(adcAB_d_q2_1),
        .R(rstn_0));
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  (* box_type = "PRIMITIVE" *) 
  IBUFDS #(
    .DIFF_TERM("FALSE"),
    .IOSTANDARD("DEFAULT")) 
    \adcA_ddr_IN[2].adcAB_ibufds 
       (.I(ADC_BB_P[2]),
        .IB(ADC_BB_N[2]),
        .O(adcAB_ddr_2));
  (* box_type = "PRIMITIVE" *) 
  IDDRE1 #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .IS_CB_INVERTED(1'b1),
    .IS_C_INVERTED(1'b0)) 
    \adcA_ddr_IN[2].adcAB_iddre1 
       (.C(ADC_B_CLK),
        .CB(ADC_B_CLK),
        .D(adcAB_ddr_2),
        .Q1(adcAB_d_q1_2),
        .Q2(adcAB_d_q2_2),
        .R(rstn_0));
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  (* box_type = "PRIMITIVE" *) 
  IBUFDS #(
    .DIFF_TERM("FALSE"),
    .IOSTANDARD("DEFAULT")) 
    \adcA_ddr_IN[3].adcAB_ibufds 
       (.I(ADC_BB_P[3]),
        .IB(ADC_BB_N[3]),
        .O(adcAB_ddr_3));
  (* box_type = "PRIMITIVE" *) 
  IDDRE1 #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .IS_CB_INVERTED(1'b1),
    .IS_C_INVERTED(1'b0)) 
    \adcA_ddr_IN[3].adcAB_iddre1 
       (.C(ADC_B_CLK),
        .CB(ADC_B_CLK),
        .D(adcAB_ddr_3),
        .Q1(adcAB_d_q1_3),
        .Q2(adcAB_d_q2_3),
        .R(rstn_0));
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  (* box_type = "PRIMITIVE" *) 
  IBUFDS #(
    .DIFF_TERM("FALSE"),
    .IOSTANDARD("DEFAULT")) 
    \adcA_ddr_IN[4].adcAB_ibufds 
       (.I(ADC_BB_P[4]),
        .IB(ADC_BB_N[4]),
        .O(adcAB_ddr_4));
  (* box_type = "PRIMITIVE" *) 
  IDDRE1 #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .IS_CB_INVERTED(1'b1),
    .IS_C_INVERTED(1'b0)) 
    \adcA_ddr_IN[4].adcAB_iddre1 
       (.C(ADC_B_CLK),
        .CB(ADC_B_CLK),
        .D(adcAB_ddr_4),
        .Q1(adcAB_d_q1_4),
        .Q2(adcAB_d_q2_4),
        .R(rstn_0));
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  (* box_type = "PRIMITIVE" *) 
  IBUFDS #(
    .DIFF_TERM("FALSE"),
    .IOSTANDARD("DEFAULT")) 
    \adcA_ddr_IN[5].adcAB_ibufds 
       (.I(ADC_BB_P[5]),
        .IB(ADC_BB_N[5]),
        .O(adcAB_ddr_5));
  (* box_type = "PRIMITIVE" *) 
  IDDRE1 #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .IS_CB_INVERTED(1'b1),
    .IS_C_INVERTED(1'b0)) 
    \adcA_ddr_IN[5].adcAB_iddre1 
       (.C(ADC_B_CLK),
        .CB(ADC_B_CLK),
        .D(adcAB_ddr_5),
        .Q1(adcAB_d_q1_5),
        .Q2(adcAB_d_q2_5),
        .R(rstn_0));
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  (* box_type = "PRIMITIVE" *) 
  IBUFDS #(
    .DIFF_TERM("FALSE"),
    .IOSTANDARD("DEFAULT")) 
    \adcA_ddr_IN[6].adcAB_ibufds 
       (.I(ADC_BB_P[6]),
        .IB(ADC_BB_N[6]),
        .O(adcAB_ddr_6));
  (* box_type = "PRIMITIVE" *) 
  IDDRE1 #(
    .DDR_CLK_EDGE("OPPOSITE_EDGE"),
    .IS_CB_INVERTED(1'b1),
    .IS_C_INVERTED(1'b0)) 
    \adcA_ddr_IN[6].adcAB_iddre1 
       (.C(ADC_B_CLK),
        .CB(ADC_B_CLK),
        .D(adcAB_ddr_6),
        .Q1(adcAB_d_q1_6),
        .Q2(adcAB_d_q2_6),
        .R(rstn_0));
endmodule

(* ORIG_REF_NAME = "io_dual_adc_ddr_top" *) 
module design_1_io_dual_adc_ddr_top_0_0_io_dual_adc_ddr_top
   (ADC_A_CLK,
    ADC_B_CLK,
    ADC_AA,
    ADC_AB,
    ADC_BA,
    ADC_BB,
    ADC_A_CLK_P,
    ADC_A_CLK_N,
    ADC_AA_P,
    ADC_AA_N,
    ADC_AB_P,
    ADC_AB_N,
    ADC_B_CLK_P,
    ADC_B_CLK_N,
    ADC_BA_P,
    ADC_BA_N,
    ADC_BB_P,
    ADC_BB_N,
    rstn);
  output ADC_A_CLK;
  output ADC_B_CLK;
  output [13:0]ADC_AA;
  output [13:0]ADC_AB;
  output [13:0]ADC_BA;
  output [13:0]ADC_BB;
  input ADC_A_CLK_P;
  input ADC_A_CLK_N;
  input [6:0]ADC_AA_P;
  input [6:0]ADC_AA_N;
  input [6:0]ADC_AB_P;
  input [6:0]ADC_AB_N;
  input ADC_B_CLK_P;
  input ADC_B_CLK_N;
  input [6:0]ADC_BA_P;
  input [6:0]ADC_BA_N;
  input [6:0]ADC_BB_P;
  input [6:0]ADC_BB_N;
  input rstn;

  wire [13:0]ADC_AA;
  wire [6:0]ADC_AA_N;
  wire [6:0]ADC_AA_P;
  wire [13:0]ADC_AB;
  wire [6:0]ADC_AB_N;
  wire [6:0]ADC_AB_P;
  wire ADC_A_CLK;
  wire ADC_A_CLK_N;
  wire ADC_A_CLK_P;
  wire [13:0]ADC_BA;
  wire [6:0]ADC_BA_N;
  wire [6:0]ADC_BA_P;
  wire [13:0]ADC_BB;
  wire [6:0]ADC_BB_N;
  wire [6:0]ADC_BB_P;
  wire ADC_B_CLK;
  wire ADC_B_CLK_N;
  wire ADC_B_CLK_P;
  wire adc_binst_n_1;
  wire rstn;

  design_1_io_dual_adc_ddr_top_0_0_adc_ddr_top adc_a_inst
       (.ADC_AA(ADC_AA),
        .ADC_AA_N(ADC_AA_N),
        .ADC_AA_P(ADC_AA_P),
        .ADC_AB(ADC_AB),
        .ADC_AB_N(ADC_AB_N),
        .ADC_AB_P(ADC_AB_P),
        .ADC_A_CLK(ADC_A_CLK),
        .ADC_A_CLK_N(ADC_A_CLK_N),
        .ADC_A_CLK_P(ADC_A_CLK_P),
        .\adcAA_d_reg[13]_0 (adc_binst_n_1));
  design_1_io_dual_adc_ddr_top_0_0_adc_ddr_top_0 adc_binst
       (.ADC_BA(ADC_BA),
        .ADC_BA_N(ADC_BA_N),
        .ADC_BA_P(ADC_BA_P),
        .ADC_BB(ADC_BB),
        .ADC_BB_N(ADC_BB_N),
        .ADC_BB_P(ADC_BB_P),
        .ADC_B_CLK(ADC_B_CLK),
        .ADC_B_CLK_N(ADC_B_CLK_N),
        .ADC_B_CLK_P(ADC_B_CLK_P),
        .rstn(rstn),
        .rstn_0(adc_binst_n_1));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
