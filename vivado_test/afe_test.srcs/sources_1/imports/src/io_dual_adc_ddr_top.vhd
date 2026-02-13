library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity io_dual_adc_ddr_top is
  generic (
    ADC_DATA_LINES      : integer := 7;
    ADC_RESOLUTION_BITS : integer := 14
  );
  port (
    rstn : in std_logic;


    
    ADC_A_CLK_P         : in std_logic;
    ADC_A_CLK_N         : in std_logic;

    ADC_AA_P, ADC_AA_N  : std_logic_vector(ADC_DATA_LINES-1 downto 0);
    ADC_AB_P, ADC_AB_N  : std_logic_vector(ADC_DATA_LINES-1 downto 0);
    
    ADC_A_CLK           : out std_logic;
    ADC_AA              : out std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
    ADC_AB              : out std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
    


    ADC_B_CLK_P         : in std_logic;
    ADC_B_CLK_N         : in std_logic;

    ADC_BA_P, ADC_BA_N  : std_logic_vector(ADC_DATA_LINES-1 downto 0);
    ADC_BB_P, ADC_BB_N  : std_logic_vector(ADC_DATA_LINES-1 downto 0);

    ADC_B_CLK           : out std_logic;
    ADC_BA              : out std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
    ADC_BB              : out std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0)
  );
end io_dual_adc_ddr_top;


architecture RTL of io_dual_adc_ddr_top is

component adc_ddr_top
  generic (
    ADC_DATA_LINES      : integer := 7;
    ADC_RESOLUTION_BITS : integer := 14
  );
  port (
    rstn      : in std_logic;

    ADC_CLK_N : in std_logic;
    ADC_CLK_P : in std_logic;

    ADC_A_N   : in std_logic_vector(ADC_DATA_LINES-1 downto 0);
    ADC_A_P   : in std_logic_vector(ADC_DATA_LINES-1 downto 0);

    ADC_B_N   : in std_logic_vector(ADC_DATA_LINES-1 downto 0);
    ADC_B_P   : in std_logic_vector(ADC_DATA_LINES-1 downto 0);

    ADC_CLK   : out std_logic;
    ADC_A     : out std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
    ADC_B     : out std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0)
  );
end component;

begin

  adc_a_inst : adc_ddr_top
    generic map (
      ADC_DATA_LINES      => ADC_DATA_LINES,
      ADC_RESOLUTION_BITS => ADC_RESOLUTION_BITS
    )
    port map (
      rstn      => rstn,
      ADC_CLK_N => ADC_A_CLK_N,
      ADC_CLK_P => ADC_A_CLK_P,
      ADC_A_N   => ADC_AA_N,
      ADC_A_P   => ADC_AA_P,
      ADC_B_N   => ADC_AB_N,
      ADC_B_P   => ADC_AB_P,
      ADC_CLK   => ADC_A_CLK,
      ADC_A     => ADC_AA,
      ADC_B     => ADC_AB
    );

  adc_binst : adc_ddr_top
    generic map (
      ADC_DATA_LINES      => ADC_DATA_LINES,
      ADC_RESOLUTION_BITS => ADC_RESOLUTION_BITS
    )
    port map (
      rstn      => rstn,
      ADC_CLK_N => ADC_B_CLK_N,
      ADC_CLK_P => ADC_B_CLK_P,
      ADC_A_N   => ADC_BA_N,
      ADC_A_P   => ADC_BA_P,
      ADC_B_N   => ADC_BB_N,
      ADC_B_P   => ADC_BB_P,
      ADC_CLK   => ADC_B_CLK,
      ADC_A     => ADC_BA,
      ADC_B     => ADC_BB
    );

end RTL;
