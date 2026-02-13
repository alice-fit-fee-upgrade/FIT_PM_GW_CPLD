-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
-- Date        : Wed Jan 28 16:01:42 2026
-- Host        : KP-LABS98 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode funcsim
--               c:/Users/rsmalec/_FPGA/_PW/FIT_PM_GW_CPLD/vivado_test/afe_test.gen/sources_1/bd/design_1/ip/design_1_io_dual_adc_ddr_top_0_0/design_1_io_dual_adc_ddr_top_0_0_sim_netlist.vhdl
-- Design      : design_1_io_dual_adc_ddr_top_0_0
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xcau10p-ffvb676-2-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_io_dual_adc_ddr_top_0_0_adc_ddr_top is
  port (
    ADC_A_CLK : out STD_LOGIC;
    ADC_AA : out STD_LOGIC_VECTOR ( 13 downto 0 );
    ADC_AB : out STD_LOGIC_VECTOR ( 13 downto 0 );
    ADC_A_CLK_P : in STD_LOGIC;
    ADC_A_CLK_N : in STD_LOGIC;
    ADC_AA_P : in STD_LOGIC_VECTOR ( 6 downto 0 );
    ADC_AA_N : in STD_LOGIC_VECTOR ( 6 downto 0 );
    \adcAA_d_reg[13]_0\ : in STD_LOGIC;
    ADC_AB_P : in STD_LOGIC_VECTOR ( 6 downto 0 );
    ADC_AB_N : in STD_LOGIC_VECTOR ( 6 downto 0 )
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_io_dual_adc_ddr_top_0_0_adc_ddr_top : entity is "adc_ddr_top";
end design_1_io_dual_adc_ddr_top_0_0_adc_ddr_top;

architecture STRUCTURE of design_1_io_dual_adc_ddr_top_0_0_adc_ddr_top is
  signal \^adc_a_clk\ : STD_LOGIC;
  signal adcAA_ddr_0 : STD_LOGIC;
  signal adcAA_ddr_1 : STD_LOGIC;
  signal adcAA_ddr_2 : STD_LOGIC;
  signal adcAA_ddr_3 : STD_LOGIC;
  signal adcAA_ddr_4 : STD_LOGIC;
  signal adcAA_ddr_5 : STD_LOGIC;
  signal adcAA_ddr_6 : STD_LOGIC;
  signal adcAB_d_q1_0 : STD_LOGIC;
  signal adcAB_d_q1_1 : STD_LOGIC;
  signal adcAB_d_q1_2 : STD_LOGIC;
  signal adcAB_d_q1_3 : STD_LOGIC;
  signal adcAB_d_q1_4 : STD_LOGIC;
  signal adcAB_d_q1_5 : STD_LOGIC;
  signal adcAB_d_q1_6 : STD_LOGIC;
  signal adcAB_d_q2_0 : STD_LOGIC;
  signal adcAB_d_q2_1 : STD_LOGIC;
  signal adcAB_d_q2_2 : STD_LOGIC;
  signal adcAB_d_q2_3 : STD_LOGIC;
  signal adcAB_d_q2_4 : STD_LOGIC;
  signal adcAB_d_q2_5 : STD_LOGIC;
  signal adcAB_d_q2_6 : STD_LOGIC;
  signal adcAB_ddr_0 : STD_LOGIC;
  signal adcAB_ddr_1 : STD_LOGIC;
  signal adcAB_ddr_2 : STD_LOGIC;
  signal adcAB_ddr_3 : STD_LOGIC;
  signal adcAB_ddr_4 : STD_LOGIC;
  signal adcAB_ddr_5 : STD_LOGIC;
  signal adcAB_ddr_6 : STD_LOGIC;
  signal adcA_clk_buff : STD_LOGIC;
  signal p_7_out : STD_LOGIC_VECTOR ( 13 downto 0 );
  attribute CAPACITANCE : string;
  attribute CAPACITANCE of \adcAA_ddr_IN[0].adcAA_ibufds\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE : string;
  attribute IBUF_DELAY_VALUE of \adcAA_ddr_IN[0].adcAA_ibufds\ : label is "0";
  attribute IFD_DELAY_VALUE : string;
  attribute IFD_DELAY_VALUE of \adcAA_ddr_IN[0].adcAA_ibufds\ : label is "AUTO";
  attribute box_type : string;
  attribute box_type of \adcAA_ddr_IN[0].adcAA_ibufds\ : label is "PRIMITIVE";
  attribute box_type of \adcAA_ddr_IN[0].adcAA_iddre1\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \adcAA_ddr_IN[1].adcAA_ibufds\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \adcAA_ddr_IN[1].adcAA_ibufds\ : label is "0";
  attribute IFD_DELAY_VALUE of \adcAA_ddr_IN[1].adcAA_ibufds\ : label is "AUTO";
  attribute box_type of \adcAA_ddr_IN[1].adcAA_ibufds\ : label is "PRIMITIVE";
  attribute box_type of \adcAA_ddr_IN[1].adcAA_iddre1\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \adcAA_ddr_IN[2].adcAA_ibufds\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \adcAA_ddr_IN[2].adcAA_ibufds\ : label is "0";
  attribute IFD_DELAY_VALUE of \adcAA_ddr_IN[2].adcAA_ibufds\ : label is "AUTO";
  attribute box_type of \adcAA_ddr_IN[2].adcAA_ibufds\ : label is "PRIMITIVE";
  attribute box_type of \adcAA_ddr_IN[2].adcAA_iddre1\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \adcAA_ddr_IN[3].adcAA_ibufds\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \adcAA_ddr_IN[3].adcAA_ibufds\ : label is "0";
  attribute IFD_DELAY_VALUE of \adcAA_ddr_IN[3].adcAA_ibufds\ : label is "AUTO";
  attribute box_type of \adcAA_ddr_IN[3].adcAA_ibufds\ : label is "PRIMITIVE";
  attribute box_type of \adcAA_ddr_IN[3].adcAA_iddre1\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \adcAA_ddr_IN[4].adcAA_ibufds\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \adcAA_ddr_IN[4].adcAA_ibufds\ : label is "0";
  attribute IFD_DELAY_VALUE of \adcAA_ddr_IN[4].adcAA_ibufds\ : label is "AUTO";
  attribute box_type of \adcAA_ddr_IN[4].adcAA_ibufds\ : label is "PRIMITIVE";
  attribute box_type of \adcAA_ddr_IN[4].adcAA_iddre1\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \adcAA_ddr_IN[5].adcAA_ibufds\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \adcAA_ddr_IN[5].adcAA_ibufds\ : label is "0";
  attribute IFD_DELAY_VALUE of \adcAA_ddr_IN[5].adcAA_ibufds\ : label is "AUTO";
  attribute box_type of \adcAA_ddr_IN[5].adcAA_ibufds\ : label is "PRIMITIVE";
  attribute box_type of \adcAA_ddr_IN[5].adcAA_iddre1\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \adcAA_ddr_IN[6].adcAA_ibufds\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \adcAA_ddr_IN[6].adcAA_ibufds\ : label is "0";
  attribute IFD_DELAY_VALUE of \adcAA_ddr_IN[6].adcAA_ibufds\ : label is "AUTO";
  attribute box_type of \adcAA_ddr_IN[6].adcAA_ibufds\ : label is "PRIMITIVE";
  attribute box_type of \adcAA_ddr_IN[6].adcAA_iddre1\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of adcA_clk_bufg : label is "BUFG";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of adcA_clk_bufg : label is "VCC:CE";
  attribute box_type of adcA_clk_bufg : label is "PRIMITIVE";
  attribute CAPACITANCE of adcA_clk_ibufds : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of adcA_clk_ibufds : label is "0";
  attribute IFD_DELAY_VALUE of adcA_clk_ibufds : label is "AUTO";
  attribute box_type of adcA_clk_ibufds : label is "PRIMITIVE";
  attribute CAPACITANCE of \adcA_ddr_IN[0].adcAB_ibufds\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \adcA_ddr_IN[0].adcAB_ibufds\ : label is "0";
  attribute IFD_DELAY_VALUE of \adcA_ddr_IN[0].adcAB_ibufds\ : label is "AUTO";
  attribute box_type of \adcA_ddr_IN[0].adcAB_ibufds\ : label is "PRIMITIVE";
  attribute box_type of \adcA_ddr_IN[0].adcAB_iddre1\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \adcA_ddr_IN[1].adcAB_ibufds\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \adcA_ddr_IN[1].adcAB_ibufds\ : label is "0";
  attribute IFD_DELAY_VALUE of \adcA_ddr_IN[1].adcAB_ibufds\ : label is "AUTO";
  attribute box_type of \adcA_ddr_IN[1].adcAB_ibufds\ : label is "PRIMITIVE";
  attribute box_type of \adcA_ddr_IN[1].adcAB_iddre1\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \adcA_ddr_IN[2].adcAB_ibufds\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \adcA_ddr_IN[2].adcAB_ibufds\ : label is "0";
  attribute IFD_DELAY_VALUE of \adcA_ddr_IN[2].adcAB_ibufds\ : label is "AUTO";
  attribute box_type of \adcA_ddr_IN[2].adcAB_ibufds\ : label is "PRIMITIVE";
  attribute box_type of \adcA_ddr_IN[2].adcAB_iddre1\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \adcA_ddr_IN[3].adcAB_ibufds\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \adcA_ddr_IN[3].adcAB_ibufds\ : label is "0";
  attribute IFD_DELAY_VALUE of \adcA_ddr_IN[3].adcAB_ibufds\ : label is "AUTO";
  attribute box_type of \adcA_ddr_IN[3].adcAB_ibufds\ : label is "PRIMITIVE";
  attribute box_type of \adcA_ddr_IN[3].adcAB_iddre1\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \adcA_ddr_IN[4].adcAB_ibufds\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \adcA_ddr_IN[4].adcAB_ibufds\ : label is "0";
  attribute IFD_DELAY_VALUE of \adcA_ddr_IN[4].adcAB_ibufds\ : label is "AUTO";
  attribute box_type of \adcA_ddr_IN[4].adcAB_ibufds\ : label is "PRIMITIVE";
  attribute box_type of \adcA_ddr_IN[4].adcAB_iddre1\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \adcA_ddr_IN[5].adcAB_ibufds\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \adcA_ddr_IN[5].adcAB_ibufds\ : label is "0";
  attribute IFD_DELAY_VALUE of \adcA_ddr_IN[5].adcAB_ibufds\ : label is "AUTO";
  attribute box_type of \adcA_ddr_IN[5].adcAB_ibufds\ : label is "PRIMITIVE";
  attribute box_type of \adcA_ddr_IN[5].adcAB_iddre1\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \adcA_ddr_IN[6].adcAB_ibufds\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \adcA_ddr_IN[6].adcAB_ibufds\ : label is "0";
  attribute IFD_DELAY_VALUE of \adcA_ddr_IN[6].adcAB_ibufds\ : label is "AUTO";
  attribute box_type of \adcA_ddr_IN[6].adcAB_ibufds\ : label is "PRIMITIVE";
  attribute box_type of \adcA_ddr_IN[6].adcAB_iddre1\ : label is "PRIMITIVE";
begin
  ADC_A_CLK <= \^adc_a_clk\;
\adcAA_d_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_a_clk\,
      CE => '1',
      CLR => \adcAA_d_reg[13]_0\,
      D => p_7_out(0),
      Q => ADC_AA(0)
    );
