library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
library UNISIM;
use UNISIM.vcomponents.all;

entity ampl_top is
  generic (
    ADC_DATA_LINES        : integer := 7;
    ADC_RESOLUTION_BITS   : integer := 14;
    DATA_OUT_W            : integer := 13
  );
  port (
    CLK_IN      : in std_logic;
    CLK40       : out std_logic;
    CLK20_P     : out std_logic;
    CLK20_N     : out std_logic;

    ENA         : in std_logic;
    EV          : in std_logic;
    EV_out      : out std_logic;
    STR         : in std_logic;
    DV          : out std_logic;

    ADCA_N      : in std_logic_vector (ADC_DATA_LINES-1 downto 0);
    ADCA_P      : in std_logic_vector (ADC_DATA_LINES-1 downto 0);
    ADCB_N      : in std_logic_vector (ADC_DATA_LINES-1 downto 0);
    ADCB_P      : in std_logic_vector (ADC_DATA_LINES-1 downto 0);
    DOUT        : out std_logic_vector (DATA_OUT_W-1 downto 0)
  );
end ampl_top;

architecture Frontend of ampl_top is

  signal rstn : std_logic := '0';
  signal clk_gate, clk_int_a, clk_int_b : std_logic;
  signal adcA_ddr, adcB_ddr : std_logic_vector(ADC_DATA_LINES-1 downto 0);
  signal d_inA, d_inB : std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);

  signal clks_locked, clk_fb : std_logic;

  component ampl_logic
  generic (
    ADC_RESOLUTION_BITS   : integer := 14;
    DATA_OUT_W            : integer := 13;
    ADC_OVERFLOW_VAL      : integer := 16#1FFF# -- 16#3FFF# max value for 14-bits
  );
  port (
    clk       : in std_logic;
    rstn      : in std_logic;
    
    strb      : in std_logic;
    enai      : in std_logic;
    evnt      : in std_logic;
    evout     : out std_logic;
    
    d_inA     : in std_logic_vector (ADC_RESOLUTION_BITS-1 downto 0);
    d_inB     : in std_logic_vector (ADC_RESOLUTION_BITS-1 downto 0);
    d_out     : out std_logic_vector (DATA_OUT_W-1 downto 0)
  );
  end component;

begin

  Logic : ampl_logic port map(
    clk   => clk,
    rstn  => clks_locked,
    
    strb  => strb,
    enai  => enai,
    evnt  => evnt,
    evout => evout,
    
    d_inA => d_inA,
    d_inB => d_inB,
    d_out => d_out
  );
  
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

  adcA_ddr_IN : for i in 0 to ADC_DATA_LINES-1 generate
          adcB_ddr_IBUFDS : IBUFDS port map(
            I  => ADCA_P(i),
            IB => ADCA_N(i),
            O  => adcA_ddr(i)
          );

          adc0_IDDRE1 : IDDRE1 generic map (
            DDR_CLK_EDGE => "OPPOSITE_EDGE",
            IS_CB_INVERTED => '1',
            IS_C_INVERTED => '0'
          )
          port map (
            Q1 => d_inA(2*i),
            Q2 => d_inA(2*i+1),
            C => clk,
            CB => clk_n,
            D => adcA_ddr(i),
            R => rstn
          );
  end generate;
  
  adcB_ddr_IN : for i in 0 to ADC_DATA_LINES-1 generate
          ADC1_IBUFDS : IBUFDS port map(
            I  => ADCB_P(i),
            IB => ADCB_N(i),
            O  => adcB_ddr(i)
          );

          adc1_IDDRE1 : IDDRE1 generic map (
            DDR_CLK_EDGE => "OPPOSITE_EDGE",
            IS_CB_INVERTED => '1',
            IS_C_INVERTED => '0'
          )
          port map (
            Q1 => d_inB(2*i),
            Q2 => d_inB(2*i+1),
            C => clk,
            CB => clk_n,
            D => adcB_ddr(i),
            R => rstn
          );
  end generate;

  DATA_OUT : for i in 0 to DATA_OUT_W-1 generate
    DOUT_OUT : OBUF port map(
      I => d_out(i),
      O => DOUT(i)
    );
  end generate;

  MMCME4_BASE_inst : MMCME4_BASE
  generic map (
      BANDWIDTH => "OPTIMIZED",   -- Jitter programming
      CLKFBOUT_MULT_F => 2.0,     -- Multiply value for all CLKOUT
      CLKFBOUT_PHASE => 0.0,      -- Phase offset in degrees of CLKFB
      CLKIN1_PERIOD => 25.0,      -- Input clock period in ns to ps resolution (i.e., 33.333 is 30 MHz).
      -- clk (80MHz)
      CLKOUT0_DIVIDE_F => 1.0,    -- Divide amount for CLKOUT0
      CLKOUT0_DUTY_CYCLE => 0.5,  -- Duty cycle for CLKOUT0
      CLKOUT0_PHASE => 0.0,       -- Phase offset for CLKOUT0
      -- clk_gate (40MHz)
      CLKOUT1_DIVIDE => 2,        -- Divide amount for CLKOUT (1-128)
      CLKOUT1_DUTY_CYCLE => 0.5,  -- Duty cycle for CLKOUT outputs (0.001-0.999).
      CLKOUT1_PHASE => 0.0,       -- Phase offset for CLKOUT outputs (-360.000-360.000).
      -- clk_int_a / clk_int_b (20MHz)
      CLKOUT2_DIVIDE => 4,        -- Divide amount for CLKOUT (1-128)
      CLKOUT2_DUTY_CYCLE => 0.5,  -- Duty cycle for CLKOUT outputs (0.001-0.999).
      CLKOUT2_PHASE => 0.0,       -- Phase offset for CLKOUT outputs (-360.000-360.000).
      
      DIVCLK_DIVIDE => 1,         -- Master division value
      IS_CLKFBIN_INVERTED => '0', -- Optional inversion for CLKFBIN
      IS_CLKIN1_INVERTED => '0',  -- Optional inversion for CLKIN1
      IS_PWRDWN_INVERTED => '0',  -- Optional inversion for PWRDWN
      IS_RST_INVERTED => '0',     -- Optional inversion for RST
      REF_JITTER1 => 0.0,         -- Reference input jitter in UI (0.000-0.999).
      STARTUP_WAIT => "FALSE"     -- Delays DONE until MMCM is locked
  )
  port map (
      CLKFBOUT => clk_fb,
      CLKFBOUTB => open,

      CLKOUT0   => clk,
      CLKOUT0B  => open,
      CLKOUT1   => clk_gate,
      CLKOUT1B  => open,
      CLKOUT2   => clk_int_a,
      CLKOUT2B  => clk_int_b,
      CLKOUT3   => open,
      CLKOUT3B  => open,
      CLKOUT4   => open,
      CLKOUT5   => open,
      CLKOUT6   => open,

      LOCKED    => clks_locked,
      CLKFBIN   => clk_fb,
      CLKIN1    => CLK_IN,
      PWRDWN    => '0',
      RST       => '1'
  );

end Frontend;