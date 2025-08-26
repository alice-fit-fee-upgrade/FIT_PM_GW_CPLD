-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
-- Date        : Tue Aug 26 14:39:33 2025
-- Host        : KP-LABS98 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/rsmalec/_FPGA/_PW/FIT_PM_GW_CPLD/vivado/fit_pm_dual_range_afe/fit_pm_dual_range_afe.gen/sources_1/bd/design_1/ip/design_1_util_ds_buf_0_0/design_1_util_ds_buf_0_0_sim_netlist.vhdl
-- Design      : design_1_util_ds_buf_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcau10p-ffvb676-2-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_util_ds_buf_0_0_util_ds_buf is
  port (
    IBUF_DS_P : in STD_LOGIC_VECTOR ( 2 downto 0 );
    IBUF_DS_N : in STD_LOGIC_VECTOR ( 2 downto 0 );
    IBUF_OUT : out STD_LOGIC_VECTOR ( 2 downto 0 );
    IBUF_DS_ODIV2 : out STD_LOGIC_VECTOR ( 2 downto 0 );
    IBUF_DS_CEB : in STD_LOGIC_VECTOR ( 2 downto 0 );
    OBUF_IN : in STD_LOGIC_VECTOR ( 2 downto 0 );
    OBUF_DS_P : out STD_LOGIC_VECTOR ( 2 downto 0 );
    OBUF_DS_N : out STD_LOGIC_VECTOR ( 2 downto 0 );
    IOBUF_DS_P : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    IOBUF_DS_N : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    IOBUF_IO_T : in STD_LOGIC_VECTOR ( 2 downto 0 );
    IOBUF_IO_I : in STD_LOGIC_VECTOR ( 2 downto 0 );
    IOBUF_IO_O : out STD_LOGIC_VECTOR ( 2 downto 0 );
    IOBUF_IO_IO : inout STD_LOGIC_VECTOR ( 2 downto 0 );
    BUFG_I : in STD_LOGIC_VECTOR ( 2 downto 0 );
    BUFG_O : out STD_LOGIC_VECTOR ( 2 downto 0 );
    BUFGCE_I : in STD_LOGIC_VECTOR ( 2 downto 0 );
    BUFGCE_CE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    BUFGCE_O : out STD_LOGIC_VECTOR ( 2 downto 0 );
    BUFGCE_CLR : in STD_LOGIC_VECTOR ( 2 downto 0 );
    BUFH_I : in STD_LOGIC_VECTOR ( 2 downto 0 );
    BUFH_O : out STD_LOGIC_VECTOR ( 2 downto 0 );
    BUFHCE_I : in STD_LOGIC_VECTOR ( 2 downto 0 );
    BUFHCE_CE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    BUFHCE_O : out STD_LOGIC_VECTOR ( 2 downto 0 );
    BUFG_FABRIC_I : in STD_LOGIC_VECTOR ( 2 downto 0 );
    BUFG_FABRIC_O : out STD_LOGIC_VECTOR ( 2 downto 0 );
    OBUFDS_GTE5_CEB : in STD_LOGIC_VECTOR ( 2 downto 0 );
    OBUFDS_GTE5_I : in STD_LOGIC_VECTOR ( 2 downto 0 );
    OBUFDS_GTE5_O : out STD_LOGIC_VECTOR ( 2 downto 0 );
    OBUFDS_GTE5_OB : out STD_LOGIC_VECTOR ( 2 downto 0 );
    OBUFDS_GTE5_ADV_CEB : in STD_LOGIC_VECTOR ( 2 downto 0 );
    OBUFDS_GTE5_ADV_I : in STD_LOGIC_VECTOR ( 11 downto 0 );
    OBUFDS_GTE5_ADV_O : out STD_LOGIC_VECTOR ( 2 downto 0 );
    OBUFDS_GTE5_ADV_OB : out STD_LOGIC_VECTOR ( 2 downto 0 );
    OBUFDS_GTE5_ADV_RXRECCLKSEL : in STD_LOGIC_VECTOR ( 5 downto 0 );
    OBUFDS_GTE3_CEB : in STD_LOGIC_VECTOR ( 2 downto 0 );
    OBUFDS_GTE3_I : in STD_LOGIC_VECTOR ( 2 downto 0 );
    OBUFDS_GTE3_O : out STD_LOGIC_VECTOR ( 2 downto 0 );
    OBUFDS_GTE3_OB : out STD_LOGIC_VECTOR ( 2 downto 0 );
    OBUFDS_GTE3_ADV_CEB : in STD_LOGIC_VECTOR ( 2 downto 0 );
    OBUFDS_GTE3_ADV_I : in STD_LOGIC_VECTOR ( 11 downto 0 );
    OBUFDS_GTE3_ADV_O : out STD_LOGIC_VECTOR ( 2 downto 0 );
    OBUFDS_GTE3_ADV_OB : out STD_LOGIC_VECTOR ( 2 downto 0 );
    RXRECCLK_SEL_GTE3_ADV : in STD_LOGIC_VECTOR ( 5 downto 0 );
    OBUFDS_GTE4_CEB : in STD_LOGIC_VECTOR ( 2 downto 0 );
    OBUFDS_GTE4_I : in STD_LOGIC_VECTOR ( 2 downto 0 );
    OBUFDS_GTE4_O : out STD_LOGIC_VECTOR ( 2 downto 0 );
    OBUFDS_GTE4_OB : out STD_LOGIC_VECTOR ( 2 downto 0 );
    OBUFDS_GTE4_ADV_CEB : in STD_LOGIC_VECTOR ( 2 downto 0 );
    OBUFDS_GTE4_ADV_I : in STD_LOGIC_VECTOR ( 11 downto 0 );
    OBUFDS_GTE4_ADV_O : out STD_LOGIC_VECTOR ( 2 downto 0 );
    OBUFDS_GTE4_ADV_OB : out STD_LOGIC_VECTOR ( 2 downto 0 );
    RXRECCLK_SEL_GTE4_ADV : in STD_LOGIC_VECTOR ( 5 downto 0 );
    IBUFDS_GTM_O : out STD_LOGIC_VECTOR ( 2 downto 0 );
    IBUFDS_GTM_ODIV2 : out STD_LOGIC_VECTOR ( 2 downto 0 );
    IBUFDS_GTM_CEB : in STD_LOGIC_VECTOR ( 2 downto 0 );
    IBUFDS_GTM_I : in STD_LOGIC_VECTOR ( 2 downto 0 );
    IBUFDS_GTM_IB : in STD_LOGIC_VECTOR ( 2 downto 0 );
    OBUFDS_GTM_O : out STD_LOGIC_VECTOR ( 2 downto 0 );
    OBUFDS_GTM_OB : out STD_LOGIC_VECTOR ( 2 downto 0 );
    OBUFDS_GTM_CEB : in STD_LOGIC_VECTOR ( 2 downto 0 );
    OBUFDS_GTM_I : in STD_LOGIC_VECTOR ( 2 downto 0 );
    OBUFDS_GTM_ADV_CEB : in STD_LOGIC_VECTOR ( 2 downto 0 );
    OBUFDS_GTM_ADV_I : in STD_LOGIC_VECTOR ( 11 downto 0 );
    OBUFDS_GTM_ADV_O : out STD_LOGIC_VECTOR ( 2 downto 0 );
    OBUFDS_GTM_ADV_OB : out STD_LOGIC_VECTOR ( 2 downto 0 );
    IBUFDS_GTME5_O : out STD_LOGIC_VECTOR ( 2 downto 0 );
    IBUFDS_GTME5_ODIV2 : out STD_LOGIC_VECTOR ( 2 downto 0 );
    IBUFDS_GTME5_CEB : in STD_LOGIC_VECTOR ( 2 downto 0 );
    IBUFDS_GTME5_I : in STD_LOGIC_VECTOR ( 2 downto 0 );
    IBUFDS_GTME5_IB : in STD_LOGIC_VECTOR ( 2 downto 0 );
    OBUFDS_GTME5_CEB : in STD_LOGIC_VECTOR ( 2 downto 0 );
    OBUFDS_GTME5_I : in STD_LOGIC_VECTOR ( 2 downto 0 );
    OBUFDS_GTME5_O : out STD_LOGIC_VECTOR ( 2 downto 0 );
    OBUFDS_GTME5_OB : out STD_LOGIC_VECTOR ( 2 downto 0 );
    OBUFDS_GTME5_ADV_CEB : in STD_LOGIC_VECTOR ( 2 downto 0 );
    OBUFDS_GTME5_ADV_I : in STD_LOGIC_VECTOR ( 11 downto 0 );
    OBUFDS_GTME5_ADV_O : out STD_LOGIC_VECTOR ( 2 downto 0 );
    OBUFDS_GTME5_ADV_OB : out STD_LOGIC_VECTOR ( 2 downto 0 );
    OBUFDS_GTME5_ADV_RXRECCLKSEL : in STD_LOGIC_VECTOR ( 5 downto 0 );
    BUFG_GT_I : in STD_LOGIC_VECTOR ( 2 downto 0 );
    BUFG_GT_CE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    BUFG_GT_CEMASK : in STD_LOGIC_VECTOR ( 2 downto 0 );
    BUFG_GT_CLR : in STD_LOGIC_VECTOR ( 2 downto 0 );
    BUFG_GT_CLRMASK : in STD_LOGIC_VECTOR ( 2 downto 0 );
    BUFG_GT_DIV : in STD_LOGIC_VECTOR ( 8 downto 0 );
    BUFG_GT_O : out STD_LOGIC_VECTOR ( 2 downto 0 );
    BUFG_PS_I : in STD_LOGIC_VECTOR ( 2 downto 0 );
    BUFG_PS_O : out STD_LOGIC_VECTOR ( 2 downto 0 );
    MBUFG_GT_I : in STD_LOGIC_VECTOR ( 2 downto 0 );
    MBUFG_GT_CE : in STD_LOGIC_VECTOR ( 2 downto 0 );
    MBUFG_GT_CEMASK : in STD_LOGIC_VECTOR ( 2 downto 0 );
    MBUFG_GT_CLR : in STD_LOGIC_VECTOR ( 2 downto 0 );
    MBUFG_GT_CLRB_LEAF : in STD_LOGIC_VECTOR ( 2 downto 0 );
    MBUFG_GT_CLRMASK : in STD_LOGIC_VECTOR ( 2 downto 0 );
    MBUFG_GT_DIV : in STD_LOGIC_VECTOR ( 8 downto 0 );
    MBUFG_GT_O1 : out STD_LOGIC_VECTOR ( 2 downto 0 );
    MBUFG_GT_O2 : out STD_LOGIC_VECTOR ( 2 downto 0 );
    MBUFG_GT_O3 : out STD_LOGIC_VECTOR ( 2 downto 0 );
    MBUFG_GT_O4 : out STD_LOGIC_VECTOR ( 2 downto 0 );
    MBUFG_PS_I : in STD_LOGIC_VECTOR ( 2 downto 0 );
    MBUFG_PS_CLRB_LEAF : in STD_LOGIC_VECTOR ( 2 downto 0 );
    MBUFG_PS_O1 : out STD_LOGIC_VECTOR ( 2 downto 0 );
    MBUFG_PS_O2 : out STD_LOGIC_VECTOR ( 2 downto 0 );
    MBUFG_PS_O3 : out STD_LOGIC_VECTOR ( 2 downto 0 );
    MBUFG_PS_O4 : out STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  attribute C_BUFGCE_DIV : integer;
  attribute C_BUFGCE_DIV of design_1_util_ds_buf_0_0_util_ds_buf : entity is 1;
  attribute C_BUFG_GT_SYNC : integer;
  attribute C_BUFG_GT_SYNC of design_1_util_ds_buf_0_0_util_ds_buf : entity is 0;
  attribute C_BUF_TYPE : string;
  attribute C_BUF_TYPE of design_1_util_ds_buf_0_0_util_ds_buf : entity is "IOBUF";
  attribute C_MODE : string;
  attribute C_MODE of design_1_util_ds_buf_0_0_util_ds_buf : entity is "PERFORMANCE";
  attribute C_OBUFDS_GTE5_ADV : string;
  attribute C_OBUFDS_GTE5_ADV of design_1_util_ds_buf_0_0_util_ds_buf : entity is "2'b00";
  attribute C_REFCLK_ICNTL_TX : string;
  attribute C_REFCLK_ICNTL_TX of design_1_util_ds_buf_0_0_util_ds_buf : entity is "5'b00000";
  attribute C_SIM_DEVICE : string;
  attribute C_SIM_DEVICE of design_1_util_ds_buf_0_0_util_ds_buf : entity is "VERSAL_AI_CORE_ES1";
  attribute C_SIZE : integer;
  attribute C_SIZE of design_1_util_ds_buf_0_0_util_ds_buf : entity is 3;
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_util_ds_buf_0_0_util_ds_buf : entity is "util_ds_buf";
end design_1_util_ds_buf_0_0_util_ds_buf;

architecture STRUCTURE of design_1_util_ds_buf_0_0_util_ds_buf is
  signal \<const0>\ : STD_LOGIC;
  attribute box_type : string;
  attribute box_type of \USE_IOBUF.GEN_IOBUF[0].IOBUF_I\ : label is "PRIMITIVE";
  attribute box_type of \USE_IOBUF.GEN_IOBUF[1].IOBUF_I\ : label is "PRIMITIVE";
  attribute box_type of \USE_IOBUF.GEN_IOBUF[2].IOBUF_I\ : label is "PRIMITIVE";
begin
  BUFGCE_O(2) <= \<const0>\;
  BUFGCE_O(1) <= \<const0>\;
  BUFGCE_O(0) <= \<const0>\;
  BUFG_FABRIC_O(2) <= \<const0>\;
  BUFG_FABRIC_O(1) <= \<const0>\;
  BUFG_FABRIC_O(0) <= \<const0>\;
  BUFG_GT_O(2) <= \<const0>\;
  BUFG_GT_O(1) <= \<const0>\;
  BUFG_GT_O(0) <= \<const0>\;
  BUFG_O(2) <= \<const0>\;
  BUFG_O(1) <= \<const0>\;
  BUFG_O(0) <= \<const0>\;
  BUFG_PS_O(2) <= \<const0>\;
  BUFG_PS_O(1) <= \<const0>\;
  BUFG_PS_O(0) <= \<const0>\;
  BUFHCE_O(2) <= \<const0>\;
  BUFHCE_O(1) <= \<const0>\;
  BUFHCE_O(0) <= \<const0>\;
  BUFH_O(2) <= \<const0>\;
  BUFH_O(1) <= \<const0>\;
  BUFH_O(0) <= \<const0>\;
  IBUFDS_GTME5_O(2) <= \<const0>\;
  IBUFDS_GTME5_O(1) <= \<const0>\;
  IBUFDS_GTME5_O(0) <= \<const0>\;
  IBUFDS_GTME5_ODIV2(2) <= \<const0>\;
  IBUFDS_GTME5_ODIV2(1) <= \<const0>\;
  IBUFDS_GTME5_ODIV2(0) <= \<const0>\;
  IBUFDS_GTM_O(2) <= \<const0>\;
  IBUFDS_GTM_O(1) <= \<const0>\;
  IBUFDS_GTM_O(0) <= \<const0>\;
  IBUFDS_GTM_ODIV2(2) <= \<const0>\;
  IBUFDS_GTM_ODIV2(1) <= \<const0>\;
  IBUFDS_GTM_ODIV2(0) <= \<const0>\;
  IBUF_DS_ODIV2(2) <= \<const0>\;
  IBUF_DS_ODIV2(1) <= \<const0>\;
  IBUF_DS_ODIV2(0) <= \<const0>\;
  IBUF_OUT(2) <= \<const0>\;
  IBUF_OUT(1) <= \<const0>\;
  IBUF_OUT(0) <= \<const0>\;
  MBUFG_GT_O1(2) <= \<const0>\;
  MBUFG_GT_O1(1) <= \<const0>\;
  MBUFG_GT_O1(0) <= \<const0>\;
  MBUFG_GT_O2(2) <= \<const0>\;
  MBUFG_GT_O2(1) <= \<const0>\;
  MBUFG_GT_O2(0) <= \<const0>\;
  MBUFG_GT_O3(2) <= \<const0>\;
  MBUFG_GT_O3(1) <= \<const0>\;
  MBUFG_GT_O3(0) <= \<const0>\;
  MBUFG_GT_O4(2) <= \<const0>\;
  MBUFG_GT_O4(1) <= \<const0>\;
  MBUFG_GT_O4(0) <= \<const0>\;
  MBUFG_PS_O1(2) <= \<const0>\;
  MBUFG_PS_O1(1) <= \<const0>\;
  MBUFG_PS_O1(0) <= \<const0>\;
  MBUFG_PS_O2(2) <= \<const0>\;
  MBUFG_PS_O2(1) <= \<const0>\;
  MBUFG_PS_O2(0) <= \<const0>\;
  MBUFG_PS_O3(2) <= \<const0>\;
  MBUFG_PS_O3(1) <= \<const0>\;
  MBUFG_PS_O3(0) <= \<const0>\;
  MBUFG_PS_O4(2) <= \<const0>\;
  MBUFG_PS_O4(1) <= \<const0>\;
  MBUFG_PS_O4(0) <= \<const0>\;
  OBUFDS_GTE3_ADV_O(2) <= \<const0>\;
  OBUFDS_GTE3_ADV_O(1) <= \<const0>\;
  OBUFDS_GTE3_ADV_O(0) <= \<const0>\;
  OBUFDS_GTE3_ADV_OB(2) <= \<const0>\;
  OBUFDS_GTE3_ADV_OB(1) <= \<const0>\;
  OBUFDS_GTE3_ADV_OB(0) <= \<const0>\;
  OBUFDS_GTE3_O(2) <= \<const0>\;
  OBUFDS_GTE3_O(1) <= \<const0>\;
  OBUFDS_GTE3_O(0) <= \<const0>\;
  OBUFDS_GTE3_OB(2) <= \<const0>\;
  OBUFDS_GTE3_OB(1) <= \<const0>\;
  OBUFDS_GTE3_OB(0) <= \<const0>\;
  OBUFDS_GTE4_ADV_O(2) <= \<const0>\;
  OBUFDS_GTE4_ADV_O(1) <= \<const0>\;
  OBUFDS_GTE4_ADV_O(0) <= \<const0>\;
  OBUFDS_GTE4_ADV_OB(2) <= \<const0>\;
  OBUFDS_GTE4_ADV_OB(1) <= \<const0>\;
  OBUFDS_GTE4_ADV_OB(0) <= \<const0>\;
  OBUFDS_GTE4_O(2) <= \<const0>\;
  OBUFDS_GTE4_O(1) <= \<const0>\;
  OBUFDS_GTE4_O(0) <= \<const0>\;
  OBUFDS_GTE4_OB(2) <= \<const0>\;
  OBUFDS_GTE4_OB(1) <= \<const0>\;
  OBUFDS_GTE4_OB(0) <= \<const0>\;
  OBUFDS_GTE5_ADV_O(2) <= \<const0>\;
  OBUFDS_GTE5_ADV_O(1) <= \<const0>\;
  OBUFDS_GTE5_ADV_O(0) <= \<const0>\;
  OBUFDS_GTE5_ADV_OB(2) <= \<const0>\;
  OBUFDS_GTE5_ADV_OB(1) <= \<const0>\;
  OBUFDS_GTE5_ADV_OB(0) <= \<const0>\;
  OBUFDS_GTE5_O(2) <= \<const0>\;
  OBUFDS_GTE5_O(1) <= \<const0>\;
  OBUFDS_GTE5_O(0) <= \<const0>\;
  OBUFDS_GTE5_OB(2) <= \<const0>\;
  OBUFDS_GTE5_OB(1) <= \<const0>\;
  OBUFDS_GTE5_OB(0) <= \<const0>\;
  OBUFDS_GTME5_ADV_O(2) <= \<const0>\;
  OBUFDS_GTME5_ADV_O(1) <= \<const0>\;
  OBUFDS_GTME5_ADV_O(0) <= \<const0>\;
  OBUFDS_GTME5_ADV_OB(2) <= \<const0>\;
  OBUFDS_GTME5_ADV_OB(1) <= \<const0>\;
  OBUFDS_GTME5_ADV_OB(0) <= \<const0>\;
  OBUFDS_GTME5_O(2) <= \<const0>\;
  OBUFDS_GTME5_O(1) <= \<const0>\;
  OBUFDS_GTME5_O(0) <= \<const0>\;
  OBUFDS_GTME5_OB(2) <= \<const0>\;
  OBUFDS_GTME5_OB(1) <= \<const0>\;
  OBUFDS_GTME5_OB(0) <= \<const0>\;
  OBUFDS_GTM_ADV_O(2) <= \<const0>\;
  OBUFDS_GTM_ADV_O(1) <= \<const0>\;
  OBUFDS_GTM_ADV_O(0) <= \<const0>\;
  OBUFDS_GTM_ADV_OB(2) <= \<const0>\;
  OBUFDS_GTM_ADV_OB(1) <= \<const0>\;
  OBUFDS_GTM_ADV_OB(0) <= \<const0>\;
  OBUFDS_GTM_O(2) <= \<const0>\;
  OBUFDS_GTM_O(1) <= \<const0>\;
  OBUFDS_GTM_O(0) <= \<const0>\;
  OBUFDS_GTM_OB(2) <= \<const0>\;
  OBUFDS_GTM_OB(1) <= \<const0>\;
  OBUFDS_GTM_OB(0) <= \<const0>\;
  OBUF_DS_N(2) <= \<const0>\;
  OBUF_DS_N(1) <= \<const0>\;
  OBUF_DS_N(0) <= \<const0>\;
  OBUF_DS_P(2) <= \<const0>\;
  OBUF_DS_P(1) <= \<const0>\;
  OBUF_DS_P(0) <= \<const0>\;
GND: unisim.vcomponents.GND
     port map (
      G => \<const0>\
    );
\USE_IOBUF.GEN_IOBUF[0].IOBUF_I\: unisim.vcomponents.IOBUF
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => IOBUF_IO_I(0),
      IO => IOBUF_IO_IO(0),
      O => IOBUF_IO_O(0),
      T => IOBUF_IO_T(0)
    );