\adcAA_d_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_a_clk\,
      CE => '1',
      CLR => \adcAA_d_reg[13]_0\,
      D => p_7_out(10),
      Q => ADC_AA(10)
    );
\adcAA_d_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_a_clk\,
      CE => '1',
      CLR => \adcAA_d_reg[13]_0\,
      D => p_7_out(11),
      Q => ADC_AA(11)
    );
\adcAA_d_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_a_clk\,
      CE => '1',
      CLR => \adcAA_d_reg[13]_0\,
      D => p_7_out(12),
      Q => ADC_AA(12)
    );
\adcAA_d_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_a_clk\,
      CE => '1',
      CLR => \adcAA_d_reg[13]_0\,
      D => p_7_out(13),
      Q => ADC_AA(13)
    );
\adcAA_d_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_a_clk\,
      CE => '1',
      CLR => \adcAA_d_reg[13]_0\,
      D => p_7_out(1),
      Q => ADC_AA(1)
    );
\adcAA_d_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_a_clk\,
      CE => '1',
      CLR => \adcAA_d_reg[13]_0\,
      D => p_7_out(2),
      Q => ADC_AA(2)
    );
\adcAA_d_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_a_clk\,
      CE => '1',
      CLR => \adcAA_d_reg[13]_0\,
      D => p_7_out(3),
      Q => ADC_AA(3)
    );
\adcAA_d_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_a_clk\,
      CE => '1',
      CLR => \adcAA_d_reg[13]_0\,
      D => p_7_out(4),
      Q => ADC_AA(4)
    );
\adcAA_d_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_a_clk\,
      CE => '1',
      CLR => \adcAA_d_reg[13]_0\,
      D => p_7_out(5),
      Q => ADC_AA(5)
    );
\adcAA_d_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_a_clk\,
      CE => '1',
      CLR => \adcAA_d_reg[13]_0\,
      D => p_7_out(6),
      Q => ADC_AA(6)
    );
\adcAA_d_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_a_clk\,
      CE => '1',
      CLR => \adcAA_d_reg[13]_0\,
      D => p_7_out(7),
      Q => ADC_AA(7)
    );
\adcAA_d_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_a_clk\,
      CE => '1',
      CLR => \adcAA_d_reg[13]_0\,
      D => p_7_out(8),
      Q => ADC_AA(8)
    );
\adcAA_d_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_a_clk\,
      CE => '1',
      CLR => \adcAA_d_reg[13]_0\,
      D => p_7_out(9),
      Q => ADC_AA(9)
    );
\adcAA_ddr_IN[0].adcAA_ibufds\: unisim.vcomponents.IBUFDS
    generic map(
      DIFF_TERM => false,
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => ADC_AA_P(0),
      IB => ADC_AA_N(0),
      O => adcAA_ddr_0
    );
\adcAA_ddr_IN[0].adcAA_iddre1\: unisim.vcomponents.IDDRE1
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      IS_CB_INVERTED => '1',
      IS_C_INVERTED => '0'
    )
        port map (
      C => \^adc_a_clk\,
      CB => \^adc_a_clk\,
      D => adcAA_ddr_0,
      Q1 => p_7_out(0),
      Q2 => p_7_out(1),
      R => \adcAA_d_reg[13]_0\
    );
\adcAA_ddr_IN[1].adcAA_ibufds\: unisim.vcomponents.IBUFDS
    generic map(
      DIFF_TERM => false,
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => ADC_AA_P(1),
      IB => ADC_AA_N(1),
      O => adcAA_ddr_1
    );
\adcAA_ddr_IN[1].adcAA_iddre1\: unisim.vcomponents.IDDRE1
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      IS_CB_INVERTED => '1',
      IS_C_INVERTED => '0'
    )
        port map (
      C => \^adc_a_clk\,
      CB => \^adc_a_clk\,
      D => adcAA_ddr_1,
      Q1 => p_7_out(2),
      Q2 => p_7_out(3),
      R => \adcAA_d_reg[13]_0\
    );
\adcAA_ddr_IN[2].adcAA_ibufds\: unisim.vcomponents.IBUFDS
    generic map(
      DIFF_TERM => false,
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => ADC_AA_P(2),
      IB => ADC_AA_N(2),
      O => adcAA_ddr_2
    );
\adcAA_ddr_IN[2].adcAA_iddre1\: unisim.vcomponents.IDDRE1
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      IS_CB_INVERTED => '1',
      IS_C_INVERTED => '0'
    )
        port map (
      C => \^adc_a_clk\,
      CB => \^adc_a_clk\,
      D => adcAA_ddr_2,
      Q1 => p_7_out(4),
      Q2 => p_7_out(5),
      R => \adcAA_d_reg[13]_0\
    );
