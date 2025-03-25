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
    CLK_IN                : in std_logic;
    CLK40                 : out std_logic;
    CLK20_P               : out std_logic;
    CLK20_N               : out std_logic;

    ENA                   : in std_logic;
    STR                   : in std_logic;
    EV                    : in std_logic;
    EV_out                : out std_logic;

    ADCA_CLK_N            : in std_logic;
    ADCA_CLK_P            : in std_logic;
    ADCAA_N               : in std_logic_vector (ADC_DATA_LINES-1 downto 0);
    ADCAA_P               : in std_logic_vector (ADC_DATA_LINES-1 downto 0);
    ADCAB_N               : in std_logic_vector (ADC_DATA_LINES-1 downto 0);
    ADCAB_P               : in std_logic_vector (ADC_DATA_LINES-1 downto 0);

    ADCB_CLK_N            : in std_logic;
    ADCB_CLK_P            : in std_logic;
    ADCBA_N               : in std_logic_vector (ADC_DATA_LINES-1 downto 0);
    ADCBA_P               : in std_logic_vector (ADC_DATA_LINES-1 downto 0);
    ADCBB_N               : in std_logic_vector (ADC_DATA_LINES-1 downto 0);
    ADCBB_P               : in std_logic_vector (ADC_DATA_LINES-1 downto 0);

    DV                    : out std_logic;
    DOUT                  : out std_logic_vector (DATA_OUT_W-1 downto 0)
  );
end ampl_top;

architecture Frontend of ampl_top is

  signal clk : std_logic;
  signal rstn : std_logic := '0';
  signal clk_gate, clk_int_A, clk_int_B : std_logic;
  signal clks_locked, clk_fb : std_logic;

  signal enai, strb, evnt, evout : std_logic;

  signal adcA_clk_buff, adcB_clk_buff : std_logic;
  signal adcA_clk, adcB_clk : std_logic;
  signal adcAA_ddr, adcAB_ddr, adcBA_ddr, adcBB_ddr : std_logic_vector(ADC_DATA_LINES-1 downto 0);

  signal adcAA_d_odd, adcAB_d_odd, adcBA_d_odd, adcBB_d_odd : std_logic_vector(ADC_DATA_LINES-1 downto 0);
  signal adcAA_d_even, adcAB_d_even, adcBA_d_even, adcBB_d_even : std_logic_vector(ADC_DATA_LINES-1 downto 0);
  signal adcAA_d_even_ff, adcAB_d_even_ff, adcBA_d_even_ff, adcBB_d_even_ff : std_logic_vector(ADC_DATA_LINES-1 downto 0);

  signal adcAA_d, adcAB_d, adcBA_d, adcBB_d : std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);

  signal d_val : std_logic;
  signal d_out : std_logic_vector(DATA_OUT_W-1 downto 0);

  component ampl_logic
  generic (
    ADC_RESOLUTION_BITS   : integer := 14;
    DATA_OUT_W            : integer := 13;
    ADC_OVERFLOW_VAL      : integer := 16#1FFF# -- 16#3FFF# max value for 14-bits
  );
  port (
    clk       : in std_logic;
    rstn      : in std_logic;

    clk_gate  : in std_logic;
    clk_int_A : in std_logic;
    clk_int_B : in std_logic;

    enai      : in std_logic;
    strb      : in std_logic;
    evnt      : in std_logic;
    evout     : out std_logic;
    
    clk_inA   : in std_logic;
    d_inAA     : in std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
    d_inAB     : in std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);

    clk_inB   : in std_logic;
    d_inBA     : in std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
    d_inBB     : in std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);

    d_val     : out std_logic;
    d_out     : out std_logic_vector(DATA_OUT_W-1 downto 0)
  );
  end component;

