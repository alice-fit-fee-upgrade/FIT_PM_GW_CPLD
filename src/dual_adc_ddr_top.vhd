library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dual_adc_ddr_top is
  generic (
    ADC_DATA_LINES      : integer := 7;
    ADC_RESOLUTION_BITS : integer := 14
  );
  port (
    rstn : in std_logic;

    ADCA_CLK_P : in std_logic;
    ADCA_CLK_N : in std_logic;

    ADCAA_D0_P : in std_logic; ADCAA_D0_N : in std_logic;
    ADCAA_D2_P : in std_logic; ADCAA_D2_N : in std_logic;
    ADCAA_D4_P : in std_logic; ADCAA_D4_N : in std_logic;
    ADCAA_D6_P : in std_logic; ADCAA_D6_N : in std_logic;
    ADCAA_D8_P : in std_logic; ADCAA_D8_N : in std_logic;
    ADCAA_D10_P : in std_logic; ADCAA_D10_N : in std_logic;
    ADCAA_D12_P : in std_logic; ADCAA_D12_N : in std_logic;

    ADCAB_D0_P : in std_logic; ADCAB_D0_N : in std_logic;
    ADCAB_D2_P : in std_logic; ADCAB_D2_N : in std_logic;
    ADCAB_D4_P : in std_logic; ADCAB_D4_N : in std_logic;
    ADCAB_D6_P : in std_logic; ADCAB_D6_N : in std_logic;
    ADCAB_D8_P : in std_logic; ADCAB_D8_N : in std_logic;
    ADCAB_D10_P : in std_logic; ADCAB_D10_N : in std_logic;
    ADCAB_D12_P : in std_logic; ADCAB_D12_N : in std_logic;

    ADCA_CLK : out std_logic;
    ADC_AA   : out std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
    ADC_AB   : out std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);

    ADCB_CLK_P : in std_logic;
    ADCB_CLK_N : in std_logic;

    ADCBA_D0_P : in std_logic; ADCBA_D0_N : in std_logic;
    ADCBA_D2_P : in std_logic; ADCBA_D2_N : in std_logic;
    ADCBA_D4_P : in std_logic; ADCBA_D4_N : in std_logic;
    ADCBA_D6_P : in std_logic; ADCBA_D6_N : in std_logic;
    ADCBA_D8_P : in std_logic; ADCBA_D8_N : in std_logic;
    ADCBA_D10_P : in std_logic; ADCBA_D10_N : in std_logic;
    ADCBA_D12_P : in std_logic; ADCBA_D12_N : in std_logic;

    ADCBB_D0_P : in std_logic; ADCBB_D0_N : in std_logic;
    ADCBB_D2_P : in std_logic; ADCBB_D2_N : in std_logic;
    ADCBB_D4_P : in std_logic; ADCBB_D4_N : in std_logic;
    ADCBB_D6_P : in std_logic; ADCBB_D6_N : in std_logic;
    ADCBB_D8_P : in std_logic; ADCBB_D8_N : in std_logic;
    ADCBB_D10_P : in std_logic; ADCBB_D10_N : in std_logic;
    ADCBB_D12_P : in std_logic; ADCBB_D12_N : in std_logic;

    ADCB_CLK : out std_logic;
    ADC_BA   : out std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
    ADC_BB   : out std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0)
  );
end dual_adc_ddr_top;


architecture RTL of dual_adc_ddr_top is

  signal adc_aa_p, adc_aa_n : std_logic_vector(ADC_DATA_LINES-1 downto 0);
  signal adc_ab_p, adc_ab_n : std_logic_vector(ADC_DATA_LINES-1 downto 0);

  signal adc_ba_p, adc_ba_n : std_logic_vector(ADC_DATA_LINES-1 downto 0);
  signal adc_bb_p, adc_bb_n : std_logic_vector(ADC_DATA_LINES-1 downto 0);

begin

  adc_aa_p <= (ADCAA_D12_P, ADCAA_D10_P, ADCAA_D8_P, ADCAA_D6_P, ADCAA_D4_P, ADCAA_D2_P, ADCAA_D0_P);
  adc_aa_n <= (ADCAA_D12_N, ADCAA_D10_N, ADCAA_D8_N, ADCAA_D6_N, ADCAA_D4_N, ADCAA_D2_N, ADCAA_D0_N);
  adc_ab_p <= (ADCAB_D12_P, ADCAB_D10_P, ADCAB_D8_P, ADCAB_D6_P, ADCAB_D4_P, ADCAB_D2_P, ADCAB_D0_P);
  adc_ab_n <= (ADCAB_D12_N, ADCAB_D10_N, ADCAB_D8_N, ADCAB_D6_N, ADCAB_D4_N, ADCAB_D2_N, ADCAB_D0_N);
  adc_ba_p <= (ADCBA_D12_P, ADCBA_D10_P, ADCBA_D8_P, ADCBA_D6_P, ADCBA_D4_P, ADCBA_D2_P, ADCBA_D0_P);
  adc_ba_n <= (ADCBA_D12_N, ADCBA_D10_N, ADCBA_D8_N, ADCBA_D6_N, ADCBA_D4_N, ADCBA_D2_N, ADCBA_D0_N);
  adc_bb_p <= (ADCBB_D12_P, ADCBB_D10_P, ADCBB_D8_P, ADCBB_D6_P, ADCBB_D4_P, ADCBB_D2_P, ADCBB_D0_P);
  adc_bb_n <= (ADCBB_D12_N, ADCBB_D10_N, ADCBB_D8_N, ADCBB_D6_N, ADCBB_D4_N, ADCBB_D2_N, ADCBB_D0_N);


  adc_a_inst : entity adc_ddr_top
    generic map (
      ADC_DATA_LINES      => ADC_DATA_LINES,
      ADC_RESOLUTION_BITS => ADC_RESOLUTION_BITS
    )
    port map (
      rstn      => rstn,
      ADC_CLK_N => ADCA_CLK_N,
      ADC_CLK_P => ADCA_CLK_P,
      ADC_A_N   => adc_aa_n,
      ADC_A_P   => adc_aa_p,
      ADC_B_N   => adc_ab_n,
      ADC_B_P   => adc_ab_p,
      ADC_CLK   => ADCA_CLK,
      ADC_A     => ADC_AA,
      ADC_B     => ADC_AB
    );

  adc_binst : entity adc_ddr_top
    generic map (
      ADC_DATA_LINES      => ADC_DATA_LINES,
      ADC_RESOLUTION_BITS => ADC_RESOLUTION_BITS
    )
    port map (
      rstn      => rstn,
      ADC_CLK_N => ADCB_CLK_N,
      ADC_CLK_P => ADCB_CLK_P,
      ADC_A_N   => adc_ba_n,
      ADC_A_P   => adc_ba_p,
      ADC_B_N   => adc_bb_n,
      ADC_B_P   => adc_bb_p,
      ADC_CLK   => ADCB_CLK,
      ADC_A     => ADC_BA,
      ADC_B     => ADC_BB
    );

end RTL;
