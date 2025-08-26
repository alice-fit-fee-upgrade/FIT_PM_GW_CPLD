// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Tue Aug 26 14:38:10 2025
// Host        : KP-LABS98 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/rsmalec/_FPGA/_PW/FIT_PM_GW_CPLD/vivado/fit_pm_dual_range_afe/fit_pm_dual_range_afe.gen/sources_1/bd/design_1/ip/design_1_io_int_g_drv_0_0/design_1_io_int_g_drv_0_0_stub.v
// Design      : design_1_io_int_g_drv_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcau10p-ffvb676-2-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "design_1_io_int_g_drv_0_0,io_int_g_drv,{}" *) (* CORE_GENERATION_INFO = "design_1_io_int_g_drv_0_0,io_int_g_drv,{x_ipProduct=Vivado 2024.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=io_int_g_drv,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=VHDL}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* IP_DEFINITION_SOURCE = "module_ref" *) (* X_CORE_INFO = "io_int_g_drv,Vivado 2024.2" *) 
module design_1_io_int_g_drv_0_0(clk20, clk20n, INT_A_G_DRV_P, INT_A_G_DRV_N, 
  INT_B_G_DRV_P, INT_B_G_DRV_N)
/* synthesis syn_black_box black_box_pad_pin="clk20,clk20n,INT_A_G_DRV_P,INT_A_G_DRV_N,INT_B_G_DRV_P,INT_B_G_DRV_N" */;
  input clk20;
  input clk20n;
  output INT_A_G_DRV_P;
  output INT_A_G_DRV_N;
  output INT_B_G_DRV_P;
  output INT_B_G_DRV_N;
endmodule
