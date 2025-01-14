library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
library UNISIM;
use UNISIM.vcomponents.all;

entity ampl_top is
  port (
    CLK80       : in std_logic;
    CLK40       : out std_logic;
    CLK20_P     : out std_logic;
    CLK20_N     : out std_logic;

    ENA         : in std_logic;
    EV          : in std_logic;
    EV_out      : out std_logic;
    STR         : in std_logic;
    DV          : out std_logic;

    ADC0_n      : in std_logic_vector (6 downto 0);
    ADC0_p      : in std_logic_vector (6 downto 0);
    ADC1_n      : in std_logic_vector (6 downto 0);
    ADC1_p      : in std_logic_vector (6 downto 0);
    DOUT        : out std_logic_vector (12 downto 0)
  );
end ampl_top;

architecture Frontend of ampl_top is

  signal rstn : std_logic;

  signal ADC0_ddr, ADC1_ddr : std_logic_vector(6 downto 0);
  signal ADC0, ADC1 : std_logic_vector(6 downto 0);

  component ampl_logic
  port (
    clk       : in std_logic;
    rstn      : in std_logic;
    
    strb      : in std_logic;
    en        : in std_logic;
    evnt      : in std_logic;
    evout     : out std_logic;
    
    d_in_a    : in std_logic_vector (13 downto 0);
    d_in_b    : in std_logic_vector (13 downto 0);
    d_out     : out std_logic_vector (12 downto 0);
  );
  end component;

begin

  CLK_BUF : IBUF port map(
    I => CLK80,
    O => clk
  );
  
  CLK40_BUF   : OBUF port map(
    I => CNT(0),
    O => CLK40
  );

  CLK20_BUF   : OBUF port map(
    I => CNT(1),
    O => CLK20_P
  );

  CLK20_N_BUF : OBUF port map(
    I => not CNT(1),
    O => CLK20_N
  );

  ENA_BUF : IBUF port map(
    I => ENA,
    O => enai
  );

  EV_BUF  : IBUF port map(
    I => EV,
    O => EVNT
  );

  EV_OUT_BUF : OBUF port map(
    I => EVOUT,
    O => EV_out
  );


  STR_BUF : IBUF port map(
    I => STR,
    O => strb
  );

  DV_BUF : OBUF port map(
    I => dly(7),
    O => DV
  );

  ADC0_IN : for i in 0 to 11 generate
    ADC0_IBUFDS : IBUFDS port map(
      I  => ADC0_p(i),
      IB => ADC0_n(i),
      O  => ADC0_ddr(i)
    );
  end generate;
  
  ADC0_IN : for i in 0 to 11 generate
    ADC1_IBUFDS : IBUFDS port map(
      I  => ADC1_p(i),
      IB => ADC1_n(i),
      O  => ADC1_ddr(i)
    );
  end generate;

  DATA_OUT : for i in 0 to 12 generate
    DOUT_OUT : OBUF port map(
      I => d_out(i),
      O => DOUT(i)
    );
  end generate;

end Frontend;