\adcAA_ddr_IN[3].adcAA_ibufds\: unisim.vcomponents.IBUFDS
    generic map(
      DIFF_TERM => false,
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => ADC_AA_P(3),
      IB => ADC_AA_N(3),
      O => adcAA_ddr_3
    );
\adcAA_ddr_IN[3].adcAA_iddre1\: unisim.vcomponents.IDDRE1
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      IS_CB_INVERTED => '1',
      IS_C_INVERTED => '0'
    )
        port map (
      C => \^adc_a_clk\,
      CB => \^adc_a_clk\,
      D => adcAA_ddr_3,
      Q1 => p_7_out(6),
      Q2 => p_7_out(7),
      R => \adcAA_d_reg[13]_0\
    );
\adcAA_ddr_IN[4].adcAA_ibufds\: unisim.vcomponents.IBUFDS
    generic map(
      DIFF_TERM => false,
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => ADC_AA_P(4),
      IB => ADC_AA_N(4),
      O => adcAA_ddr_4
    );
\adcAA_ddr_IN[4].adcAA_iddre1\: unisim.vcomponents.IDDRE1
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      IS_CB_INVERTED => '1',
      IS_C_INVERTED => '0'
    )
        port map (
      C => \^adc_a_clk\,
      CB => \^adc_a_clk\,
      D => adcAA_ddr_4,
      Q1 => p_7_out(8),
      Q2 => p_7_out(9),
      R => \adcAA_d_reg[13]_0\
    );
\adcAA_ddr_IN[5].adcAA_ibufds\: unisim.vcomponents.IBUFDS
    generic map(
      DIFF_TERM => false,
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => ADC_AA_P(5),
      IB => ADC_AA_N(5),
      O => adcAA_ddr_5
    );
\adcAA_ddr_IN[5].adcAA_iddre1\: unisim.vcomponents.IDDRE1
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      IS_CB_INVERTED => '1',
      IS_C_INVERTED => '0'
    )
        port map (
      C => \^adc_a_clk\,
      CB => \^adc_a_clk\,
      D => adcAA_ddr_5,
      Q1 => p_7_out(10),
      Q2 => p_7_out(11),
      R => \adcAA_d_reg[13]_0\
    );
\adcAA_ddr_IN[6].adcAA_ibufds\: unisim.vcomponents.IBUFDS
    generic map(
      DIFF_TERM => false,
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => ADC_AA_P(6),
      IB => ADC_AA_N(6),
      O => adcAA_ddr_6
    );
\adcAA_ddr_IN[6].adcAA_iddre1\: unisim.vcomponents.IDDRE1
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      IS_CB_INVERTED => '1',
      IS_C_INVERTED => '0'
    )
        port map (
      C => \^adc_a_clk\,
      CB => \^adc_a_clk\,
      D => adcAA_ddr_6,
      Q1 => p_7_out(12),
      Q2 => p_7_out(13),
      R => \adcAA_d_reg[13]_0\
    );
\adcAB_d_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_a_clk\,
      CE => '1',
      CLR => \adcAA_d_reg[13]_0\,
      D => adcAB_d_q1_0,
      Q => ADC_AB(0)
    );
\adcAB_d_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_a_clk\,
      CE => '1',
      CLR => \adcAA_d_reg[13]_0\,
      D => adcAB_d_q1_5,
      Q => ADC_AB(10)
    );
\adcAB_d_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_a_clk\,
      CE => '1',
      CLR => \adcAA_d_reg[13]_0\,
      D => adcAB_d_q2_5,
      Q => ADC_AB(11)
    );
\adcAB_d_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_a_clk\,
      CE => '1',
      CLR => \adcAA_d_reg[13]_0\,
      D => adcAB_d_q1_6,
      Q => ADC_AB(12)
    );
\adcAB_d_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_a_clk\,
      CE => '1',
      CLR => \adcAA_d_reg[13]_0\,
      D => adcAB_d_q2_6,
      Q => ADC_AB(13)
    );
\adcAB_d_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_a_clk\,
      CE => '1',
      CLR => \adcAA_d_reg[13]_0\,
      D => adcAB_d_q2_0,
      Q => ADC_AB(1)
    );
\adcAB_d_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_a_clk\,
      CE => '1',
      CLR => \adcAA_d_reg[13]_0\,
      D => adcAB_d_q1_1,
      Q => ADC_AB(2)
    );
\adcAB_d_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_a_clk\,
      CE => '1',
      CLR => \adcAA_d_reg[13]_0\,
      D => adcAB_d_q2_1,
      Q => ADC_AB(3)
    );
\adcAB_d_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_a_clk\,
      CE => '1',
      CLR => \adcAA_d_reg[13]_0\,
      D => adcAB_d_q1_2,
      Q => ADC_AB(4)
    );
\adcAB_d_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_a_clk\,
      CE => '1',
      CLR => \adcAA_d_reg[13]_0\,
      D => adcAB_d_q2_2,
      Q => ADC_AB(5)
    );
\adcAB_d_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_a_clk\,
      CE => '1',
      CLR => \adcAA_d_reg[13]_0\,
      D => adcAB_d_q1_3,
      Q => ADC_AB(6)
    );
\adcAB_d_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_a_clk\,
      CE => '1',
      CLR => \adcAA_d_reg[13]_0\,
      D => adcAB_d_q2_3,
      Q => ADC_AB(7)
    );
\adcAB_d_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_a_clk\,
      CE => '1',
      CLR => \adcAA_d_reg[13]_0\,
      D => adcAB_d_q1_4,
      Q => ADC_AB(8)
    );
\adcAB_d_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_a_clk\,
      CE => '1',
      CLR => \adcAA_d_reg[13]_0\,
      D => adcAB_d_q2_4,
      Q => ADC_AB(9)
    );
adcA_clk_bufg: unisim.vcomponents.BUFGCE
    generic map(
      CE_TYPE => "ASYNC",
      SIM_DEVICE => "ULTRASCALE_PLUS"
    )
        port map (
      CE => '1',
      I => adcA_clk_buff,
      O => \^adc_a_clk\
    );
adcA_clk_ibufds: unisim.vcomponents.IBUFDS
    generic map(
      DIFF_TERM => false,
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => ADC_A_CLK_P,
      IB => ADC_A_CLK_N,
      O => adcA_clk_buff
    );
\adcA_ddr_IN[0].adcAB_ibufds\: unisim.vcomponents.IBUFDS
    generic map(
      DIFF_TERM => false,
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => ADC_AB_P(0),
      IB => ADC_AB_N(0),
      O => adcAB_ddr_0
    );
\adcA_ddr_IN[0].adcAB_iddre1\: unisim.vcomponents.IDDRE1
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      IS_CB_INVERTED => '1',
      IS_C_INVERTED => '0'
    )
        port map (
      C => \^adc_a_clk\,
      CB => \^adc_a_clk\,
      D => adcAB_ddr_0,
      Q1 => adcAB_d_q1_0,
      Q2 => adcAB_d_q2_0,
      R => \adcAA_d_reg[13]_0\
    );
\adcA_ddr_IN[1].adcAB_ibufds\: unisim.vcomponents.IBUFDS
    generic map(
      DIFF_TERM => false,
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => ADC_AB_P(1),
      IB => ADC_AB_N(1),
      O => adcAB_ddr_1
    );
\adcA_ddr_IN[1].adcAB_iddre1\: unisim.vcomponents.IDDRE1
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      IS_CB_INVERTED => '1',
      IS_C_INVERTED => '0'
    )
        port map (
      C => \^adc_a_clk\,
      CB => \^adc_a_clk\,
      D => adcAB_ddr_1,
      Q1 => adcAB_d_q1_1,
      Q2 => adcAB_d_q2_1,
      R => \adcAA_d_reg[13]_0\
    );
