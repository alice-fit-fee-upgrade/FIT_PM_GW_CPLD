// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Tue Aug 26 14:56:37 2025
// Host        : KP-LABS98 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/rsmalec/_FPGA/_PW/FIT_PM_GW_CPLD/vivado/fit_pm_dual_range_afe/fit_pm_dual_range_afe.gen/sources_1/bd/design_1/ip/design_1_io_dual_adc_ddr_top_0_0/design_1_io_dual_adc_ddr_top_0_0_stub.v
// Design      : design_1_io_dual_adc_ddr_top_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcau10p-ffvb676-2-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "design_1_io_dual_adc_ddr_top_0_0,io_dual_adc_ddr_top,{}" *) (* CORE_GENERATION_INFO = "design_1_io_dual_adc_ddr_top_0_0,io_dual_adc_ddr_top,{x_ipProduct=Vivado 2024.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=io_dual_adc_ddr_top,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=VHDL,ADC_DATA_LINES=7,ADC_RESOLUTION_BITS=14}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* IP_DEFINITION_SOURCE = "module_ref" *) (* X_CORE_INFO = "io_dual_adc_ddr_top,Vivado 2024.2" *) 
module design_1_io_dual_adc_ddr_top_0_0(rstn, ADC_A_CLK_P, ADC_A_CLK_N, ADC_AA_P, 
  ADC_AA_N, ADC_AB_P, ADC_AB_N, ADC_A_CLK, ADC_AA, ADC_AB, ADC_B_CLK_P, ADC_B_CLK_N, ADC_BA_P, 
  ADC_BA_N, ADC_BB_P, ADC_BB_N, ADC_B_CLK, ADC_BA, ADC_BB)
/* synthesis syn_black_box black_box_pad_pin="rstn,ADC_A_CLK_P,ADC_A_CLK_N,ADC_AA_P[6:0],ADC_AA_N[6:0],ADC_AB_P[6:0],ADC_AB_N[6:0],ADC_AA[13:0],ADC_AB[13:0],ADC_B_CLK_P,ADC_B_CLK_N,ADC_BA_P[6:0],ADC_BA_N[6:0],ADC_BB_P[6:0],ADC_BB_N[6:0],ADC_BA[13:0],ADC_BB[13:0]" */
/* synthesis syn_force_seq_prim="ADC_A_CLK" */
/* synthesis syn_force_seq_prim="ADC_B_CLK" */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rstn RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rstn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rstn;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ADC_A_CLK_P CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ADC_A_CLK_P, FREQ_HZ 240000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_ADC_CLK_P_0, INSERT_VIP 0" *) input ADC_A_CLK_P;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ADC_A_CLK_N CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ADC_A_CLK_N, FREQ_HZ 240000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_ADC_CLK_N_0, INSERT_VIP 0" *) input ADC_A_CLK_N;
  input [6:0]ADC_AA_P;
  input [6:0]ADC_AA_N;
  input [6:0]ADC_AB_P;
  input [6:0]ADC_AB_N;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ADC_A_CLK CLK" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ADC_A_CLK, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_io_dual_adc_ddr_top_0_0_ADC_A_CLK, INSERT_VIP 0" *) output ADC_A_CLK /* synthesis syn_isclock = 1 */;
  output [13:0]ADC_AA;
  output [13:0]ADC_AB;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ADC_B_CLK_P CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ADC_B_CLK_P, FREQ_HZ 240000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_ADC_CLK_P_1, INSERT_VIP 0" *) input ADC_B_CLK_P;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ADC_B_CLK_N CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ADC_B_CLK_N, FREQ_HZ 240000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_ADC_CLK_N_1, INSERT_VIP 0" *) input ADC_B_CLK_N;
  input [6:0]ADC_BA_P;
  input [6:0]ADC_BA_N;
  input [6:0]ADC_BB_P;
  input [6:0]ADC_BB_N;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 ADC_B_CLK CLK" *) (* X_INTERFACE_MODE = "master" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME ADC_B_CLK, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_io_dual_adc_ddr_top_0_0_ADC_B_CLK, INSERT_VIP 0" *) output ADC_B_CLK /* synthesis syn_isclock = 1 */;
  output [13:0]ADC_BA;
  output [13:0]ADC_BB;
endmodule
