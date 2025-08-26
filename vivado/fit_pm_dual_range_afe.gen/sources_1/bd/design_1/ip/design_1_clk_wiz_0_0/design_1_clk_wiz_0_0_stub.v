// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Tue Aug 26 14:38:18 2025
// Host        : KP-LABS98 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub
//               c:/Users/rsmalec/_FPGA/_PW/FIT_PM_GW_CPLD/vivado/fit_pm_dual_range_afe/fit_pm_dual_range_afe.gen/sources_1/bd/design_1/ip/design_1_clk_wiz_0_0/design_1_clk_wiz_0_0_stub.v
// Design      : design_1_clk_wiz_0_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xcau10p-ffvb676-2-i
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* CORE_GENERATION_INFO = "design_1_clk_wiz_0_0,clk_wiz_v6_0_15_0_0,{component_name=design_1_clk_wiz_0_0,use_phase_alignment=false,use_min_o_jitter=false,use_max_i_jitter=false,use_dyn_phase_shift=false,use_inclk_switchover=false,use_dyn_reconfig=false,enable_axi=0,feedback_source=FDBK_AUTO,PRIMITIVE=MMCM,num_out_clk=5,clkin1_period=10.000,clkin2_period=15.000,use_power_down=false,use_reset=false,use_locked=true,use_inclk_stopped=false,feedback_type=SINGLE,CLOCK_MGR_TYPE=NA,manual_override=false}" *) 
module design_1_clk_wiz_0_0(processor_clk, clk_40MHz, clk_20MHz, 
  clk_20MHz_n, clk_80MHz, locked, clk_in1_p, clk_in1_n)
/* synthesis syn_black_box black_box_pad_pin="locked,clk_in1_p,clk_in1_n" */
/* synthesis syn_force_seq_prim="processor_clk" */
/* synthesis syn_force_seq_prim="clk_40MHz" */
/* synthesis syn_force_seq_prim="clk_20MHz" */
/* synthesis syn_force_seq_prim="clk_20MHz_n" */
/* synthesis syn_force_seq_prim="clk_80MHz" */;
  output processor_clk /* synthesis syn_isclock = 1 */;
  output clk_40MHz /* synthesis syn_isclock = 1 */;
  output clk_20MHz /* synthesis syn_isclock = 1 */;
  output clk_20MHz_n /* synthesis syn_isclock = 1 */;
  output clk_80MHz /* synthesis syn_isclock = 1 */;
  output locked;
  input clk_in1_p;
  input clk_in1_n;
endmodule