\adcA_ddr_IN[2].adcAB_ibufds\: unisim.vcomponents.IBUFDS
    generic map(
      DIFF_TERM => false,
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => ADC_AB_P(2),
      IB => ADC_AB_N(2),
      O => adcAB_ddr_2
    );
\adcA_ddr_IN[2].adcAB_iddre1\: unisim.vcomponents.IDDRE1
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      IS_CB_INVERTED => '1',
      IS_C_INVERTED => '0'
    )
        port map (
      C => \^adc_a_clk\,
      CB => \^adc_a_clk\,
      D => adcAB_ddr_2,
      Q1 => adcAB_d_q1_2,
      Q2 => adcAB_d_q2_2,
      R => \adcAA_d_reg[13]_0\
    );
\adcA_ddr_IN[3].adcAB_ibufds\: unisim.vcomponents.IBUFDS
    generic map(
      DIFF_TERM => false,
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => ADC_AB_P(3),
      IB => ADC_AB_N(3),
      O => adcAB_ddr_3
    );
\adcA_ddr_IN[3].adcAB_iddre1\: unisim.vcomponents.IDDRE1
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      IS_CB_INVERTED => '1',
      IS_C_INVERTED => '0'
    )
        port map (
      C => \^adc_a_clk\,
      CB => \^adc_a_clk\,
      D => adcAB_ddr_3,
      Q1 => adcAB_d_q1_3,
      Q2 => adcAB_d_q2_3,
      R => \adcAA_d_reg[13]_0\
    );
\adcA_ddr_IN[4].adcAB_ibufds\: unisim.vcomponents.IBUFDS
    generic map(
      DIFF_TERM => false,
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => ADC_AB_P(4),
      IB => ADC_AB_N(4),
      O => adcAB_ddr_4
    );
\adcA_ddr_IN[4].adcAB_iddre1\: unisim.vcomponents.IDDRE1
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      IS_CB_INVERTED => '1',
      IS_C_INVERTED => '0'
    )
        port map (
      C => \^adc_a_clk\,
      CB => \^adc_a_clk\,
      D => adcAB_ddr_4,
      Q1 => adcAB_d_q1_4,
      Q2 => adcAB_d_q2_4,
      R => \adcAA_d_reg[13]_0\
    );
\adcA_ddr_IN[5].adcAB_ibufds\: unisim.vcomponents.IBUFDS
    generic map(
      DIFF_TERM => false,
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => ADC_AB_P(5),
      IB => ADC_AB_N(5),
      O => adcAB_ddr_5
    );
\adcA_ddr_IN[5].adcAB_iddre1\: unisim.vcomponents.IDDRE1
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      IS_CB_INVERTED => '1',
      IS_C_INVERTED => '0'
    )
        port map (
      C => \^adc_a_clk\,
      CB => \^adc_a_clk\,
      D => adcAB_ddr_5,
      Q1 => adcAB_d_q1_5,
      Q2 => adcAB_d_q2_5,
      R => \adcAA_d_reg[13]_0\
    );
\adcA_ddr_IN[6].adcAB_ibufds\: unisim.vcomponents.IBUFDS
    generic map(
      DIFF_TERM => false,
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => ADC_AB_P(6),
      IB => ADC_AB_N(6),
      O => adcAB_ddr_6
    );
