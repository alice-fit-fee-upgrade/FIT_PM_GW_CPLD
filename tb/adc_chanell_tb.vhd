library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity adc_chanell_tb is
end adc_chanell_tb;

architecture Behavioral of adc_chanell_tb is

    constant CLK_PERIOD : time := 10 ns;
    signal clk_gen_en : boolean := true;

    constant ADC_RESOLUTION_BITS : integer := 14;
    constant BUFFER_SIZE : integer := 4;

    signal clk          : std_logic := '0';
    signal rstn         : std_logic := '0';

    signal start        : std_logic := '0';
    signal done         : std_logic := '0';

    signal d_in         : std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0) := (others => '0');
    signal ovf_in       : std_logic := '0';
    signal d_out        : std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
    signal ovf_out      : std_logic;

    signal counter      : unsigned(ADC_RESOLUTION_BITS-1 downto 0) := (others => '0');

    component adc_avg
        generic(
            ADC_RESOLUTION_BITS     : integer := 14;
            BUFFER_SIZE             : integer := 4
        );
        port (
            clk         : in  std_logic;
            rstn        : in  std_logic;
            
            d_in        : in  std_logic_vector(13 downto 0);
            ovf_in      : in  std_logic;
            
            start       : in  std_logic;
            done        : in  std_logic;
            
            d_out       : out std_logic_vector(13 downto 0);
            ovf         : out std_logic
        );
    end component;

begin

    uut: adc_avg
        generic map(
            ADC_RESOLUTION_BITS => ADC_RESOLUTION_BITS,
            BUFFER_SIZE => BUFFER_SIZE
        )
        port map (
            clk         => clk,
            rstn        => rstn,
            
            d_in        => d_in,
            ovf_in      => ovf_in,

            start       => start,
            done        => done,
            
            d_out       => d_out,
            ovf         => ovf_out
        );

    d_in <= std_logic_vector(counter);
    clk_process : process
    begin
        counter <= (others => '0');
        while clk_gen_en loop
            counter <= counter + 1;
            clk <= '1';
            wait for CLK_PERIOD / 2;
            clk <= '0';
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;

    stim_proc : process
    begin

        wait for 20 ns;
        rstn <= '1';
        ovf_in <= '0';

        wait for CLK_PERIOD * 5;
        start <= '1';
        wait for CLK_PERIOD;
        start <= '0';

        wait for 50 ns;
        clk_gen_en <= false;
        report "Adc chanell simulatoin finished";
        wait;

    end process;

end Behavioral;