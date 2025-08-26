// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Tue Aug 26 14:56:39 2025
// Host        : KP-LABS98 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/rsmalec/_FPGA/_PW/FIT_PM_GW_CPLD/vivado/fit_pm_dual_range_afe/fit_pm_dual_range_afe.gen/sources_1/bd/design_1/ip/design_1_io_event_calibration_0_0/design_1_io_event_calibration_0_0_stub.v
// Design      : design_1_io_event_calibration_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcau10p-ffvb676-2-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CHECK_LICENSE_TYPE = "design_1_io_event_calibration_0_0,io_event_calibration,{}" *) (* CORE_GENERATION_INFO = "design_1_io_event_calibration_0_0,io_event_calibration,{x_ipProduct=Vivado 2024.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=io_event_calibration,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=VHDL}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) 
(* IP_DEFINITION_SOURCE = "module_ref" *) (* X_CORE_INFO = "io_event_calibration,Vivado 2024.2" *) 
module design_1_io_event_calibration_0_0(Event1_P, Event1_N, Event2_P, Event2_N, Event3_P, 
  Event3_N, Event4_P, Event4_N, Event1, Event2, Event3, Event4, Calibration_P, Calibration_N, 
  Calibration)
/* synthesis syn_black_box black_box_pad_pin="Event1_P,Event1_N,Event2_P,Event2_N,Event3_P,Event3_N,Event4_P,Event4_N,Event1,Event2,Event3,Event4,Calibration_P,Calibration_N,Calibration" */;
  input Event1_P;
  input Event1_N;
  input Event2_P;
  input Event2_N;
  input Event3_P;
  input Event3_N;
  input Event4_P;
  input Event4_N;
  output Event1;
  output Event2;
  output Event3;
  output Event4;
  output Calibration_P;
  output Calibration_N;
  input Calibration;
endmodule
