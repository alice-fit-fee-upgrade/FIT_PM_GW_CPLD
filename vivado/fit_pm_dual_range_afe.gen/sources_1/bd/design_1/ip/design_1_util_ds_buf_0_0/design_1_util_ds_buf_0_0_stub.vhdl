-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2024.2 (win64) Build 5239630 Fri Nov 08 22:35:27 MST 2024
-- Date        : Tue Aug 26 14:39:33 2025
-- Host        : KP-LABS98 running 64-bit major release  (build 9200)
-- Command     : write_vhdl -force -mode synth_stub
--               c:/Users/rsmalec/_FPGA/_PW/FIT_PM_GW_CPLD/vivado/fit_pm_dual_range_afe/fit_pm_dual_range_afe.gen/sources_1/bd/design_1/ip/design_1_util_ds_buf_0_0/design_1_util_ds_buf_0_0_stub.vhdl
-- Design      : design_1_util_ds_buf_0_0
-- Purpose     : Stub declaration of top-level module interface
-- Device      : xcau10p-ffvb676-2-i
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity design_1_util_ds_buf_0_0 is
  Port ( 
    IOBUF_IO_T : in STD_LOGIC_VECTOR ( 2 downto 0 );
    IOBUF_IO_I : in STD_LOGIC_VECTOR ( 2 downto 0 );
    IOBUF_IO_O : out STD_LOGIC_VECTOR ( 2 downto 0 );
    IOBUF_IO_IO : inout STD_LOGIC_VECTOR ( 2 downto 0 )
  );

  attribute CHECK_LICENSE_TYPE : string;
  attribute CHECK_LICENSE_TYPE of design_1_util_ds_buf_0_0 : entity is "design_1_util_ds_buf_0_0,util_ds_buf,{}";
  attribute core_generation_info : string;
  attribute core_generation_info of design_1_util_ds_buf_0_0 : entity is "design_1_util_ds_buf_0_0,util_ds_buf,{x_ipProduct=Vivado 2024.2,x_ipVendor=xilinx.com,x_ipLibrary=ip,x_ipName=util_ds_buf,x_ipVersion=2.2,x_ipCoreRevision=7,x_ipLanguage=VERILOG,x_ipSimLanguage=VHDL,C_SIZE=3,C_BUF_TYPE=IOBUF,C_BUFGCE_DIV=1,C_BUFG_GT_SYNC=0,C_OBUFDS_GTE5_ADV=00,C_REFCLK_ICNTL_TX=00000,C_SIM_DEVICE=VERSAL_AI_CORE_ES1}";
  attribute downgradeipidentifiedwarnings : string;
  attribute downgradeipidentifiedwarnings of design_1_util_ds_buf_0_0 : entity is "yes";
end design_1_util_ds_buf_0_0;

architecture stub of design_1_util_ds_buf_0_0 is
  attribute syn_black_box : boolean;
  attribute black_box_pad_pin : string;
  attribute syn_black_box of stub : architecture is true;
  attribute black_box_pad_pin of stub : architecture is "IOBUF_IO_T[2:0],IOBUF_IO_I[2:0],IOBUF_IO_O[2:0],IOBUF_IO_IO[2:0]";
  attribute x_interface_info : string;
  attribute x_interface_info of IOBUF_IO_I : signal is "xilinx.com:signal:clock:1.0 IOBUF_IO_I CLK";
  attribute x_interface_mode : string;
  attribute x_interface_mode of IOBUF_IO_I : signal is "slave IOBUF_IO_I";
  attribute x_interface_parameter : string;
  attribute x_interface_parameter of IOBUF_IO_I : signal is "XIL_INTERFACENAME IOBUF_IO_I, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, INSERT_VIP 0";
  attribute x_interface_info of IOBUF_IO_O : signal is "xilinx.com:signal:clock:1.0 IOBUF_IO_O CLK";
  attribute x_interface_mode of IOBUF_IO_O : signal is "master IOBUF_IO_O";
  attribute x_interface_parameter of IOBUF_IO_O : signal is "XIL_INTERFACENAME IOBUF_IO_O, FREQ_HZ 100000000, FREQ_TOLERANCE_HZ 0, PHASE 0.0, CLK_DOMAIN design_1_util_ds_buf_0_0_IOBUF_IO_O, INSERT_VIP 0";
  attribute x_core_info : string;
  attribute x_core_info of stub : architecture is "util_ds_buf,Vivado 2024.2";
begin
end;
