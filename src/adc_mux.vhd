library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity adc_mux is
    generic(
        ADC_RESOLUTION_BITS     : integer := 14;
        OVERFLOW_VAL            : std_logic_vector(13 downto 0) := "00000001111111"
    );
    port(
        d_in_1      : in std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
        d_in_2      : in std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
        d_out       : out std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
        ovf         : out std_logic
    );
end adc_mux;

architecture Behavioral of adc_mux is 
    signal x_ovf    : std_logic := '0';
    signal x_d_out  : std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0) := (others => '0');

begin
    d_out <= x_d_out;
    ovf <= x_ovf;

    process(d_in_1, d_in_2) begin

        if d_in_1 < OVERFLOW_VAL then
            x_d_out <= d_in_1;
            x_ovf <= '0';
        else
            x_d_out <= d_in_2;
            x_ovf <= '1';
        end if;

    end process;

end Behavioral;