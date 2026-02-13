// (c) Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// (c) Copyright 2022-2026 Advanced Micro Devices, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of AMD and is protected under U.S. and international copyright
// and other intellectual property laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// AMD, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND AMD HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) AMD shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or AMD had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// AMD products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of AMD products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: xilinx.com:module_ref:io_dual_adc_ddr_top:1.0
// IP Revision: 1

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "module_ref" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module design_1_io_dual_adc_ddr_top_0_0 (
  rstn,
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
  ADC_BB
);

(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rstn RST" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rstn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *)
input wire rstn;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ADC_A_CLK_P CLK" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ADC_A_CLK_P, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_ADC_A_CLK_P_0, INSERT_VIP 0" *)
input wire ADC_A_CLK_P;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ADC_A_CLK_N CLK" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ADC_A_CLK_N, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_ADC_A_CLK_N_0, INSERT_VIP 0" *)
input wire ADC_A_CLK_N;
input wire [6 : 0] ADC_AA_P;
input wire [6 : 0] ADC_AA_N;
input wire [6 : 0] ADC_AB_P;
input wire [6 : 0] ADC_AB_N;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ADC_A_CLK CLK" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ADC_A_CLK, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_io_dual_adc_ddr_top_0_0_ADC_A_CLK, INSERT_VIP 0" *)
output wire ADC_A_CLK;
output wire [13 : 0] ADC_AA;
output wire [13 : 0] ADC_AB;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ADC_B_CLK_P CLK" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ADC_B_CLK_P, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_ADC_B_CLK_P_0, INSERT_VIP 0" *)
input wire ADC_B_CLK_P;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ADC_B_CLK_N CLK" *)
(* X_INTERFACE_MODE = "slave" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ADC_B_CLK_N, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_ADC_B_CLK_N_0, INSERT_VIP 0" *)
input wire ADC_B_CLK_N;
input wire [6 : 0] ADC_BA_P;
input wire [6 : 0] ADC_BA_N;
input wire [6 : 0] ADC_BB_P;
input wire [6 : 0] ADC_BB_N;
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ADC_B_CLK CLK" *)
(* X_INTERFACE_MODE = "master" *)
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ADC_B_CLK, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_io_dual_adc_ddr_top_0_0_ADC_B_CLK, INSERT_VIP 0" *)
output wire ADC_B_CLK;
output wire [13 : 0] ADC_BA;
output wire [13 : 0] ADC_BB;

  io_dual_adc_ddr_top #(
    .ADC_DATA_LINES(7),
    .ADC_RESOLUTION_BITS(14)
  ) inst (
    .rstn(rstn),
    .ADC_A_CLK_P(ADC_A_CLK_P),
    .ADC_A_CLK_N(ADC_A_CLK_N),
    .ADC_AA_P(ADC_AA_P),
    .ADC_AA_N(ADC_AA_N),
    .ADC_AB_P(ADC_AB_P),
    .ADC_AB_N(ADC_AB_N),
    .ADC_A_CLK(ADC_A_CLK),
    .ADC_AA(ADC_AA),
    .ADC_AB(ADC_AB),
    .ADC_B_CLK_P(ADC_B_CLK_P),
    .ADC_B_CLK_N(ADC_B_CLK_N),
    .ADC_BA_P(ADC_BA_P),
    .ADC_BA_N(ADC_BA_N),
    .ADC_BB_P(ADC_BB_P),
    .ADC_BB_N(ADC_BB_N),
    .ADC_B_CLK(ADC_B_CLK),
    .ADC_BA(ADC_BA),
    .ADC_BB(ADC_BB)
  );
endmodule
