library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity io_int_g_drv is
  port (
    clk20           : in std_logic;
    clk20n          : in std_logic;

    INT_A_G_DRV_P   : out std_logic;
    INT_A_G_DRV_N   : out std_logic;
    INT_B_G_DRV_P   : out std_logic;
    INT_B_G_DRV_N   : out std_logic
  );
end io_int_g_drv;

architecture RTL of io_int_g_drv is

begin
    
    INT_A_G_DRV_P <= clk20;
    INT_A_G_DRV_N <= not clk20;
    INT_B_G_DRV_P <= clk20n;
    INT_B_G_DRV_N <= not clk20n;

end RTL;
