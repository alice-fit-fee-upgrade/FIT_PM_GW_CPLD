library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;
library UNISIM;
use UNISIM.vcomponents.all;

entity adc_ddr_top is
  generic (
    ADC_DATA_LINES        : integer := 7;
    ADC_RESOLUTION_BITS   : integer := 14
  );
  port (
    rstn        :in std_logic;
    
    ADCA_CLK_N  : in std_logic;
    ADCA_CLK_P  : in std_logic;
    ADCAA_N     : in std_logic_vector (ADC_DATA_LINES-1 downto 0);
    ADCAA_P     : in std_logic_vector (ADC_DATA_LINES-1 downto 0);
    ADCAB_N     : in std_logic_vector (ADC_DATA_LINES-1 downto 0);
    ADCAB_P     : in std_logic_vector (ADC_DATA_LINES-1 downto 0);
    
    ADCA_CLK    : out std_logic;
    ADCAA       : out std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
    ADCAB       : out std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0)

  );
end adc_ddr_top;

architecture Frontend of adc_ddr_top is

  signal adcA_clk_buff : std_logic;
  signal adcA_clk_out  : std_logic;

  signal adcAA_ddr, adcAB_ddr : std_logic_vector(ADC_DATA_LINES-1 downto 0);

  signal adcAA_d_odd, adcAB_d_odd : std_logic_vector(ADC_DATA_LINES-1 downto 0);
  signal adcAA_d_even, adcAB_d_even : std_logic_vector(ADC_DATA_LINES-1 downto 0);
  signal adcAA_d_even_ff, adcAB_d_even_ff : std_logic_vector(ADC_DATA_LINES-1 downto 0);

  signal adcAA_d, adcAB_d : std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);

begin

  ADCAA <= adcAA_d;
  ADCAB <= adcAB_d;
  ADCA_CLK <= adcA_clk_out;

  adcA_clk_ibufds : IBUFDS port map(
    I  => ADCA_CLK_P,
    IB => ADCA_CLK_N,
    O  => adcA_clk_buff
  );

  adcA_clk_bufg : BUFG port map(
    I => adcA_clk_buff,
    O => adcA_clk_out
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
          C  => adcA_clk_out,
          CB => adcA_clk_out,
          D  => adcAA_ddr(i),
          Q1 => adcAA_d_odd(i),
          Q2 => adcAA_d_even(i)
        );
  end generate;

        adcAA_delay: process(adcA_clk_out, rstn) begin
          if rstn = '0' then
            adcAA_d_even_ff <= (others => '0');
          else
            if rising_edge(adcA_clk_out) then
              for i in 0 to ADC_DATA_LINES-1 loop
                adcAA_d_even_ff(i) <= adcAA_d_even(i);
              end loop;
            end if;
          end if;
        end process;

        abcAA_align: process(adcA_clk_out, rstn) begin
          if rstn = '0' then
            adcAA_d <= (others => '0');
          else
            if rising_edge(adcA_clk_out) then
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
          C  => adcA_clk_out,
          CB => adcA_clk_out,
          D  => adcAB_ddr(i),
          Q1 => adcAB_d_odd(i),
          Q2 => adcAB_d_even(i)
        );
  end generate;

        adcAB_delay: process(adcA_clk_out, rstn) begin
          if rstn = '0' then
            adcAB_d_even_ff <= (others => '0');
          else
            if rising_edge(adcA_clk_out) then
              for i in 0 to ADC_DATA_LINES-1 loop
                adcAB_d_even_ff(i) <= adcAB_d_even(i);
              end loop;
            end if;
          end if;
        end process;

        abcAB_align: process(adcA_clk_out, rstn) begin
          if rstn = '0' then
            adcAB_d <= (others => '0');
          else
            if rising_edge(adcA_clk_out) then
              for i in 0 to ADC_DATA_LINES-1 loop
                adcAB_d(2*i) <= adcAB_d_even_ff(i);
                adcAB_d(2*i+1) <= adcAB_d_odd(i);
              end loop;
            end if;
          end if;
        end process;


end Frontend;