library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity adc_chanell_shift_reg is
    generic(
        ADC_RESOLUTION_BITS     : integer := 14;
        BUFFER_SIZE             : integer := 4
    );
    port(
        clk         : in std_logic;
        rstn        : in std_logic;

        d_in        : in std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
        ovf_in      : in std_logic;

        d_out0      : out std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
        d_out1      : out std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
        d_out2      : out std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
        d_out3      : out std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
        ovf         : out std_logic
    );
end adc_chanell_shift_reg;

architecture Behavioral of adc_chanell_shift_reg is

    type data_buffer_type is array (0 to BUFFER_SIZE - 1) of std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
    type flag_buffer_type is array (0 to BUFFER_SIZE - 1) of std_logic;

    signal x_d_buff         : data_buffer_type := (others => (others => '0'));
    signal x_ovf_buff       : flag_buffer_type := (others => '0');

begin
    ovf <= x_ovf_buff(0) or x_ovf_buff(1) or x_ovf_buff(2) or x_ovf_buff(3);
    d_out0 <= x_d_buff(0);
    d_out1 <= x_d_buff(1);
    d_out2 <= x_d_buff(2);
    d_out3 <= x_d_buff(3);

    process(clk, rstn) begin

        if rstn = '0' then
            for i in 0 to BUFFER_SIZE-1 loop
                x_d_buff(i) <= (others => '0');
            end loop;
            x_ovf_buff <= (others => '0');
            
        elsif rising_edge(clk) then
            for i in BUFFER_SIZE-1 downto 1 loop
                x_d_buff(i) <= x_d_buff(i-1);
                x_ovf_buff(i) <= x_ovf_buff(i - 1);
            end loop;
            x_d_buff(0) <= d_in;
            x_ovf_buff(0) <= ovf_in;
        end if;
    end process;

end Behavioral;
