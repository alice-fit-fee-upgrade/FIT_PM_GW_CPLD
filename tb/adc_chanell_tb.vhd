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

    constant OVERFLOW_VAL : std_logic_vector(13 downto 0) := "00000001111111";

    signal clk          : std_logic := '0';
    signal rstn         : std_logic := '0';

    signal init         : std_logic := '0';
    signal done         : std_logic := '0';

    signal d_in1        : std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0) := (others => '0');
    signal d_in2        : std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0) := (others => '0');

    signal d_mux_out    : std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0) := (others => '0');
    signal ovf_mux_out  : std_logic;
    
    signal d_out        : std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
    signal ovf_out      : std_logic;

    signal counter      : unsigned(ADC_RESOLUTION_BITS-1 downto 0) := (others => '0');

    component adc_mux
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
    end component;

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
            
            init       : in  std_logic;
            done        : in  std_logic;
            
            d_out       : out std_logic_vector(13 downto 0);
            ovf         : out std_logic
        );
    end component;

begin

    mux: adc_mux
        generic map(
            ADC_RESOLUTION_BITS => ADC_RESOLUTION_BITS,
            OVERFLOW_VAL => OVERFLOW_VAL
        )
        port map (
            d_in_1      => d_in1,
            d_in_2      => d_in2,

            d_out       => d_mux_out,
            ovf         => ovf_mux_out
        );

    avg: adc_avg
        generic map(
            ADC_RESOLUTION_BITS => ADC_RESOLUTION_BITS,
            BUFFER_SIZE => BUFFER_SIZE
        )
        port map (
            clk         => clk,
            rstn        => rstn,
            
            d_in        => d_mux_out,
            ovf_in      => ovf_mux_out,

            init        => init,
            done        => done,
            
            d_out       => d_out,
            ovf         => ovf_out
        );

    d_in1 <= std_logic_vector(counter);
    d_in2 <= std_logic_vector(counter);

    clk_process : process
    begin
        counter <= (others => '0');
        while clk_gen_en loop
            counter <= (counter + x"AA");
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

        wait for CLK_PERIOD * 10;
        init <= '1';
        wait for CLK_PERIOD;
        init <= '0';

        wait for CLK_PERIOD * 10;
        done <= '1';
        wait for CLK_PERIOD;
        done <= '0';
        wait for CLK_PERIOD * 5;
        clk_gen_en <= false;
        report "Adc chanell simulatoin finished";
        wait;

    end process;

end Behavioral;