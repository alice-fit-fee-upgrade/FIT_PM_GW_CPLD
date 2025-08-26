// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Tue Aug 26 14:56:31 2025
// Host        : KP-LABS98 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/rsmalec/_FPGA/_PW/FIT_PM_GW_CPLD/vivado/fit_pm_dual_range_afe/fit_pm_dual_range_afe.gen/sources_1/bd/design_1/ip/design_1_fit_pm_afe_0_0/design_1_fit_pm_afe_0_0_stub.v
// Design      : design_1_fit_pm_afe_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcau10p-ffvb676-2-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "design_1_fit_pm_afe_0_0,fit_pm_afe,{}" *) (* CORE_GENERATION_INFO = "design_1_fit_pm_afe_0_0,fit_pm_afe,{x_ipProduct=Vivado 2024.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=fit_pm_afe,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=VHDL,ADC_DATA_LINES=7,ADC_RESOLUTION_BITS=14,DATA_OUT_W=16}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* IP_DEFINITION_SOURCE = "module_ref" *) (* X_CORE_INFO = "fit_pm_afe,Vivado 2024.2" *) 
module design_1_fit_pm_afe_0_0(clk, rstn, clk_40, clk_20, clk_20n, enai, strb, evnt, 
  evout, clk_inA, d_inAA, d_inAB, clk_inB, d_inBA, d_inBB, d_val, d_out)
/* synthesis syn_black_box black_box_pad_pin="clk,rstn,clk_40,clk_20,clk_20n,enai,strb,evnt,evout,clk_inA,d_inAA[13:0],d_inAB[13:0],clk_inB,d_inBA[13:0],d_inBB[13:0],d_val,d_out[15:0]" */;
  (* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_RESET rstn, FREQ_HZ 80000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_clk_wiz_0_0_processor_clk, INSERT_VIP 0" *) input clk;
  (* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rstn RST" *) (* X_INTERFACE_MODE = "slave" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rstn, POLARITY ACTIVE_LOW, INSERT_VIP 0" *) input rstn;
  input clk_40;
  input clk_20;
  input clk_20n;
  input enai;
  input strb;
  input evnt;
  output evout;
  input clk_inA;
  input [13:0]d_inAA;
  input [13:0]d_inAB;
  input clk_inB;
  input [13:0]d_inBA;
  input [13:0]d_inBB;
  output d_val;
  output [15:0]d_out;
endmodule