\adcA_ddr_IN[6].adcAB_iddre1\: unisim.vcomponents.IDDRE1
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      IS_CB_INVERTED => '1',
      IS_C_INVERTED => '0'
    )
        port map (
      C => \^adc_a_clk\,
      CB => \^adc_a_clk\,
      D => adcAB_ddr_6,
      Q1 => adcAB_d_q1_6,
      Q2 => adcAB_d_q2_6,
      R => \adcAA_d_reg[13]_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_io_dual_adc_ddr_top_0_0_adc_ddr_top_0 is
  port (
    ADC_B_CLK : out STD_LOGIC;
    rstn_0 : out STD_LOGIC;
    ADC_BA : out STD_LOGIC_VECTOR ( 13 downto 0 );
    ADC_BB : out STD_LOGIC_VECTOR ( 13 downto 0 );
    ADC_B_CLK_P : in STD_LOGIC;
    ADC_B_CLK_N : in STD_LOGIC;
    ADC_BA_P : in STD_LOGIC_VECTOR ( 6 downto 0 );
    ADC_BA_N : in STD_LOGIC_VECTOR ( 6 downto 0 );
    ADC_BB_P : in STD_LOGIC_VECTOR ( 6 downto 0 );
    ADC_BB_N : in STD_LOGIC_VECTOR ( 6 downto 0 );
    rstn : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_io_dual_adc_ddr_top_0_0_adc_ddr_top_0 : entity is "adc_ddr_top";
end design_1_io_dual_adc_ddr_top_0_0_adc_ddr_top_0;

architecture STRUCTURE of design_1_io_dual_adc_ddr_top_0_0_adc_ddr_top_0 is
  signal \^adc_b_clk\ : STD_LOGIC;
  signal adcAA_ddr_0 : STD_LOGIC;
  signal adcAA_ddr_1 : STD_LOGIC;
  signal adcAA_ddr_2 : STD_LOGIC;
  signal adcAA_ddr_3 : STD_LOGIC;
  signal adcAA_ddr_4 : STD_LOGIC;
  signal adcAA_ddr_5 : STD_LOGIC;
  signal adcAA_ddr_6 : STD_LOGIC;
  signal adcAB_d_q1_0 : STD_LOGIC;
  signal adcAB_d_q1_1 : STD_LOGIC;
  signal adcAB_d_q1_2 : STD_LOGIC;
  signal adcAB_d_q1_3 : STD_LOGIC;
  signal adcAB_d_q1_4 : STD_LOGIC;
  signal adcAB_d_q1_5 : STD_LOGIC;
  signal adcAB_d_q1_6 : STD_LOGIC;
  signal adcAB_d_q2_0 : STD_LOGIC;
  signal adcAB_d_q2_1 : STD_LOGIC;
  signal adcAB_d_q2_2 : STD_LOGIC;
  signal adcAB_d_q2_3 : STD_LOGIC;
  signal adcAB_d_q2_4 : STD_LOGIC;
  signal adcAB_d_q2_5 : STD_LOGIC;
  signal adcAB_d_q2_6 : STD_LOGIC;
  signal adcAB_ddr_0 : STD_LOGIC;
  signal adcAB_ddr_1 : STD_LOGIC;
  signal adcAB_ddr_2 : STD_LOGIC;
  signal adcAB_ddr_3 : STD_LOGIC;
  signal adcAB_ddr_4 : STD_LOGIC;
  signal adcAB_ddr_5 : STD_LOGIC;
  signal adcAB_ddr_6 : STD_LOGIC;
  signal adcA_clk_buff : STD_LOGIC;
  signal p_7_out : STD_LOGIC_VECTOR ( 13 downto 0 );
  signal \^rstn_0\ : STD_LOGIC;
  attribute CAPACITANCE : string;
  attribute CAPACITANCE of \adcAA_ddr_IN[0].adcAA_ibufds\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE : string;
  attribute IBUF_DELAY_VALUE of \adcAA_ddr_IN[0].adcAA_ibufds\ : label is "0";
  attribute IFD_DELAY_VALUE : string;
  attribute IFD_DELAY_VALUE of \adcAA_ddr_IN[0].adcAA_ibufds\ : label is "AUTO";
  attribute box_type : string;
  attribute box_type of \adcAA_ddr_IN[0].adcAA_ibufds\ : label is "PRIMITIVE";
  attribute box_type of \adcAA_ddr_IN[0].adcAA_iddre1\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \adcAA_ddr_IN[1].adcAA_ibufds\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \adcAA_ddr_IN[1].adcAA_ibufds\ : label is "0";
  attribute IFD_DELAY_VALUE of \adcAA_ddr_IN[1].adcAA_ibufds\ : label is "AUTO";
  attribute box_type of \adcAA_ddr_IN[1].adcAA_ibufds\ : label is "PRIMITIVE";
  attribute box_type of \adcAA_ddr_IN[1].adcAA_iddre1\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \adcAA_ddr_IN[2].adcAA_ibufds\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \adcAA_ddr_IN[2].adcAA_ibufds\ : label is "0";
  attribute IFD_DELAY_VALUE of \adcAA_ddr_IN[2].adcAA_ibufds\ : label is "AUTO";
  attribute box_type of \adcAA_ddr_IN[2].adcAA_ibufds\ : label is "PRIMITIVE";
  attribute box_type of \adcAA_ddr_IN[2].adcAA_iddre1\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \adcAA_ddr_IN[3].adcAA_ibufds\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \adcAA_ddr_IN[3].adcAA_ibufds\ : label is "0";
  attribute IFD_DELAY_VALUE of \adcAA_ddr_IN[3].adcAA_ibufds\ : label is "AUTO";
  attribute box_type of \adcAA_ddr_IN[3].adcAA_ibufds\ : label is "PRIMITIVE";
  attribute box_type of \adcAA_ddr_IN[3].adcAA_iddre1\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \adcAA_ddr_IN[4].adcAA_ibufds\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \adcAA_ddr_IN[4].adcAA_ibufds\ : label is "0";
  attribute IFD_DELAY_VALUE of \adcAA_ddr_IN[4].adcAA_ibufds\ : label is "AUTO";
  attribute box_type of \adcAA_ddr_IN[4].adcAA_ibufds\ : label is "PRIMITIVE";
  attribute box_type of \adcAA_ddr_IN[4].adcAA_iddre1\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \adcAA_ddr_IN[5].adcAA_ibufds\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \adcAA_ddr_IN[5].adcAA_ibufds\ : label is "0";
  attribute IFD_DELAY_VALUE of \adcAA_ddr_IN[5].adcAA_ibufds\ : label is "AUTO";
  attribute box_type of \adcAA_ddr_IN[5].adcAA_ibufds\ : label is "PRIMITIVE";
  attribute box_type of \adcAA_ddr_IN[5].adcAA_iddre1\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \adcAA_ddr_IN[6].adcAA_ibufds\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \adcAA_ddr_IN[6].adcAA_ibufds\ : label is "0";
  attribute IFD_DELAY_VALUE of \adcAA_ddr_IN[6].adcAA_ibufds\ : label is "AUTO";
  attribute box_type of \adcAA_ddr_IN[6].adcAA_ibufds\ : label is "PRIMITIVE";
  attribute box_type of \adcAA_ddr_IN[6].adcAA_iddre1\ : label is "PRIMITIVE";
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of adcA_clk_bufg : label is "BUFG";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of adcA_clk_bufg : label is "VCC:CE";
  attribute box_type of adcA_clk_bufg : label is "PRIMITIVE";
  attribute CAPACITANCE of adcA_clk_ibufds : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of adcA_clk_ibufds : label is "0";
  attribute IFD_DELAY_VALUE of adcA_clk_ibufds : label is "AUTO";
  attribute box_type of adcA_clk_ibufds : label is "PRIMITIVE";
  attribute CAPACITANCE of \adcA_ddr_IN[0].adcAB_ibufds\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \adcA_ddr_IN[0].adcAB_ibufds\ : label is "0";
  attribute IFD_DELAY_VALUE of \adcA_ddr_IN[0].adcAB_ibufds\ : label is "AUTO";
  attribute box_type of \adcA_ddr_IN[0].adcAB_ibufds\ : label is "PRIMITIVE";
  attribute box_type of \adcA_ddr_IN[0].adcAB_iddre1\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \adcA_ddr_IN[1].adcAB_ibufds\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \adcA_ddr_IN[1].adcAB_ibufds\ : label is "0";
  attribute IFD_DELAY_VALUE of \adcA_ddr_IN[1].adcAB_ibufds\ : label is "AUTO";
  attribute box_type of \adcA_ddr_IN[1].adcAB_ibufds\ : label is "PRIMITIVE";
  attribute box_type of \adcA_ddr_IN[1].adcAB_iddre1\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \adcA_ddr_IN[2].adcAB_ibufds\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \adcA_ddr_IN[2].adcAB_ibufds\ : label is "0";
  attribute IFD_DELAY_VALUE of \adcA_ddr_IN[2].adcAB_ibufds\ : label is "AUTO";
  attribute box_type of \adcA_ddr_IN[2].adcAB_ibufds\ : label is "PRIMITIVE";
  attribute box_type of \adcA_ddr_IN[2].adcAB_iddre1\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \adcA_ddr_IN[3].adcAB_ibufds\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \adcA_ddr_IN[3].adcAB_ibufds\ : label is "0";
  attribute IFD_DELAY_VALUE of \adcA_ddr_IN[3].adcAB_ibufds\ : label is "AUTO";
  attribute box_type of \adcA_ddr_IN[3].adcAB_ibufds\ : label is "PRIMITIVE";
  attribute box_type of \adcA_ddr_IN[3].adcAB_iddre1\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \adcA_ddr_IN[4].adcAB_ibufds\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \adcA_ddr_IN[4].adcAB_ibufds\ : label is "0";
  attribute IFD_DELAY_VALUE of \adcA_ddr_IN[4].adcAB_ibufds\ : label is "AUTO";
  attribute box_type of \adcA_ddr_IN[4].adcAB_ibufds\ : label is "PRIMITIVE";
  attribute box_type of \adcA_ddr_IN[4].adcAB_iddre1\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \adcA_ddr_IN[5].adcAB_ibufds\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \adcA_ddr_IN[5].adcAB_ibufds\ : label is "0";
  attribute IFD_DELAY_VALUE of \adcA_ddr_IN[5].adcAB_ibufds\ : label is "AUTO";
  attribute box_type of \adcA_ddr_IN[5].adcAB_ibufds\ : label is "PRIMITIVE";
  attribute box_type of \adcA_ddr_IN[5].adcAB_iddre1\ : label is "PRIMITIVE";
  attribute CAPACITANCE of \adcA_ddr_IN[6].adcAB_ibufds\ : label is "DONT_CARE";
  attribute IBUF_DELAY_VALUE of \adcA_ddr_IN[6].adcAB_ibufds\ : label is "0";
  attribute IFD_DELAY_VALUE of \adcA_ddr_IN[6].adcAB_ibufds\ : label is "AUTO";
  attribute box_type of \adcA_ddr_IN[6].adcAB_ibufds\ : label is "PRIMITIVE";
  attribute box_type of \adcA_ddr_IN[6].adcAB_iddre1\ : label is "PRIMITIVE";
begin
  ADC_B_CLK <= \^adc_b_clk\;
  rstn_0 <= \^rstn_0\;
\adcAA_d[13]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => rstn,
      O => \^rstn_0\
    );
\adcAA_d_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_b_clk\,
      CE => '1',
      CLR => \^rstn_0\,
      D => p_7_out(0),
      Q => ADC_BA(0)
    );
\adcAA_d_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_b_clk\,
      CE => '1',
      CLR => \^rstn_0\,
      D => p_7_out(10),
      Q => ADC_BA(10)
    );
\adcAA_d_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_b_clk\,
      CE => '1',
      CLR => \^rstn_0\,
      D => p_7_out(11),
      Q => ADC_BA(11)
    );
\adcAA_d_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_b_clk\,
      CE => '1',
      CLR => \^rstn_0\,
      D => p_7_out(12),
      Q => ADC_BA(12)
    );
\adcAA_d_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_b_clk\,
      CE => '1',
      CLR => \^rstn_0\,
      D => p_7_out(13),
      Q => ADC_BA(13)
    );
\adcAA_d_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_b_clk\,
      CE => '1',
      CLR => \^rstn_0\,
      D => p_7_out(1),
      Q => ADC_BA(1)
    );
\adcAA_d_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_b_clk\,
      CE => '1',
      CLR => \^rstn_0\,
      D => p_7_out(2),
      Q => ADC_BA(2)
    );
\adcAA_d_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_b_clk\,
      CE => '1',
      CLR => \^rstn_0\,
      D => p_7_out(3),
      Q => ADC_BA(3)
    );
