// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
// Date        : Tue Aug 26 14:56:39 2025
// Host        : KP-LABS98 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/rsmalec/_FPGA/_PW/FIT_PM_GW_CPLD/vivado/fit_pm_dual_range_afe/fit_pm_dual_range_afe.gen/sources_1/bd/design_1/ip/design_1_io_event_calibration_0_0/design_1_io_event_calibration_0_0_sim_netlist.v
// Design      : design_1_io_event_calibration_0_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xcau10p-ffvb676-2-i
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "design_1_io_event_calibration_0_0,io_event_calibration,{}" *) (* DowngradeIPIdentifiedWarnings = "yes" *) (* IP_DEFINITION_SOURCE = "module_ref" *) 
(* X_CORE_INFO = "io_event_calibration,Vivado 2024.2" *) 
(* NotValidForBitStream *)
module design_1_io_event_calibration_0_0
   (Event1_P,
    Event1_N,
    Event2_P,
    Event2_N,
    Event3_P,
    Event3_N,
    Event4_P,
    Event4_N,
    Event1,
    Event2,
    Event3,
    Event4,
    Calibration_P,
    Calibration_N,
    Calibration);
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

  (* SLEW = "SLOW" *) wire Calibration;
  (* SLEW = "SLOW" *) wire Calibration_N;
  (* SLEW = "SLOW" *) wire Calibration_P;
  (* IBUF_LOW_PWR *) wire Event1;
  (* IBUF_LOW_PWR *) wire Event1_N;
  (* IBUF_LOW_PWR *) wire Event1_P;
  (* IBUF_LOW_PWR *) wire Event2;
  (* IBUF_LOW_PWR *) wire Event2_N;
  (* IBUF_LOW_PWR *) wire Event2_P;
  (* IBUF_LOW_PWR *) wire Event3;
  (* IBUF_LOW_PWR *) wire Event3_N;
  (* IBUF_LOW_PWR *) wire Event3_P;
  (* IBUF_LOW_PWR *) wire Event4;
  (* IBUF_LOW_PWR *) wire Event4_N;
  (* IBUF_LOW_PWR *) wire Event4_P;

  design_1_io_event_calibration_0_0_io_event_calibration inst
       (.Calibration(Calibration),
        .Calibration_N(Calibration_N),
        .Calibration_P(Calibration_P),
        .Event1(Event1),
        .Event1_N(Event1_N),
        .Event1_P(Event1_P),
        .Event2(Event2),
        .Event2_N(Event2_N),
        .Event2_P(Event2_P),
        .Event3(Event3),
        .Event3_N(Event3_N),
        .Event3_P(Event3_P),
        .Event4(Event4),
        .Event4_N(Event4_N),
        .Event4_P(Event4_P));
endmodule

(* ORIG_REF_NAME = "io_event_calibration" *) 
module design_1_io_event_calibration_0_0_io_event_calibration
   (Event1,
    Event2,
    Event3,
    Event4,
    Calibration_P,
    Calibration_N,
    Event1_P,
    Event1_N,
    Event2_P,
    Event2_N,
    Event3_P,
    Event3_N,
    Event4_P,
    Event4_N,
    Calibration);
  output Event1;
  output Event2;
  output Event3;
  output Event4;
  output Calibration_P;
  output Calibration_N;
  input Event1_P;
  input Event1_N;
  input Event2_P;
  input Event2_N;
  input Event3_P;
  input Event3_N;
  input Event4_P;
  input Event4_N;
  input Calibration;

  wire Calibration;
  wire Calibration_N;
  wire Calibration_P;
  wire Event1;
  wire Event1_N;
  wire Event1_P;
  wire Event2;
  wire Event2_N;
  wire Event2_P;
  wire Event3;
  wire Event3_N;
  wire Event3_P;
  wire Event4;
  wire Event4_N;
  wire Event4_P;

  (* CAPACITANCE = "DONT_CARE" *) 
  (* XILINX_LEGACY_PRIM = "OBUFDS" *) 
  (* box_type = "PRIMITIVE" *) 
  OBUFDS #(
    .IOSTANDARD("DEFAULT")) 
    Calibration_OBUF
       (.I(Calibration),
        .O(Calibration_P),
        .OB(Calibration_N));
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  (* box_type = "PRIMITIVE" *) 
  IBUFDS #(
    .DIFF_TERM("FALSE"),
    .IOSTANDARD("DEFAULT")) 
    Event1_IBUF
       (.I(Event1_P),
        .IB(Event1_N),
        .O(Event1));
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  (* box_type = "PRIMITIVE" *) 
  IBUFDS #(
    .DIFF_TERM("FALSE"),
    .IOSTANDARD("DEFAULT")) 
    Event2_IBUF
       (.I(Event2_P),
        .IB(Event2_N),
        .O(Event2));
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  (* box_type = "PRIMITIVE" *) 
  IBUFDS #(
    .DIFF_TERM("FALSE"),
    .IOSTANDARD("DEFAULT")) 
    Event3_IBUF
       (.I(Event3_P),
        .IB(Event3_N),
        .O(Event3));
  (* CAPACITANCE = "DONT_CARE" *) 
  (* IBUF_DELAY_VALUE = "0" *) 
  (* IFD_DELAY_VALUE = "AUTO" *) 
  (* box_type = "PRIMITIVE" *) 
  IBUFDS #(
    .DIFF_TERM("FALSE"),
    .IOSTANDARD("DEFAULT")) 
    Event4_IBUF
       (.I(Event4_P),
        .IB(Event4_N),
        .O(Event4));
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
