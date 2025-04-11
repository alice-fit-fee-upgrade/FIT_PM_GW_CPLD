-- adc_chanell_avg.vhd
--
-- A module with a shift register (length `BUFFER_SIZE`) to which `d_in` is entered,
-- calculates the average of values stored in `x_d_buff` when a `init` or `done` signal arrives.
-- The `init` signal has a single clock length and indicates the start of the measurement
-- and the actual average value is stored in `x_init_d`
-- The `done` signal has a single clock length and arrives when the integration of the input signal
-- is complete and the output value is the subtraction of the actual value and `x_init_d`.
-- Overflow flags `ovf_in` are also stored in a buffer

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity adc_chanell_avg is
    generic(
        ADC_RESOLUTION_BITS     : integer := 14;
        BUFFER_SIZE             : integer := 4
    );
    port(
        clk         : in std_logic;
        rstn        : in std_logic;

        d_in0       : in std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
        d_in1       : in std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
        d_in2       : in std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
        d_in3       : in std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
        ovf_in      : in std_logic;

        init        : in std_logic;
        done        : in std_logic;
        
        init_d      : out std_logic_vector(ADC_RESOLUTION_BITS+1 downto 0);
        init_ovf    : out std_logic;
        done_d      : out std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
        done_ovf    : out std_logic
    );
end adc_chanell_avg;

architecture Behavioral of adc_chanell_avg is

    signal x_done_d : std_logic_vector(ADC_RESOLUTION_BITS+1 downto 0);
    signal x_init_d : std_logic_vector(ADC_RESOLUTION_BITS+1 downto 0);

begin
    done_d <= x_done_d(ADC_RESOLUTION_BITS+1 downto 2); -- shift by 2 bits to obtain average calculation for BUFFER_SIZE = 4
    init_d <= x_init_d;

    process(clk, rstn)
        variable temp_sum : unsigned(ADC_RESOLUTION_BITS+1 downto 0);
    begin

        if rstn = '0' then
            x_init_d <= (others => '0');
            init_ovf <= '0';
            x_done_d <= (others => '0');
            done_ovf <= '0';

        elsif rising_edge(clk) then
            
            if init = '1' then
                temp_sum := resize(unsigned(d_in0), 16) + resize(unsigned(d_in1), 16) + resize(unsigned(d_in2), 16) + resize(unsigned(d_in3), 16);
                x_init_d <= std_logic_vector(temp_sum);
                init_ovf <= ovf_in;

            elsif done = '1' then
                temp_sum := resize(unsigned(d_in0), 16) + resize(unsigned(d_in1), 16) + resize(unsigned(d_in2), 16) + resize(unsigned(d_in3), 16) - unsigned(x_init_d);
                x_done_d <= std_logic_vector(temp_sum);
                done_ovf <= ovf_in;
            end if;
        end if;
    
    end process;

end Behavioral;