\adcAA_d_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_b_clk\,
      CE => '1',
      CLR => \^rstn_0\,
      D => p_7_out(4),
      Q => ADC_BA(4)
    );
\adcAA_d_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_b_clk\,
      CE => '1',
      CLR => \^rstn_0\,
      D => p_7_out(5),
      Q => ADC_BA(5)
    );
\adcAA_d_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_b_clk\,
      CE => '1',
      CLR => \^rstn_0\,
      D => p_7_out(6),
      Q => ADC_BA(6)
    );
\adcAA_d_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_b_clk\,
      CE => '1',
      CLR => \^rstn_0\,
      D => p_7_out(7),
      Q => ADC_BA(7)
    );
\adcAA_d_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_b_clk\,
      CE => '1',
      CLR => \^rstn_0\,
      D => p_7_out(8),
      Q => ADC_BA(8)
    );
\adcAA_d_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_b_clk\,
      CE => '1',
      CLR => \^rstn_0\,
      D => p_7_out(9),
      Q => ADC_BA(9)
    );
\adcAA_ddr_IN[0].adcAA_ibufds\: unisim.vcomponents.IBUFDS
    generic map(
      DIFF_TERM => false,
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => ADC_BA_P(0),
      IB => ADC_BA_N(0),
      O => adcAA_ddr_0
    );
\adcAA_ddr_IN[0].adcAA_iddre1\: unisim.vcomponents.IDDRE1
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      IS_CB_INVERTED => '1',
      IS_C_INVERTED => '0'
    )
        port map (
      C => \^adc_b_clk\,
      CB => \^adc_b_clk\,
      D => adcAA_ddr_0,
      Q1 => p_7_out(0),
      Q2 => p_7_out(1),
      R => \^rstn_0\
    );
\adcAA_ddr_IN[1].adcAA_ibufds\: unisim.vcomponents.IBUFDS
    generic map(
      DIFF_TERM => false,
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => ADC_BA_P(1),
      IB => ADC_BA_N(1),
      O => adcAA_ddr_1
    );
\adcAA_ddr_IN[1].adcAA_iddre1\: unisim.vcomponents.IDDRE1
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      IS_CB_INVERTED => '1',
      IS_C_INVERTED => '0'
    )
        port map (
      C => \^adc_b_clk\,
      CB => \^adc_b_clk\,
      D => adcAA_ddr_1,
      Q1 => p_7_out(2),
      Q2 => p_7_out(3),
      R => \^rstn_0\
    );
\adcAA_ddr_IN[2].adcAA_ibufds\: unisim.vcomponents.IBUFDS
    generic map(
      DIFF_TERM => false,
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => ADC_BA_P(2),
      IB => ADC_BA_N(2),
      O => adcAA_ddr_2
    );
\adcAA_ddr_IN[2].adcAA_iddre1\: unisim.vcomponents.IDDRE1
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      IS_CB_INVERTED => '1',
      IS_C_INVERTED => '0'
    )
        port map (
      C => \^adc_b_clk\,
      CB => \^adc_b_clk\,
      D => adcAA_ddr_2,
      Q1 => p_7_out(4),
      Q2 => p_7_out(5),
      R => \^rstn_0\
    );
\adcAA_ddr_IN[3].adcAA_ibufds\: unisim.vcomponents.IBUFDS
    generic map(
      DIFF_TERM => false,
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => ADC_BA_P(3),
      IB => ADC_BA_N(3),
      O => adcAA_ddr_3
    );
\adcAA_ddr_IN[3].adcAA_iddre1\: unisim.vcomponents.IDDRE1
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      IS_CB_INVERTED => '1',
      IS_C_INVERTED => '0'
    )
        port map (
      C => \^adc_b_clk\,
      CB => \^adc_b_clk\,
      D => adcAA_ddr_3,
      Q1 => p_7_out(6),
      Q2 => p_7_out(7),
      R => \^rstn_0\
    );
\adcAA_ddr_IN[4].adcAA_ibufds\: unisim.vcomponents.IBUFDS
    generic map(
      DIFF_TERM => false,
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => ADC_BA_P(4),
      IB => ADC_BA_N(4),
      O => adcAA_ddr_4
    );
\adcAA_ddr_IN[4].adcAA_iddre1\: unisim.vcomponents.IDDRE1
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      IS_CB_INVERTED => '1',
      IS_C_INVERTED => '0'
    )
        port map (
      C => \^adc_b_clk\,
      CB => \^adc_b_clk\,
      D => adcAA_ddr_4,
      Q1 => p_7_out(8),
      Q2 => p_7_out(9),
      R => \^rstn_0\
    );
\adcAA_ddr_IN[5].adcAA_ibufds\: unisim.vcomponents.IBUFDS
    generic map(
      DIFF_TERM => false,
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => ADC_BA_P(5),
      IB => ADC_BA_N(5),
      O => adcAA_ddr_5
    );
\adcAA_ddr_IN[5].adcAA_iddre1\: unisim.vcomponents.IDDRE1
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      IS_CB_INVERTED => '1',
      IS_C_INVERTED => '0'
    )
        port map (
      C => \^adc_b_clk\,
      CB => \^adc_b_clk\,
      D => adcAA_ddr_5,
      Q1 => p_7_out(10),
      Q2 => p_7_out(11),
      R => \^rstn_0\
    );
\adcAA_ddr_IN[6].adcAA_ibufds\: unisim.vcomponents.IBUFDS
    generic map(
      DIFF_TERM => false,
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => ADC_BA_P(6),
      IB => ADC_BA_N(6),
      O => adcAA_ddr_6
    );
\adcAA_ddr_IN[6].adcAA_iddre1\: unisim.vcomponents.IDDRE1
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      IS_CB_INVERTED => '1',
      IS_C_INVERTED => '0'
    )
        port map (
      C => \^adc_b_clk\,
      CB => \^adc_b_clk\,
      D => adcAA_ddr_6,
      Q1 => p_7_out(12),
      Q2 => p_7_out(13),
      R => \^rstn_0\
    );
\adcAB_d_reg[0]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_b_clk\,
      CE => '1',
      CLR => \^rstn_0\,
      D => adcAB_d_q1_0,
      Q => ADC_BB(0)
    );
\adcAB_d_reg[10]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_b_clk\,
      CE => '1',
      CLR => \^rstn_0\,
      D => adcAB_d_q1_5,
      Q => ADC_BB(10)
    );
\adcAB_d_reg[11]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_b_clk\,
      CE => '1',
      CLR => \^rstn_0\,
      D => adcAB_d_q2_5,
      Q => ADC_BB(11)
    );
\adcAB_d_reg[12]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_b_clk\,
      CE => '1',
      CLR => \^rstn_0\,
      D => adcAB_d_q1_6,
      Q => ADC_BB(12)
    );
\adcAB_d_reg[13]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_b_clk\,
      CE => '1',
      CLR => \^rstn_0\,
      D => adcAB_d_q2_6,
      Q => ADC_BB(13)
    );
\adcAB_d_reg[1]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_b_clk\,
      CE => '1',
      CLR => \^rstn_0\,
      D => adcAB_d_q2_0,
      Q => ADC_BB(1)
    );
\adcAB_d_reg[2]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_b_clk\,
      CE => '1',
      CLR => \^rstn_0\,
      D => adcAB_d_q1_1,
      Q => ADC_BB(2)
    );
\adcAB_d_reg[3]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_b_clk\,
      CE => '1',
      CLR => \^rstn_0\,
      D => adcAB_d_q2_1,
      Q => ADC_BB(3)
    );
\adcAB_d_reg[4]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_b_clk\,
      CE => '1',
      CLR => \^rstn_0\,
      D => adcAB_d_q1_2,
      Q => ADC_BB(4)
    );
\adcAB_d_reg[5]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_b_clk\,
      CE => '1',
      CLR => \^rstn_0\,
      D => adcAB_d_q2_2,
      Q => ADC_BB(5)
    );
