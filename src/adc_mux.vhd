library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity adc_mux is
    generic (
        ADC_RESOLUTION_BITS     : integer := 14;
        OVERFLOW_VAL            : std_logic_vector(13 downto 0) := "00000001111111"
    );
    Port (
        d_in_1 : in  std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
        d_in_2 : in  std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
        d_out : out  std_logic_vector(ADC_RESOLUTION_BITS downto 0)
    );
end adc_mux;

architecture Behavioral of adc_mux is 
    signal ovf_flag : std_logic := '0';
    signal d_out_raw : std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0) := (others => '0');

begin
    d_out <= ovf_flag & d_out_raw;

    process(d_in_1, d_in_2) begin

        if d_in_1 < OVERFLOW_VAL then
            d_out_raw <= d_in_1;
            ovf_flag <= '0';
        else
            d_out_raw <= d_in_2;
            ovf_flag <= '1';
        end if;

    end process;
end Behavioral;