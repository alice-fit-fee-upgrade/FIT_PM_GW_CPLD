-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
-- Date        : Tue Aug 26 14:56:31 2025
-- Host        : KP-LABS98 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/rsmalec/_FPGA/_PW/FIT_PM_GW_CPLD/vivado/fit_pm_dual_range_afe/fit_pm_dual_range_afe.gen/sources_1/bd/design_1/ip/design_1_fit_pm_afe_0_0/design_1_fit_pm_afe_0_0_sim_netlist.vhdl
-- Design      : design_1_fit_pm_afe_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcau10p-ffvb676-2-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_fit_pm_afe_0_0 is
  port (
    clk : in STD_LOGIC;
    rstn : in STD_LOGIC;
    clk_40 : in STD_LOGIC;
    clk_20 : in STD_LOGIC;
    clk_20n : in STD_LOGIC;
    enai : in STD_LOGIC;
    strb : in STD_LOGIC;
    evnt : in STD_LOGIC;
    evout : out STD_LOGIC;
    clk_inA : in STD_LOGIC;
    d_inAA : in STD_LOGIC_VECTOR ( 13 downto 0 );
    d_inAB : in STD_LOGIC_VECTOR ( 13 downto 0 );
    clk_inB : in STD_LOGIC;
    d_inBA : in STD_LOGIC_VECTOR ( 13 downto 0 );
    d_inBB : in STD_LOGIC_VECTOR ( 13 downto 0 );
    d_val : out STD_LOGIC;
    d_out : out STD_LOGIC_VECTOR ( 15 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_fit_pm_afe_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_fit_pm_afe_0_0 : entity is "design_1_fit_pm_afe_0_0,fit_pm_afe,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_fit_pm_afe_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_fit_pm_afe_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_fit_pm_afe_0_0 : entity is "fit_pm_afe,Vivado 2024.2";
end design_1_fit_pm_afe_0_0;

architecture STRUCTURE of design_1_fit_pm_afe_0_0 is
  signal \<const0>\ : STD_LOGIC;
  signal \^evnt\ : STD_LOGIC;
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of clk : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_RESET rstn, FREQ_HZ 80000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_clk_wiz_0_0_processor_clk, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of rstn : signal is "xilinx.com:signal:reset:1.0 rstn RST";
  attribute X_INTERFACE_MODE of rstn : signal is "slave";
  attribute X_INTERFACE_PARAMETER of rstn : signal is "XIL_INTERFACENAME rstn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
  \^evnt\ <= evnt;
  d_out(15) <= \<const0>\;
  d_out(14) <= \<const0>\;
  d_out(13) <= \<const0>\;
  d_out(12) <= \<const0>\;
  d_out(11) <= \<const0>\;
  d_out(10) <= \<const0>\;
  d_out(9) <= \<const0>\;
  d_out(8) <= \<const0>\;
  d_out(7) <= \<const0>\;
  d_out(6) <= \<const0>\;
  d_out(5) <= \<const0>\;
  d_out(4) <= \<const0>\;
  d_out(3) <= \<const0>\;
  d_out(2) <= \<const0>\;
  d_out(1) <= \<const0>\;
  d_out(0) <= \<const0>\;
  d_val <= \<const0>\;
  evout <= \^evnt\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
end STRUCTURE;
