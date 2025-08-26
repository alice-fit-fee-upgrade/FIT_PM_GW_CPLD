-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
-- Date        : Tue Aug 26 14:56:39 2025
-- Host        : KP-LABS98 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/rsmalec/_FPGA/_PW/FIT_PM_GW_CPLD/vivado/fit_pm_dual_range_afe/fit_pm_dual_range_afe.gen/sources_1/bd/design_1/ip/design_1_io_event_calibration_0_0/design_1_io_event_calibration_0_0_sim_netlist.vhdl
-- Design      : design_1_io_event_calibration_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcau10p-ffvb676-2-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_io_event_calibration_0_0_io_event_calibration is
  port (
    Event1 : out STD_LOGIC;
    Event2 : out STD_LOGIC;
    Event3 : out STD_LOGIC;
    Event4 : out STD_LOGIC;
    Calibration_P : out STD_LOGIC;
    Calibration_N : out STD_LOGIC;
    Event1_P : in STD_LOGIC;
    Event1_N : in STD_LOGIC;
    Event2_P : in STD_LOGIC;
    Event2_N : in STD_LOGIC;
    Event3_P : in STD_LOGIC;
    Event3_N : in STD_LOGIC;
    Event4_P : in STD_LOGIC;
    Event4_N : in STD_LOGIC;
    Calibration : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_io_event_calibration_0_0_io_event_calibration : entity is "io_event_calibration";
end design_1_io_event_calibration_0_0_io_event_calibration;

architecture STRUCTURE of design_1_io_event_calibration_0_0_io_event_calibration is
  attribute CAPACITANCE : string;
  attribute CAPACITANCE of Calibration_OBUF : label is "DONT_CARE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of Calibration_OBUF : label is "OBUFDS";
  attribute box_type : string;
  attribute box_type of Calibration_OBUF : label is "PRIMITIVE";
  attribute CAPACITANCE of Event1_IBUF : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE : string;
  attribute IBUF_DELAY_VALUE of Event1_IBUF : label is "0";
  attribute IFD_DELAY_VALUE : string;
  attribute IFD_DELAY_VALUE of Event1_IBUF : label is "AUTO";
  attribute box_type of Event1_IBUF : label is "PRIMITIVE";
  attribute CAPACITANCE of Event2_IBUF : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of Event2_IBUF : label is "0";
  attribute IFD_DELAY_VALUE of Event2_IBUF : label is "AUTO";
  attribute box_type of Event2_IBUF : label is "PRIMITIVE";
  attribute CAPACITANCE of Event3_IBUF : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of Event3_IBUF : label is "0";
  attribute IFD_DELAY_VALUE of Event3_IBUF : label is "AUTO";
  attribute box_type of Event3_IBUF : label is "PRIMITIVE";
  attribute CAPACITANCE of Event4_IBUF : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of Event4_IBUF : label is "0";
  attribute IFD_DELAY_VALUE of Event4_IBUF : label is "AUTO";
  attribute box_type of Event4_IBUF : label is "PRIMITIVE";
begin
Calibration_OBUF: unisim.vcomponents.OBUFDS
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => Calibration,
      O => Calibration_P,
      OB => Calibration_N
    );
Event1_IBUF: unisim.vcomponents.IBUFDS
    generic map(
      DIFF_TERM => false,
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => Event1_P,
      IB => Event1_N,
      O => Event1
    );
Event2_IBUF: unisim.vcomponents.IBUFDS
    generic map(
      DIFF_TERM => false,
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => Event2_P,
      IB => Event2_N,
      O => Event2
    );
Event3_IBUF: unisim.vcomponents.IBUFDS
    generic map(
      DIFF_TERM => false,
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => Event3_P,
      IB => Event3_N,
      O => Event3
    );
Event4_IBUF: unisim.vcomponents.IBUFDS
    generic map(
      DIFF_TERM => false,
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => Event4_P,
      IB => Event4_N,
      O => Event4
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_io_event_calibration_0_0 is
  port (
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_io_event_calibration_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_io_event_calibration_0_0 : entity is "design_1_io_event_calibration_0_0,io_event_calibration,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_io_event_calibration_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_io_event_calibration_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_io_event_calibration_0_0 : entity is "io_event_calibration,Vivado 2024.2";
end design_1_io_event_calibration_0_0;

architecture STRUCTURE of design_1_io_event_calibration_0_0 is
begin
inst: entity work.design_1_io_event_calibration_0_0_io_event_calibration
     port map (
      Calibration => Calibration,
      Calibration_N => Calibration_N,
      Calibration_P => Calibration_P,
      Event1 => Event1,
      Event1_N => Event1_N,
      Event1_P => Event1_P,
      Event2 => Event2,
      Event2_N => Event2_N,
      Event2_P => Event2_P,
      Event3 => Event3,
      Event3_N => Event3_N,
      Event3_P => Event3_P,
      Event4 => Event4,
      Event4_N => Event4_N,
      Event4_P => Event4_P
    );
end STRUCTURE;
