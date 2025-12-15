-- adc_processing.vhd
--
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity adc_processing is
    generic(
        ADC_RESOLUTION_BITS     : integer := 14
    );
    port(
        clk                     : in std_logic;
        rstn                    : in std_logic;

        d_in                    : in std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
        d_out_avg               : out std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0)
    );
end adc_processing;

architecture Behavioral of adc_processing is

    type data_tab_t is array (0 to 3) of std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
    signal data_tab : data_tab_t;
    signal data_sum : std_logic_vector(ADC_RESOLUTION_BITS+1 downto 0);

begin
     -- dividing by 4
    d_out_avg <= data_sum(ADC_RESOLUTION_BITS+1 downto 2);

    -- sum of all values in the array
    data_sum <= std_logic_vector(unsigned(data_tab(0)) + unsigned(data_tab(1)) + unsigned(data_tab(2)) + unsigned(data_tab(3)));

    -- shift register
    process(clk, rstn)
    begin
        if rstn = '0' then
            data_tab <= (others => (others => '0'));
        elsif rising_edge(clk) then
            data_tab(3 downto 1) <= data_tab(2 downto 0);
            data_tab(0) <= d_in;
        end if;
    end process;

end Behavioral;