\adcAB_d_reg[6]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_b_clk\,
      CE => '1',
      CLR => \^rstn_0\,
      D => adcAB_d_q1_3,
      Q => ADC_BB(6)
    );
\adcAB_d_reg[7]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_b_clk\,
      CE => '1',
      CLR => \^rstn_0\,
      D => adcAB_d_q2_3,
      Q => ADC_BB(7)
    );
\adcAB_d_reg[8]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_b_clk\,
      CE => '1',
      CLR => \^rstn_0\,
      D => adcAB_d_q1_4,
      Q => ADC_BB(8)
    );
\adcAB_d_reg[9]\: unisim.vcomponents.FDCE
     port map (
      C => \^adc_b_clk\,
      CE => '1',
      CLR => \^rstn_0\,
      D => adcAB_d_q2_4,
      Q => ADC_BB(9)
    );
adcA_clk_bufg: unisim.vcomponents.BUFGCE
    generic map(
      CE_TYPE => "ASYNC",
      SIM_DEVICE => "ULTRASCALE_PLUS"
    )
        port map (
      CE => '1',
      I => adcA_clk_buff,
      O => \^adc_b_clk\
    );
adcA_clk_ibufds: unisim.vcomponents.IBUFDS
    generic map(
      DIFF_TERM => false,
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => ADC_B_CLK_P,
      IB => ADC_B_CLK_N,
      O => adcA_clk_buff
    );
\adcA_ddr_IN[0].adcAB_ibufds\: unisim.vcomponents.IBUFDS
    generic map(
      DIFF_TERM => false,
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => ADC_BB_P(0),
      IB => ADC_BB_N(0),
      O => adcAB_ddr_0
    );
\adcA_ddr_IN[0].adcAB_iddre1\: unisim.vcomponents.IDDRE1
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      IS_CB_INVERTED => '1',
      IS_C_INVERTED => '0'
    )
        port map (
      C => \^adc_b_clk\,
      CB => \^adc_b_clk\,
      D => adcAB_ddr_0,
      Q1 => adcAB_d_q1_0,
      Q2 => adcAB_d_q2_0,
      R => \^rstn_0\
    );
\adcA_ddr_IN[1].adcAB_ibufds\: unisim.vcomponents.IBUFDS
    generic map(
      DIFF_TERM => false,
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => ADC_BB_P(1),
      IB => ADC_BB_N(1),
      O => adcAB_ddr_1
    );
\adcA_ddr_IN[1].adcAB_iddre1\: unisim.vcomponents.IDDRE1
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      IS_CB_INVERTED => '1',
      IS_C_INVERTED => '0'
    )
        port map (
      C => \^adc_b_clk\,
      CB => \^adc_b_clk\,
      D => adcAB_ddr_1,
      Q1 => adcAB_d_q1_1,
      Q2 => adcAB_d_q2_1,
      R => \^rstn_0\
    );
\adcA_ddr_IN[2].adcAB_ibufds\: unisim.vcomponents.IBUFDS
    generic map(
      DIFF_TERM => false,
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => ADC_BB_P(2),
      IB => ADC_BB_N(2),
      O => adcAB_ddr_2
    );
\adcA_ddr_IN[2].adcAB_iddre1\: unisim.vcomponents.IDDRE1
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      IS_CB_INVERTED => '1',
      IS_C_INVERTED => '0'
    )
        port map (
      C => \^adc_b_clk\,
      CB => \^adc_b_clk\,
      D => adcAB_ddr_2,
      Q1 => adcAB_d_q1_2,
      Q2 => adcAB_d_q2_2,
      R => \^rstn_0\
    );
\adcA_ddr_IN[3].adcAB_ibufds\: unisim.vcomponents.IBUFDS
    generic map(
      DIFF_TERM => false,
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => ADC_BB_P(3),
      IB => ADC_BB_N(3),
      O => adcAB_ddr_3
    );
\adcA_ddr_IN[3].adcAB_iddre1\: unisim.vcomponents.IDDRE1
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      IS_CB_INVERTED => '1',
      IS_C_INVERTED => '0'
    )
        port map (
      C => \^adc_b_clk\,
      CB => \^adc_b_clk\,
      D => adcAB_ddr_3,
      Q1 => adcAB_d_q1_3,
      Q2 => adcAB_d_q2_3,
      R => \^rstn_0\
    );
\adcA_ddr_IN[4].adcAB_ibufds\: unisim.vcomponents.IBUFDS
    generic map(
      DIFF_TERM => false,
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => ADC_BB_P(4),
      IB => ADC_BB_N(4),
      O => adcAB_ddr_4
    );
\adcA_ddr_IN[4].adcAB_iddre1\: unisim.vcomponents.IDDRE1
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      IS_CB_INVERTED => '1',
      IS_C_INVERTED => '0'
    )
        port map (
      C => \^adc_b_clk\,
      CB => \^adc_b_clk\,
      D => adcAB_ddr_4,
      Q1 => adcAB_d_q1_4,
      Q2 => adcAB_d_q2_4,
      R => \^rstn_0\
    );
\adcA_ddr_IN[5].adcAB_ibufds\: unisim.vcomponents.IBUFDS
    generic map(
      DIFF_TERM => false,
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => ADC_BB_P(5),
      IB => ADC_BB_N(5),
      O => adcAB_ddr_5
    );
\adcA_ddr_IN[5].adcAB_iddre1\: unisim.vcomponents.IDDRE1
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      IS_CB_INVERTED => '1',
      IS_C_INVERTED => '0'
    )
        port map (
      C => \^adc_b_clk\,
      CB => \^adc_b_clk\,
      D => adcAB_ddr_5,
      Q1 => adcAB_d_q1_5,
      Q2 => adcAB_d_q2_5,
      R => \^rstn_0\
    );
\adcA_ddr_IN[6].adcAB_ibufds\: unisim.vcomponents.IBUFDS
    generic map(
      DIFF_TERM => false,
      IOSTANDARD => "DEFAULT"
    )
        port map (
      I => ADC_BB_P(6),
      IB => ADC_BB_N(6),
      O => adcAB_ddr_6
    );