\USE_IOBUF.GEN_IOBUF[1].IOBUF_I\: unisim.vcomponents.IOBUF
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => IOBUF_IO_I(1),
      IO => IOBUF_IO_IO(1),
      O => IOBUF_IO_O(1),
      T => IOBUF_IO_T(1)
    );
\USE_IOBUF.GEN_IOBUF[2].IOBUF_I\: unisim.vcomponents.IOBUF
    generic map(
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => IOBUF_IO_I(2),
      IO => IOBUF_IO_IO(2),
      O => IOBUF_IO_O(2),
      T => IOBUF_IO_T(2)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_util_ds_buf_0_0 is
  port (
    IOBUF_IO_T : in STD_LOGIC_VECTOR ( 2 downto 0 );
    IOBUF_IO_I : in STD_LOGIC_VECTOR ( 2 downto 0 );
    IOBUF_IO_O : out STD_LOGIC_VECTOR ( 2 downto 0 );
    IOBUF_IO_IO : inout STD_LOGIC_VECTOR ( 2 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_util_ds_buf_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_util_ds_buf_0_0 : entity is "design_1_util_ds_buf_0_0,util_ds_buf,{}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of design_1_util_ds_buf_0_0 : entity is "yes";
  attribute x_core_info : string;
  attribute x_core_info of design_1_util_ds_buf_0_0 : entity is "util_ds_buf,Vivado 2024.2";
end design_1_util_ds_buf_0_0;

architecture STRUCTURE of design_1_util_ds_buf_0_0 is
  signal NLW_U0_BUFGCE_O_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_BUFG_FABRIC_O_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_BUFG_GT_O_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_BUFG_O_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_BUFG_PS_O_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_BUFHCE_O_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_BUFH_O_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_IBUFDS_GTME5_O_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_IBUFDS_GTME5_ODIV2_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_IBUFDS_GTM_O_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_IBUFDS_GTM_ODIV2_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_IBUF_DS_ODIV2_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_IBUF_OUT_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_IOBUF_DS_N_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_IOBUF_DS_P_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_MBUFG_GT_O1_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_MBUFG_GT_O2_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_MBUFG_GT_O3_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_MBUFG_GT_O4_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_MBUFG_PS_O1_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_MBUFG_PS_O2_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_MBUFG_PS_O3_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_MBUFG_PS_O4_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_OBUFDS_GTE3_ADV_O_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_OBUFDS_GTE3_ADV_OB_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_OBUFDS_GTE3_O_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_OBUFDS_GTE3_OB_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_OBUFDS_GTE4_ADV_O_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_OBUFDS_GTE4_ADV_OB_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_OBUFDS_GTE4_O_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_OBUFDS_GTE4_OB_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_OBUFDS_GTE5_ADV_O_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_OBUFDS_GTE5_ADV_OB_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_OBUFDS_GTE5_O_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_OBUFDS_GTE5_OB_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_OBUFDS_GTME5_ADV_O_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_OBUFDS_GTME5_ADV_OB_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_OBUFDS_GTME5_O_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_OBUFDS_GTME5_OB_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_OBUFDS_GTM_ADV_O_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_OBUFDS_GTM_ADV_OB_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_OBUFDS_GTM_O_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_OBUFDS_GTM_OB_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_OBUF_DS_N_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal NLW_U0_OBUF_DS_P_UNCONNECTED : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute C_BUFGCE_DIV : integer;
  attribute C_BUFGCE_DIV of U0 : label is 1;
  attribute C_BUFG_GT_SYNC : integer;
  attribute C_BUFG_GT_SYNC of U0 : label is 0;
  attribute C_BUF_TYPE : string;
  attribute C_BUF_TYPE of U0 : label is "IOBUF";
  attribute C_MODE : string;
  attribute C_MODE of U0 : label is "PERFORMANCE";
  attribute C_OBUFDS_GTE5_ADV : string;
  attribute C_OBUFDS_GTE5_ADV of U0 : label is "2'b00";
  attribute C_REFCLK_ICNTL_TX : string;
  attribute C_REFCLK_ICNTL_TX of U0 : label is "5'b00000";
  attribute C_SIM_DEVICE : string;
  attribute C_SIM_DEVICE of U0 : label is "VERSAL_AI_CORE_ES1";
  attribute C_SIZE : integer;
  attribute C_SIZE of U0 : label is 3;
  attribute x_interface_info : string;
  attribute x_interface_info of IOBUF_IO_I : signal is "xilinx.com:signal:clock:1.0 IOBUF_IO_I CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of IOBUF_IO_I : signal is "slave IOBUF_IO_I";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of IOBUF_IO_I : signal is "XIL_INTERFACENAME IOBUF_IO_I, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0";
  attribute x_interface_info of IOBUF_IO_O : signal is "xilinx.com:signal:clock:1.0 IOBUF_IO_O CLK";
  attribute x_interface_mode of IOBUF_IO_O : signal is "master IOBUF_IO_O";
  attribute x_interface_parameter of IOBUF_IO_O : signal is "XIL_INTERFACENAME IOBUF_IO_O, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_util_ds_buf_0_0_IOBUF_IO_O, INSERT_VIP 0";
begin
U0: entity work.design_1_util_ds_buf_0_0_util_ds_buf
     port map (
      BUFGCE_CE(2 downto 0) => B"000",
      BUFGCE_CLR(2 downto 0) => B"000",
      BUFGCE_I(2 downto 0) => B"000",
      BUFGCE_O(2 downto 0) => NLW_U0_BUFGCE_O_UNCONNECTED(2 downto 0),
      BUFG_FABRIC_I(2 downto 0) => B"000",
      BUFG_FABRIC_O(2 downto 0) => NLW_U0_BUFG_FABRIC_O_UNCONNECTED(2 downto 0),
      BUFG_GT_CE(2 downto 0) => B"001",
      BUFG_GT_CEMASK(2 downto 0) => B"000",
      BUFG_GT_CLR(2 downto 0) => B"000",
      BUFG_GT_CLRMASK(2 downto 0) => B"000",
      BUFG_GT_DIV(8 downto 0) => B"000000000",
      BUFG_GT_I(2 downto 0) => B"000",
      BUFG_GT_O(2 downto 0) => NLW_U0_BUFG_GT_O_UNCONNECTED(2 downto 0),
      BUFG_I(2 downto 0) => B"000",
      BUFG_O(2 downto 0) => NLW_U0_BUFG_O_UNCONNECTED(2 downto 0),
      BUFG_PS_I(2 downto 0) => B"000",
      BUFG_PS_O(2 downto 0) => NLW_U0_BUFG_PS_O_UNCONNECTED(2 downto 0),
      BUFHCE_CE(2 downto 0) => B"000",
      BUFHCE_I(2 downto 0) => B"000",
      BUFHCE_O(2 downto 0) => NLW_U0_BUFHCE_O_UNCONNECTED(2 downto 0),
      BUFH_I(2 downto 0) => B"000",
      BUFH_O(2 downto 0) => NLW_U0_BUFH_O_UNCONNECTED(2 downto 0),
      IBUFDS_GTME5_CEB(2 downto 0) => B"000",
      IBUFDS_GTME5_I(2 downto 0) => B"000",
      IBUFDS_GTME5_IB(2 downto 0) => B"000",
      IBUFDS_GTME5_O(2 downto 0) => NLW_U0_IBUFDS_GTME5_O_UNCONNECTED(2 downto 0),
      IBUFDS_GTME5_ODIV2(2 downto 0) => NLW_U0_IBUFDS_GTME5_ODIV2_UNCONNECTED(2 downto 0),
      IBUFDS_GTM_CEB(2 downto 0) => B"000",
      IBUFDS_GTM_I(2 downto 0) => B"000",
      IBUFDS_GTM_IB(2 downto 0) => B"000",
      IBUFDS_GTM_O(2 downto 0) => NLW_U0_IBUFDS_GTM_O_UNCONNECTED(2 downto 0),
      IBUFDS_GTM_ODIV2(2 downto 0) => NLW_U0_IBUFDS_GTM_ODIV2_UNCONNECTED(2 downto 0),
      IBUF_DS_CEB(2 downto 0) => B"000",
      IBUF_DS_N(2 downto 0) => B"000",
      IBUF_DS_ODIV2(2 downto 0) => NLW_U0_IBUF_DS_ODIV2_UNCONNECTED(2 downto 0),
      IBUF_DS_P(2 downto 0) => B"000",
      IBUF_OUT(2 downto 0) => NLW_U0_IBUF_OUT_UNCONNECTED(2 downto 0),
      IOBUF_DS_N(2 downto 0) => NLW_U0_IOBUF_DS_N_UNCONNECTED(2 downto 0),
      IOBUF_DS_P(2 downto 0) => NLW_U0_IOBUF_DS_P_UNCONNECTED(2 downto 0),
      IOBUF_IO_I(2 downto 0) => IOBUF_IO_I(2 downto 0),
      IOBUF_IO_IO(2 downto 0) => IOBUF_IO_IO(2 downto 0),
      IOBUF_IO_O(2 downto 0) => IOBUF_IO_O(2 downto 0),
      IOBUF_IO_T(2 downto 0) => IOBUF_IO_T(2 downto 0),
      MBUFG_GT_CE(2 downto 0) => B"001",
      MBUFG_GT_CEMASK(2 downto 0) => B"000",
      MBUFG_GT_CLR(2 downto 0) => B"000",
      MBUFG_GT_CLRB_LEAF(2 downto 0) => B"001",
      MBUFG_GT_CLRMASK(2 downto 0) => B"000",
      MBUFG_GT_DIV(8 downto 0) => B"000000000",
      MBUFG_GT_I(2 downto 0) => B"000",
      MBUFG_GT_O1(2 downto 0) => NLW_U0_MBUFG_GT_O1_UNCONNECTED(2 downto 0),
      MBUFG_GT_O2(2 downto 0) => NLW_U0_MBUFG_GT_O2_UNCONNECTED(2 downto 0),
      MBUFG_GT_O3(2 downto 0) => NLW_U0_MBUFG_GT_O3_UNCONNECTED(2 downto 0),
      MBUFG_GT_O4(2 downto 0) => NLW_U0_MBUFG_GT_O4_UNCONNECTED(2 downto 0),
      MBUFG_PS_CLRB_LEAF(2 downto 0) => B"001",
      MBUFG_PS_I(2 downto 0) => B"000",
      MBUFG_PS_O1(2 downto 0) => NLW_U0_MBUFG_PS_O1_UNCONNECTED(2 downto 0),
      MBUFG_PS_O2(2 downto 0) => NLW_U0_MBUFG_PS_O2_UNCONNECTED(2 downto 0),
      MBUFG_PS_O3(2 downto 0) => NLW_U0_MBUFG_PS_O3_UNCONNECTED(2 downto 0),
      MBUFG_PS_O4(2 downto 0) => NLW_U0_MBUFG_PS_O4_UNCONNECTED(2 downto 0),
      OBUFDS_GTE3_ADV_CEB(2 downto 0) => B"000",
      OBUFDS_GTE3_ADV_I(11 downto 0) => B"000000000000",
      OBUFDS_GTE3_ADV_O(2 downto 0) => NLW_U0_OBUFDS_GTE3_ADV_O_UNCONNECTED(2 downto 0),
      OBUFDS_GTE3_ADV_OB(2 downto 0) => NLW_U0_OBUFDS_GTE3_ADV_OB_UNCONNECTED(2 downto 0),
      OBUFDS_GTE3_CEB(2 downto 0) => B"000",
      OBUFDS_GTE3_I(2 downto 0) => B"000",
      OBUFDS_GTE3_O(2 downto 0) => NLW_U0_OBUFDS_GTE3_O_UNCONNECTED(2 downto 0),
      OBUFDS_GTE3_OB(2 downto 0) => NLW_U0_OBUFDS_GTE3_OB_UNCONNECTED(2 downto 0),
      OBUFDS_GTE4_ADV_CEB(2 downto 0) => B"000",
      OBUFDS_GTE4_ADV_I(11 downto 0) => B"000000000000",
      OBUFDS_GTE4_ADV_O(2 downto 0) => NLW_U0_OBUFDS_GTE4_ADV_O_UNCONNECTED(2 downto 0),
      OBUFDS_GTE4_ADV_OB(2 downto 0) => NLW_U0_OBUFDS_GTE4_ADV_OB_UNCONNECTED(2 downto 0),
      OBUFDS_GTE4_CEB(2 downto 0) => B"000",
      OBUFDS_GTE4_I(2 downto 0) => B"000",
      OBUFDS_GTE4_O(2 downto 0) => NLW_U0_OBUFDS_GTE4_O_UNCONNECTED(2 downto 0),
      OBUFDS_GTE4_OB(2 downto 0) => NLW_U0_OBUFDS_GTE4_OB_UNCONNECTED(2 downto 0),
      OBUFDS_GTE5_ADV_CEB(2 downto 0) => B"000",
      OBUFDS_GTE5_ADV_I(11 downto 0) => B"000000000000",
      OBUFDS_GTE5_ADV_O(2 downto 0) => NLW_U0_OBUFDS_GTE5_ADV_O_UNCONNECTED(2 downto 0),
      OBUFDS_GTE5_ADV_OB(2 downto 0) => NLW_U0_OBUFDS_GTE5_ADV_OB_UNCONNECTED(2 downto 0),
      OBUFDS_GTE5_ADV_RXRECCLKSEL(5 downto 0) => B"000000",
      OBUFDS_GTE5_CEB(2 downto 0) => B"000",
      OBUFDS_GTE5_I(2 downto 0) => B"000",
      OBUFDS_GTE5_O(2 downto 0) => NLW_U0_OBUFDS_GTE5_O_UNCONNECTED(2 downto 0),
      OBUFDS_GTE5_OB(2 downto 0) => NLW_U0_OBUFDS_GTE5_OB_UNCONNECTED(2 downto 0),
      OBUFDS_GTME5_ADV_CEB(2 downto 0) => B"000",
      OBUFDS_GTME5_ADV_I(11 downto 0) => B"000000000000",
      OBUFDS_GTME5_ADV_O(2 downto 0) => NLW_U0_OBUFDS_GTME5_ADV_O_UNCONNECTED(2 downto 0),
      OBUFDS_GTME5_ADV_OB(2 downto 0) => NLW_U0_OBUFDS_GTME5_ADV_OB_UNCONNECTED(2 downto 0),
      OBUFDS_GTME5_ADV_RXRECCLKSEL(5 downto 0) => B"000000",
      OBUFDS_GTME5_CEB(2 downto 0) => B"000",
      OBUFDS_GTME5_I(2 downto 0) => B"000",
      OBUFDS_GTME5_O(2 downto 0) => NLW_U0_OBUFDS_GTME5_O_UNCONNECTED(2 downto 0),
      OBUFDS_GTME5_OB(2 downto 0) => NLW_U0_OBUFDS_GTME5_OB_UNCONNECTED(2 downto 0),
      OBUFDS_GTM_ADV_CEB(2 downto 0) => B"000",
      OBUFDS_GTM_ADV_I(11 downto 0) => B"000000000000",
      OBUFDS_GTM_ADV_O(2 downto 0) => NLW_U0_OBUFDS_GTM_ADV_O_UNCONNECTED(2 downto 0),
      OBUFDS_GTM_ADV_OB(2 downto 0) => NLW_U0_OBUFDS_GTM_ADV_OB_UNCONNECTED(2 downto 0),
      OBUFDS_GTM_CEB(2 downto 0) => B"000",
      OBUFDS_GTM_I(2 downto 0) => B"000",
      OBUFDS_GTM_O(2 downto 0) => NLW_U0_OBUFDS_GTM_O_UNCONNECTED(2 downto 0),
      OBUFDS_GTM_OB(2 downto 0) => NLW_U0_OBUFDS_GTM_OB_UNCONNECTED(2 downto 0),
      OBUF_DS_N(2 downto 0) => NLW_U0_OBUF_DS_N_UNCONNECTED(2 downto 0),
      OBUF_DS_P(2 downto 0) => NLW_U0_OBUF_DS_P_UNCONNECTED(2 downto 0),
      OBUF_IN(2 downto 0) => B"000",
      RXRECCLK_SEL_GTE3_ADV(5 downto 0) => B"000000",
      RXRECCLK_SEL_GTE4_ADV(5 downto 0) => B"000000"
    );
end STRUCTURE;
