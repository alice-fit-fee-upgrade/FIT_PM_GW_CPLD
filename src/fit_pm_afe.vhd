library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity fit_pm_afe is
  generic (
    ADC_DATA_LINES        : integer := 7;
    ADC_RESOLUTION_BITS   : integer := 14;
    DATA_OUT_W            : integer := 16
  );
  port (
    clk         : in std_logic;
    rstn        : in std_logic;

    clk_40      : in std_logic;
    clk_20      : in std_logic;
    clk_20n     : in std_logic;

    enai        : in std_logic;
    strb        : in std_logic;
    evnt        : in std_logic;
    evout       : out std_logic;
    
    clk_inA     : in std_logic;
    d_inAA      : in std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
    d_inAB      : in std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);

    clk_inB     : in std_logic;
    d_inBA      : in std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
    d_inBB      : in std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);

    d_val       : out std_logic;
    d_out       : out std_logic_vector(DATA_OUT_W-1 downto 0)
  );
end fit_pm_afe;

architecture Behavioral of fit_pm_afe is

begin

process (evnt)
begin
    evout <= evnt;
end process;

end Behavioral;