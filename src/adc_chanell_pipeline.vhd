library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity adc_chanell_pipeline is
    generic (
        ADC_RESOLUTION_BITS : integer := 14
    );
    port (
        clk         : in std_logic;

        d_in0       : in std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
        d_in1       : in std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
        d_in2       : in std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
        d_in3       : in std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
        ovf_in      : in std_logic;

        d_out0_p    : out std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
        d_out1_p    : out std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
        d_out2_p    : out std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
        d_out3_p    : out std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
        ovf         : out std_logic
    );
end entity adc_chanell_pipeline;

architecture Behavioral of adc_chanell_pipeline is
    signal d_in0_reg, d_in1_reg, d_in2_reg, d_in3_reg : std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
    signal ovf_reg : std_logic;
begin

    process(clk) begin
        
        if rising_edge(clk) then
            d_in0_reg <= d_in0;
            d_in1_reg <= d_in1;
            d_in2_reg <= d_in2;
            d_in3_reg <= d_in3;
            ovf_reg <= ovf_in;
        end if;
    end process;

    d_out0_p <= d_in0_reg;
    d_out1_p <= d_in1_reg;
    d_out2_p <= d_in2_reg;
    d_out3_p <= d_in3_reg;
    ovf <= ovf_reg;

end architecture Behavioral;
