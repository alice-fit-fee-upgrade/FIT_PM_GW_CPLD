-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
-- Date        : Tue Aug 26 14:56:39 2025
-- Host        : KP-LABS98 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/rsmalec/_FPGA/_PW/FIT_PM_GW_CPLD/vivado/fit_pm_dual_range_afe/fit_pm_dual_range_afe.gen/sources_1/bd/design_1/ip/design_1_io_event_calibration_0_0/design_1_io_event_calibration_0_0_stub.vhdl
-- Design      : design_1_io_event_calibration_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcau10p-ffvb676-2-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_io_event_calibration_0_0 is
  Port ( 
    Event1_P : in STD_LOGIC;
    Event1_N : in STD_LOGIC;
    Event2_P : in STD_LOGIC;
    Event2_N : in STD_LOGIC;
    Event3_P : in STD_LOGIC;
    Event3_N : in STD_LOGIC;
    Event4_P : in STD_LOGIC;
    Event4_N : in STD_LOGIC;
    Event1 : out STD_LOGIC;
    Event2 : out STD_LOGIC;
    Event3 : out STD_LOGIC;
    Event4 : out STD_LOGIC;
    Calibration_P : out STD_LOGIC;
    Calibration_N : out STD_LOGIC;
    Calibration : in STD_LOGIC
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_io_event_calibration_0_0 : entity is "design_1_io_event_calibration_0_0,io_event_calibration,{}";
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of design_1_io_event_calibration_0_0 : entity is "design_1_io_event_calibration_0_0,io_event_calibration,{x_ipProduct=Vivado 2024.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=io_event_calibration,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=VHDL}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_io_event_calibration_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_io_event_calibration_0_0 : entity is "module_ref";
end design_1_io_event_calibration_0_0;

architecture stub of design_1_io_event_calibration_0_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "Event1_P,Event1_N,Event2_P,Event2_N,Event3_P,Event3_N,Event4_P,Event4_N,Event1,Event2,Event3,Event4,Calibration_P,Calibration_N,Calibration";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of stub : architecture is "io_event_calibration,Vivado 2024.2";
begin
end;
