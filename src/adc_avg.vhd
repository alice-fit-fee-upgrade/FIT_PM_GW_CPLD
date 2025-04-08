library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity adc_avg is
    generic(
        ADC_RESOLUTION_BITS     : integer := 14;
        BUFFER_SIZE             : integer := 4
    );
    port(
        clk         : in std_logic;
        rstn        : in std_logic;

        d_in        : in std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
        ovf_in      : in std_logic;

        start       : in std_logic;
        done        : in std_logic;
        
        d_out       : out std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
        ovf         : out std_logic
    );
end adc_avg;

architecture Behavioral of adc_avg is

    type data_buffer_type is array (0 to BUFFER_SIZE - 1) of std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
    type flag_buffer_type is array (0 to BUFFER_SIZE - 1) of std_logic;

    signal x_d_buff         : data_buffer_type := (others => (others => '0'));
    signal x_init_d         : std_logic_vector(ADC_RESOLUTION_BITS+1 downto 0);
    signal x_ovf_buff       : flag_buffer_type := (others => '0');
    signal x_init_ovf       : std_logic;

begin
    ovf <= x_ovf_buff(0) or x_ovf_buff(1) or x_ovf_buff(2) or x_ovf_buff(3);

    process(clk, rstn)
        variable x_init_d_temp : unsigned(15 downto 0);
    begin

        if rstn = '0' then
            x_d_buff <= (others => (others => '0'));
            x_init_d <= (others => '0');
            x_ovf_buff <= (others => '0');
            x_init_ovf <= '0';

        elsif rising_edge(clk) then
            for i in BUFFER_SIZE - 1 downto 1 loop
                x_d_buff(i) <= x_d_buff(i - 1);
                x_ovf_buff(i) <= x_ovf_buff(i - 1);
            end loop;
            x_d_buff(0) <= d_in;
            x_ovf_buff(0) <= ovf_in;

            if start = '1' then
                x_init_d_temp := (others => '0');
                for i in 0 to BUFFER_SIZE - 1 loop
                    x_init_d_temp := x_init_d_temp + unsigned(x_d_buff(i));
                end loop;

                x_init_d <= std_logic_vector(x_init_d_temp(ADC_RESOLUTION_BITS+1 downto 0));
                x_init_ovf <= ovf;
            end if;
        end if;
    
    end process;

end Behavioral;