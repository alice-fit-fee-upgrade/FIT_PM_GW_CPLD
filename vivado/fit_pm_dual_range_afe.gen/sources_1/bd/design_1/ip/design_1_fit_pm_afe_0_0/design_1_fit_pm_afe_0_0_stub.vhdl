-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
-- Date        : Tue Aug 26 14:56:31 2025
-- Host        : KP-LABS98 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/rsmalec/_FPGA/_PW/FIT_PM_GW_CPLD/vivado/fit_pm_dual_range_afe/fit_pm_dual_range_afe.gen/sources_1/bd/design_1/ip/design_1_fit_pm_afe_0_0/design_1_fit_pm_afe_0_0_stub.vhdl
-- Design      : design_1_fit_pm_afe_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcau10p-ffvb676-2-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_fit_pm_afe_0_0 is
  Port ( 
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

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_fit_pm_afe_0_0 : entity is "design_1_fit_pm_afe_0_0,fit_pm_afe,{}";
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of design_1_fit_pm_afe_0_0 : entity is "design_1_fit_pm_afe_0_0,fit_pm_afe,{x_ipProduct=Vivado 2024.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=fit_pm_afe,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=VHDL,ADC_DATA_LINES=7,ADC_RESOLUTION_BITS=14,DATA_OUT_W=16}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_fit_pm_afe_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_fit_pm_afe_0_0 : entity is "module_ref";
end design_1_fit_pm_afe_0_0;

architecture stub of design_1_fit_pm_afe_0_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "clk,rstn,clk_40,clk_20,clk_20n,enai,strb,evnt,evout,clk_inA,d_inAA[13:0],d_inAB[13:0],clk_inB,d_inBA[13:0],d_inBB[13:0],d_val,d_out[15:0]";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of clk : signal is "xilinx.com:signal:clock:1.0 clk CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of clk : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of clk : signal is "XIL_INTERFACENAME clk, ASSOCIATED_RESET rstn, FREQ_HZ 80000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_clk_wiz_0_0_processor_clk, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of rstn : signal is "xilinx.com:signal:reset:1.0 rstn RST";
  attribute X_INTERFACE_MODE of rstn : signal is "slave";
  attribute X_INTERFACE_PARAMETER of rstn : signal is "XIL_INTERFACENAME rstn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of stub : architecture is "fit_pm_afe,Vivado 2024.2";
begin
end;
