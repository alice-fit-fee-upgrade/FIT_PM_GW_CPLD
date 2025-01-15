library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
library UNISIM;
use UNISIM.vcomponents.all;

entity ampl_top is
  generic (
    ADC_DATA_LINES  : integer := 7;
    ADC_RESOLUTION  : integer := 14;
    DATA_OUT_W      : integer := 13
  );
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

    ADC0_N      : in std_logic_vector (ADC_DATA_LINES-1 downto 0);
    ADC0_P      : in std_logic_vector (ADC_DATA_LINES-1 downto 0);
    ADC1_N      : in std_logic_vector (ADC_DATA_LINES-1 downto 0);
    ADC1_P      : in std_logic_vector (ADC_DATA_LINES-1 downto 0);
    DOUT        : out std_logic_vector (DATA_OUT_W-1 downto 0)
  );
end ampl_top;

architecture Frontend of ampl_top is

  signal rstn : std_logic;

  signal adc1_ddr_ddr, adc1_ddr : std_logic_vector(ADC_DATA_LINES-1 downto 0);
  signal d_in0, d_in1 : std_logic_vector(ADC_RESOLUTION-1 downto 0);

  component ampl_logic
  port (
    clk       : in std_logic;
    rstn      : in std_logic;
    
    strb      : in std_logic;
    en        : in std_logic;
    evnt      : in std_logic;
    evout     : out std_logic;
    
    d_in0     : in std_logic_vector (13 downto 0);
    d_in1    : in std_logic_vector (13 downto 0);
    d_out     : out std_logic_vector (12 downto 0)
  );
  end component;

begin
  
  CLK40_BUF   : OBUF port map(
    I => clk_gate,
    O => CLK40
  );

  CLK20_BUF   : OBUF port map(
    I => clk_int_a,
    O => CLK20_P
  );

  CLK20_N_BUF : OBUF port map(
    I => clk_int_b,
    O => CLK20_N
  );

  ENA_BUF : IBUF port map(
    I => ENA,
    O => enai
  );

  EV_BUF  : IBUF port map(
    I => EV,
    O => evnt
  );

  EV_OUT_BUF : OBUF port map(
    I => evout,
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

  adc0_ddr_IN : for i in 0 to ADC_DATA_LINES-1 generate
          adc1_ddr_IBUFDS : IBUFDS port map(
            I  => ADC0_P(i),
            IB => ADC0_N(i),
            O  => adc0_ddr(i)
          );

          adc0_IDDRE1 : IDDRE1 generic map (
            DDR_CLK_EDGE => "OPPOSITE_EDGE",
            IS_CB_INVERTED => '1',
            IS_C_INVERTED => '0'
          )
          port map (
            Q1 => d_in0(2*i),
            Q2 => d_in0(2*i+1),
            C => clk,
            CB => clk_n,
            D => adc0_ddr(i),
            R => rstn
          );
  end generate;
  
  adc1_ddr_IN : for i in 0 to ADC_DATA_LINES-1 generate
          ADC1_IBUFDS : IBUFDS port map(
            I  => ADC1_P(i),
            IB => ADC1_N(i),
            O  => adc1_ddr(i)
          );

          adc1_IDDRE1 : IDDRE1 generic map (
            DDR_CLK_EDGE => "OPPOSITE_EDGE",
            IS_CB_INVERTED => '1',
            IS_C_INVERTED => '0'
          )
          port map (
            Q1 => d_in1(2*i),
            Q2 => d_in1(2*i+1),
            C => clk,
            CB => clk_n,
            D => adc1_ddr(i),
            R => rstn
          );
  end generate;

  DATA_OUT : for i in 0 to DATA_OUT_W-1 generate
    DOUT_OUT : OBUF port map(
      I => d_out(i),
      O => DOUT(i)
    );
  end generate;

end Frontend;