begin

  Logic : ampl_logic port map(
    clk   => clk,
    rstn  => clks_locked,

    clk_gate  => clk_gate,
    clk_int_A => clk_int_A,
    clk_int_B => clk_int_B,
    
    enai  => enai,
    strb  => strb,
    evnt  => evnt,
    evout => evout,
    
    clk_inA => adcA_clk,
    d_inAA  => adcAA_d,
    d_inAB  => adcAB_d,

    clk_inB => adcB_clk,
    d_inBA  => adcBA_d,
    d_inBB  => adcBB_d,

    d_val => d_val,
    d_out => d_out
  );
  
  clk_gate_obuf : OBUF port map(
    I => clk_gate,
    O => CLK40
  );

  clk_int_A_obuf : OBUF port map(
    I => clk_int_A,
    O => CLK20_P
  );

  clk_int_B_obuf : OBUF port map(
    I => clk_int_B,
    O => CLK20_N
  );

  enai_ibuf : IBUF port map(
    I => ENA,
    O => enai
  );

  evnt_ibuf : IBUF port map(
    I => EV,
    O => evnt
  );

  ev_out_obuf : OBUF port map(
    I => evout,
    O => EV_out
  );


  str_ibuf : IBUF port map(
    I => STR,
    O => strb
  );

  d_val_obuf : OBUF port map(
    I => d_val,
    O => DV
  );

  adcA_clk_ibufds : IBUFDS port map(
    I  => ADCA_CLK_P,
    IB => ADCA_CLK_N,
    O  => adcA_clk_buff
  );

  adcA_clk_bufg : BUFG port map(
    I => adcA_clk_buff,
    O => adcA_clk
  );

  adcAA_ddr_IN : for i in 0 to ADC_DATA_LINES-1 generate
        adcAA_ibufds : IBUFDS port map(
          I  => ADCAA_P(i),
          IB => ADCAA_N(i),
          O  => adcAA_ddr(i)
        );

        adcAA_iddre1 : IDDRE1 generic map (
          DDR_CLK_EDGE => "OPPOSITE_EDGE",
          IS_CB_INVERTED => '1',
          IS_C_INVERTED => '0'
        )
        port map (
          R  => not(rstn),
          C  => adcA_clk,
          CB => adcA_clk,
          D  => adcAA_ddr(i),
          Q1 => adcAA_d_odd(i),
          Q2 => adcAA_d_even(i)
        );
  end generate;

        adcAA_delay: process(adcA_clk, rstn) begin
          if rstn = '0' then
            adcAA_d_even_ff <= (others => '0');
          else
            if rising_edge(adcA_clk) then
              for i in 0 to ADC_DATA_LINES-1 loop
                adcAA_d_even_ff(i) <= adcAA_d_even(i);
              end loop;
            end if;
          end if;
        end process;

        abcAA_align: process(adcA_clk, rstn) begin
          if rstn = '0' then
            adcAA_d <= (others => '0');
          else
            if rising_edge(adcA_clk) then
              for i in 0 to ADC_DATA_LINES-1 loop
                adcAA_d(2*i) <= adcAA_d_even_ff(i);
                adcAA_d(2*i+1) <= adcAA_d_odd(i);
              end loop;
            end if;
          end if;
        end process;

  adcA_ddr_IN : for i in 0 to ADC_DATA_LINES-1 generate
        adcAB_ibufds : IBUFDS port map(
          I  => ADCAB_P(i),
          IB => ADCAB_N(i),
          O  => adcAB_ddr(i)
        );

        adcAB_iddre1 : IDDRE1 generic map (
          DDR_CLK_EDGE => "OPPOSITE_EDGE",
          IS_CB_INVERTED => '1',
          IS_C_INVERTED => '0'
        )
        port map (
          R  => not(rstn),
          C  => adcA_clk,
          CB => adcA_clk,
          D  => adcAB_ddr(i),
          Q1 => adcAB_d_odd(i),
          Q2 => adcAB_d_even(i)
        );
  end generate;

        adcAB_delay: process(adcA_clk, rstn) begin
          if rstn = '0' then
            adcAB_d_even_ff <= (others => '0');
          else
            if rising_edge(adcA_clk) then
              for i in 0 to ADC_DATA_LINES-1 loop
                adcAB_d_even_ff(i) <= adcAB_d_even(i);
              end loop;
            end if;
          end if;
        end process;

        abcAB_align: process(adcA_clk, rstn) begin
          if rstn = '0' then
            adcAB_d <= (others => '0');
          else
            if rising_edge(adcA_clk) then
              for i in 0 to ADC_DATA_LINES-1 loop
                adcAB_d(2*i) <= adcAB_d_even_ff(i);
                adcAB_d(2*i+1) <= adcAB_d_odd(i);
              end loop;
            end if;
          end if;
        end process;

  adcB_clk_ibufds : IBUFDS port map(
    I  => ADCB_CLK_P,
    IB => ADCB_CLK_N,
    O  => adcB_clk_buff
  );

  adcB_clk_bufg : BUFG port map(
    I => adcB_clk_buff,
    O => adcB_clk
  );

  adcBA_ddr_IN : for i in 0 to ADC_DATA_LINES-1 generate
        adcBA_ibufds : IBUFDS port map(
          I  => ADCBA_P(i),
          IB => ADCBA_N(i),
          O  => adcBA_ddr(i)
        );

        adcBA_iddre1 : IDDRE1 generic map (
          DDR_CLK_EDGE => "OPPOSITE_EDGE",
          IS_CB_INVERTED => '1',
          IS_C_INVERTED => '0'
        )
        port map (
          R  => not(rstn),
          C  => adcB_clk,
          CB => adcB_clk,
          D  => adcBA_ddr(i),
          Q1 => adcBA_d_odd(i),
          Q2 => adcBA_d_even(i)
        );
  end generate;

        adcBA_delay: process(adcB_clk, rstn) begin
          if rstn = '0' then
            adcBA_d_even_ff <= (others => '0');
          else
            if rising_edge(adcB_clk) then
              for i in 0 to ADC_DATA_LINES-1 loop
                adcBA_d_even_ff(i) <= adcBA_d_even(i);
              end loop;
            end if;
          end if;
        end process;

        abcBA_align: process(adcB_clk, rstn) begin
          if rstn = '0' then
            adcBA_d <= (others => '0');
          else
            if rising_edge(adcB_clk) then
              for i in 0 to ADC_DATA_LINES-1 loop
                adcBA_d(2*i) <= adcBA_d_even_ff(i);
                adcBA_d(2*i+1) <= adcBA_d_odd(i);
              end loop;
            end if;
          end if;
        end process;

  adcBB_ddr_IN : for i in 0 to ADC_DATA_LINES-1 generate
        adcBB_ibufds : IBUFDS port map(
          I  => ADCBB_P(i),
          IB => ADCBB_N(i),
          O  => adcBB_ddr(i)
        );

        adcBB_iddre1 : IDDRE1 generic map (
          DDR_CLK_EDGE => "OPPOSITE_EDGE",
          IS_CB_INVERTED => '1',
          IS_C_INVERTED => '0'
        )
        port map (
          R  => not(rstn),
          C  => adcB_clk,
          CB => adcB_clk,
          D  => adcBB_ddr(i),
          Q1 => adcBB_d_odd(i),
          Q2 => adcBB_d_even(i)
        );
  end generate;

        adcBB_delay: process(adcB_clk, rstn) begin
          if rstn = '0' then
            adcBA_d_even_ff <= (others => '0');
          else
            if rising_edge(adcB_clk) then
              for i in 0 to ADC_DATA_LINES-1 loop
                adcBB_d_even_ff(i) <= adcBB_d_even(i);
              end loop;
            end if;
          end if;
        end process;

        abcBB_align: process(adcB_clk, rstn) begin
          if rstn = '0' then
            adcBB_d <= (others => '0');
          else
            if rising_edge(adcB_clk) then
              for i in 0 to ADC_DATA_LINES-1 loop
                adcBB_d(2*i) <= adcBB_d_even_ff(i);
                adcBB_d(2*i+1) <= adcBB_d_odd(i);
              end loop;
            end if;
          end if;
        end process;
  
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
      -- clk_int_A / clk_int_B (20MHz)
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
      CLKOUT2   => clk_int_A,
      CLKOUT2B  => clk_int_B,
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