-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
-- Date        : Tue Aug 26 14:38:10 2025
-- Host        : KP-LABS98 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/rsmalec/_FPGA/_PW/FIT_PM_GW_CPLD/vivado/fit_pm_dual_range_afe/fit_pm_dual_range_afe.gen/sources_1/bd/design_1/ip/design_1_io_int_g_drv_0_0/design_1_io_int_g_drv_0_0_sim_netlist.vhdl
-- Design      : design_1_io_int_g_drv_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcau10p-ffvb676-2-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_io_int_g_drv_0_0 is
  port (
    clk20 : in STD_LOGIC;
    clk20n : in STD_LOGIC;
    INT_A_G_DRV_P : out STD_LOGIC;
    INT_A_G_DRV_N : out STD_LOGIC;
    INT_B_G_DRV_P : out STD_LOGIC;
    INT_B_G_DRV_N : out STD_LOGIC
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_io_int_g_drv_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_io_int_g_drv_0_0 : entity is "design_1_io_int_g_drv_0_0,io_int_g_drv,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_io_int_g_drv_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_io_int_g_drv_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_io_int_g_drv_0_0 : entity is "io_int_g_drv,Vivado 2024.2";
end design_1_io_int_g_drv_0_0;

architecture STRUCTURE of design_1_io_int_g_drv_0_0 is
  signal \^clk20\ : STD_LOGIC;
  signal \^clk20n\ : STD_LOGIC;
begin
  INT_A_G_DRV_P <= \^clk20\;
  INT_B_G_DRV_P <= \^clk20n\;
  \^clk20\ <= clk20;
  \^clk20n\ <= clk20n;
INT_A_G_DRV_N_INST_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^clk20\,
      O => INT_A_G_DRV_N
    );
INT_B_G_DRV_N_INST_0: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \^clk20n\,
      O => INT_B_G_DRV_N
    );
end STRUCTURE;
