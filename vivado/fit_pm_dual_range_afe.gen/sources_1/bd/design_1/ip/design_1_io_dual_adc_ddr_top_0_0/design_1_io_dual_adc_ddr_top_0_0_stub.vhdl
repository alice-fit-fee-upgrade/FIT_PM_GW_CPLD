-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
-- Date        : Tue Aug 26 14:56:37 2025
-- Host        : KP-LABS98 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/rsmalec/_FPGA/_PW/FIT_PM_GW_CPLD/vivado/fit_pm_dual_range_afe/fit_pm_dual_range_afe.gen/sources_1/bd/design_1/ip/design_1_io_dual_adc_ddr_top_0_0/design_1_io_dual_adc_ddr_top_0_0_stub.vhdl
-- Design      : design_1_io_dual_adc_ddr_top_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcau10p-ffvb676-2-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_io_dual_adc_ddr_top_0_0 is
  Port ( 
    rstn : in STD_LOGIC;
    ADC_A_CLK_P : in STD_LOGIC;
    ADC_A_CLK_N : in STD_LOGIC;
    ADC_AA_P : in STD_LOGIC_VECTOR ( 6 downto 0 );
    ADC_AA_N : in STD_LOGIC_VECTOR ( 6 downto 0 );
    ADC_AB_P : in STD_LOGIC_VECTOR ( 6 downto 0 );
    ADC_AB_N : in STD_LOGIC_VECTOR ( 6 downto 0 );
    ADC_A_CLK : out STD_LOGIC;
    ADC_AA : out STD_LOGIC_VECTOR ( 13 downto 0 );
    ADC_AB : out STD_LOGIC_VECTOR ( 13 downto 0 );
    ADC_B_CLK_P : in STD_LOGIC;
    ADC_B_CLK_N : in STD_LOGIC;
    ADC_BA_P : in STD_LOGIC_VECTOR ( 6 downto 0 );
    ADC_BA_N : in STD_LOGIC_VECTOR ( 6 downto 0 );
    ADC_BB_P : in STD_LOGIC_VECTOR ( 6 downto 0 );
    ADC_BB_N : in STD_LOGIC_VECTOR ( 6 downto 0 );
    ADC_B_CLK : out STD_LOGIC;
    ADC_BA : out STD_LOGIC_VECTOR ( 13 downto 0 );
    ADC_BB : out STD_LOGIC_VECTOR ( 13 downto 0 )
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_io_dual_adc_ddr_top_0_0 : entity is "design_1_io_dual_adc_ddr_top_0_0,io_dual_adc_ddr_top,{}";
  attribute CORE_GENERATION_INFO : string;
  attribute CORE_GENERATION_INFO of design_1_io_dual_adc_ddr_top_0_0 : entity is "design_1_io_dual_adc_ddr_top_0_0,io_dual_adc_ddr_top,{x_ipProduct=Vivado 2024.2,x_ipVendor=xilinx.com,x_ipLibrary=module_ref,x_ipName=io_dual_adc_ddr_top,x_ipVersion=1.0,x_ipCoreRevision=1,x_ipLanguage=VERILOG,x_ipSimLanguage=VHDL,ADC_DATA_LINES=7,ADC_RESOLUTION_BITS=14}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_io_dual_adc_ddr_top_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_io_dual_adc_ddr_top_0_0 : entity is "module_ref";
end design_1_io_dual_adc_ddr_top_0_0;

architecture stub of design_1_io_dual_adc_ddr_top_0_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "rstn,ADC_A_CLK_P,ADC_A_CLK_N,ADC_AA_P[6:0],ADC_AA_N[6:0],ADC_AB_P[6:0],ADC_AB_N[6:0],ADC_A_CLK,ADC_AA[13:0],ADC_AB[13:0],ADC_B_CLK_P,ADC_B_CLK_N,ADC_BA_P[6:0],ADC_BA_N[6:0],ADC_BB_P[6:0],ADC_BB_N[6:0],ADC_B_CLK,ADC_BA[13:0],ADC_BB[13:0]";
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of rstn : signal is "xilinx.com:signal:reset:1.0 rstn RST";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of rstn : signal is "slave";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of rstn : signal is "XIL_INTERFACENAME rstn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of ADC_A_CLK_P : signal is "xilinx.com:signal:clock:1.0 ADC_A_CLK_P CLK";
  attribute X_INTERFACE_MODE of ADC_A_CLK_P : signal is "slave";
  attribute X_INTERFACE_PARAMETER of ADC_A_CLK_P : signal is "XIL_INTERFACENAME ADC_A_CLK_P, FREQ_HZ 240000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_ADC_CLK_P_0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of ADC_A_CLK_N : signal is "xilinx.com:signal:clock:1.0 ADC_A_CLK_N CLK";
  attribute X_INTERFACE_MODE of ADC_A_CLK_N : signal is "slave";
  attribute X_INTERFACE_PARAMETER of ADC_A_CLK_N : signal is "XIL_INTERFACENAME ADC_A_CLK_N, FREQ_HZ 240000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_ADC_CLK_N_0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of ADC_A_CLK : signal is "xilinx.com:signal:clock:1.0 ADC_A_CLK CLK";
  attribute X_INTERFACE_MODE of ADC_A_CLK : signal is "master";
  attribute X_INTERFACE_PARAMETER of ADC_A_CLK : signal is "XIL_INTERFACENAME ADC_A_CLK, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_io_dual_adc_ddr_top_0_0_ADC_A_CLK, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of ADC_B_CLK_P : signal is "xilinx.com:signal:clock:1.0 ADC_B_CLK_P CLK";
  attribute X_INTERFACE_MODE of ADC_B_CLK_P : signal is "slave";
  attribute X_INTERFACE_PARAMETER of ADC_B_CLK_P : signal is "XIL_INTERFACENAME ADC_B_CLK_P, FREQ_HZ 240000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_ADC_CLK_P_1, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of ADC_B_CLK_N : signal is "xilinx.com:signal:clock:1.0 ADC_B_CLK_N CLK";
  attribute X_INTERFACE_MODE of ADC_B_CLK_N : signal is "slave";
  attribute X_INTERFACE_PARAMETER of ADC_B_CLK_N : signal is "XIL_INTERFACENAME ADC_B_CLK_N, FREQ_HZ 240000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_ADC_CLK_N_1, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of ADC_B_CLK : signal is "xilinx.com:signal:clock:1.0 ADC_B_CLK CLK";
  attribute X_INTERFACE_MODE of ADC_B_CLK : signal is "master";
  attribute X_INTERFACE_PARAMETER of ADC_B_CLK : signal is "XIL_INTERFACENAME ADC_B_CLK, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_io_dual_adc_ddr_top_0_0_ADC_B_CLK, INSERT_VIP 0";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of stub : architecture is "io_dual_adc_ddr_top,Vivado 2024.2";
begin
end;