\adcA_ddr_IN[6].adcAB_iddre1\: unisim.vcomponents.IDDRE1
    generic map(
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      IS_CB_INVERTED => '1',
      IS_C_INVERTED => '0'
    )
        port map (
      C => \^adc_b_clk\,
      CB => \^adc_b_clk\,
      D => adcAB_ddr_6,
      Q1 => adcAB_d_q1_6,
      Q2 => adcAB_d_q2_6,
      R => \^rstn_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_io_dual_adc_ddr_top_0_0_io_dual_adc_ddr_top is
  port (
    ADC_A_CLK : out STD_LOGIC;
    ADC_B_CLK : out STD_LOGIC;
    ADC_AA : out STD_LOGIC_VECTOR ( 13 downto 0 );
    ADC_AB : out STD_LOGIC_VECTOR ( 13 downto 0 );
    ADC_BA : out STD_LOGIC_VECTOR ( 13 downto 0 );
    ADC_BB : out STD_LOGIC_VECTOR ( 13 downto 0 );
    ADC_A_CLK_P : in STD_LOGIC;
    ADC_A_CLK_N : in STD_LOGIC;
    ADC_AA_P : in STD_LOGIC_VECTOR ( 6 downto 0 );
    ADC_AA_N : in STD_LOGIC_VECTOR ( 6 downto 0 );
    ADC_AB_P : in STD_LOGIC_VECTOR ( 6 downto 0 );
    ADC_AB_N : in STD_LOGIC_VECTOR ( 6 downto 0 );
    ADC_B_CLK_P : in STD_LOGIC;
    ADC_B_CLK_N : in STD_LOGIC;
    ADC_BA_P : in STD_LOGIC_VECTOR ( 6 downto 0 );
    ADC_BA_N : in STD_LOGIC_VECTOR ( 6 downto 0 );
    ADC_BB_P : in STD_LOGIC_VECTOR ( 6 downto 0 );
    ADC_BB_N : in STD_LOGIC_VECTOR ( 6 downto 0 );
    rstn : in STD_LOGIC
  );
  attribute ORIG_REF_NAME : string;
  attribute ORIG_REF_NAME of design_1_io_dual_adc_ddr_top_0_0_io_dual_adc_ddr_top : entity is "io_dual_adc_ddr_top";
end design_1_io_dual_adc_ddr_top_0_0_io_dual_adc_ddr_top;

architecture STRUCTURE of design_1_io_dual_adc_ddr_top_0_0_io_dual_adc_ddr_top is
  signal adc_binst_n_1 : STD_LOGIC;
begin
adc_a_inst: entity work.design_1_io_dual_adc_ddr_top_0_0_adc_ddr_top
     port map (
      ADC_AA(13 downto 0) => ADC_AA(13 downto 0),
      ADC_AA_N(6 downto 0) => ADC_AA_N(6 downto 0),
      ADC_AA_P(6 downto 0) => ADC_AA_P(6 downto 0),
      ADC_AB(13 downto 0) => ADC_AB(13 downto 0),
      ADC_AB_N(6 downto 0) => ADC_AB_N(6 downto 0),
      ADC_AB_P(6 downto 0) => ADC_AB_P(6 downto 0),
      ADC_A_CLK => ADC_A_CLK,
      ADC_A_CLK_N => ADC_A_CLK_N,
      ADC_A_CLK_P => ADC_A_CLK_P,
      \adcAA_d_reg[13]_0\ => adc_binst_n_1
    );
adc_binst: entity work.design_1_io_dual_adc_ddr_top_0_0_adc_ddr_top_0
     port map (
      ADC_BA(13 downto 0) => ADC_BA(13 downto 0),
      ADC_BA_N(6 downto 0) => ADC_BA_N(6 downto 0),
      ADC_BA_P(6 downto 0) => ADC_BA_P(6 downto 0),
      ADC_BB(13 downto 0) => ADC_BB(13 downto 0),
      ADC_BB_N(6 downto 0) => ADC_BB_N(6 downto 0),
      ADC_BB_P(6 downto 0) => ADC_BB_P(6 downto 0),
      ADC_B_CLK => ADC_B_CLK,
      ADC_B_CLK_N => ADC_B_CLK_N,
      ADC_B_CLK_P => ADC_B_CLK_P,
      rstn => rstn,
      rstn_0 => adc_binst_n_1
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity design_1_io_dual_adc_ddr_top_0_0 is
  port (
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
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of design_1_io_dual_adc_ddr_top_0_0 : entity is true;
  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_io_dual_adc_ddr_top_0_0 : entity is "design_1_io_dual_adc_ddr_top_0_0,io_dual_adc_ddr_top,{}";
  attribute DowngradeIPIdentifiedWarnings : string;
  attribute DowngradeIPIdentifiedWarnings of design_1_io_dual_adc_ddr_top_0_0 : entity is "yes";
  attribute IP_DEFINITION_SOURCE : string;
  attribute IP_DEFINITION_SOURCE of design_1_io_dual_adc_ddr_top_0_0 : entity is "module_ref";
  attribute X_CORE_INFO : string;
  attribute X_CORE_INFO of design_1_io_dual_adc_ddr_top_0_0 : entity is "io_dual_adc_ddr_top,Vivado 2024.2";
end design_1_io_dual_adc_ddr_top_0_0;

architecture STRUCTURE of design_1_io_dual_adc_ddr_top_0_0 is
  attribute X_INTERFACE_INFO : string;
  attribute X_INTERFACE_INFO of ADC_A_CLK : signal is "xilinx.com:signal:clock:1.0 ADC_A_CLK CLK";
  attribute X_INTERFACE_MODE : string;
  attribute X_INTERFACE_MODE of ADC_A_CLK : signal is "master";
  attribute X_INTERFACE_PARAMETER : string;
  attribute X_INTERFACE_PARAMETER of ADC_A_CLK : signal is "XIL_INTERFACENAME ADC_A_CLK, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_io_dual_adc_ddr_top_0_0_ADC_A_CLK, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of ADC_A_CLK_N : signal is "xilinx.com:signal:clock:1.0 ADC_A_CLK_N CLK";
  attribute X_INTERFACE_MODE of ADC_A_CLK_N : signal is "slave";
  attribute X_INTERFACE_PARAMETER of ADC_A_CLK_N : signal is "XIL_INTERFACENAME ADC_A_CLK_N, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_ADC_A_CLK_N_0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of ADC_A_CLK_P : signal is "xilinx.com:signal:clock:1.0 ADC_A_CLK_P CLK";
  attribute X_INTERFACE_MODE of ADC_A_CLK_P : signal is "slave";
  attribute X_INTERFACE_PARAMETER of ADC_A_CLK_P : signal is "XIL_INTERFACENAME ADC_A_CLK_P, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_ADC_A_CLK_P_0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of ADC_B_CLK : signal is "xilinx.com:signal:clock:1.0 ADC_B_CLK CLK";
  attribute X_INTERFACE_MODE of ADC_B_CLK : signal is "master";
  attribute X_INTERFACE_PARAMETER of ADC_B_CLK : signal is "XIL_INTERFACENAME ADC_B_CLK, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_io_dual_adc_ddr_top_0_0_ADC_B_CLK, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of ADC_B_CLK_N : signal is "xilinx.com:signal:clock:1.0 ADC_B_CLK_N CLK";
  attribute X_INTERFACE_MODE of ADC_B_CLK_N : signal is "slave";
  attribute X_INTERFACE_PARAMETER of ADC_B_CLK_N : signal is "XIL_INTERFACENAME ADC_B_CLK_N, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_ADC_B_CLK_N_0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of ADC_B_CLK_P : signal is "xilinx.com:signal:clock:1.0 ADC_B_CLK_P CLK";
  attribute X_INTERFACE_MODE of ADC_B_CLK_P : signal is "slave";
  attribute X_INTERFACE_PARAMETER of ADC_B_CLK_P : signal is "XIL_INTERFACENAME ADC_B_CLK_P, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_ADC_B_CLK_P_0, INSERT_VIP 0";
  attribute X_INTERFACE_INFO of rstn : signal is "xilinx.com:signal:reset:1.0 rstn RST";
  attribute X_INTERFACE_MODE of rstn : signal is "slave";
  attribute X_INTERFACE_PARAMETER of rstn : signal is "XIL_INTERFACENAME rstn, POLARITY ACTIVE_LOW, INSERT_VIP 0";
begin
inst: entity work.design_1_io_dual_adc_ddr_top_0_0_io_dual_adc_ddr_top
     port map (
      ADC_AA(13 downto 0) => ADC_AA(13 downto 0),
      ADC_AA_N(6 downto 0) => ADC_AA_N(6 downto 0),
      ADC_AA_P(6 downto 0) => ADC_AA_P(6 downto 0),
      ADC_AB(13 downto 0) => ADC_AB(13 downto 0),
      ADC_AB_N(6 downto 0) => ADC_AB_N(6 downto 0),
      ADC_AB_P(6 downto 0) => ADC_AB_P(6 downto 0),
      ADC_A_CLK => ADC_A_CLK,
      ADC_A_CLK_N => ADC_A_CLK_N,
      ADC_A_CLK_P => ADC_A_CLK_P,
      ADC_BA(13 downto 0) => ADC_BA(13 downto 0),
      ADC_BA_N(6 downto 0) => ADC_BA_N(6 downto 0),
      ADC_BA_P(6 downto 0) => ADC_BA_P(6 downto 0),
      ADC_BB(13 downto 0) => ADC_BB(13 downto 0),
      ADC_BB_N(6 downto 0) => ADC_BB_N(6 downto 0),
      ADC_BB_P(6 downto 0) => ADC_BB_P(6 downto 0),
      ADC_B_CLK => ADC_B_CLK,
      ADC_B_CLK_N => ADC_B_CLK_N,
      ADC_B_CLK_P => ADC_B_CLK_P,
      rstn => rstn
    );
end STRUCTURE;
