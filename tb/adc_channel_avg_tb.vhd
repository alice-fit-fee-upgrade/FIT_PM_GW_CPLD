library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity adc_channel_avg_tb is
end adc_channel_avg_tb;

architecture Behavioral of adc_channel_avg_tb is

    constant CLK_PERIOD : time := 10 ns;
    signal clk_gen_en : boolean := true;

    constant ADC_RESOLUTION_BITS : integer := 14;
    constant BUFFER_SIZE : integer := 4;

    constant OVERFLOW_VAL : std_logic_vector(13 downto 0) := "00000001111111";

    signal clk          : std_logic := '0';
    signal rstn         : std_logic := '0';
    
    signal d_in1, d_in2 : std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0) := (others => '0');
    
    signal d_mux        : std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0) := (others => '0');
    signal ovf_mux      : std_logic;

    signal d_sr0, d_sr1, d_sr2, d_sr3 : std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
    signal ovf_sr       : std_logic;

    signal d_srp0, d_srp1, d_srp2, d_srp3 : std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
    signal ovf_srp      : std_logic;

    signal d_sum        : std_logic_vector(ADC_RESOLUTION_BITS+1 downto 0);
    
    signal init         : std_logic := '0';
    signal done         : std_logic := '0';
    
    signal init_sum     : std_logic_vector(ADC_RESOLUTION_BITS+1 downto 0);
    signal done_sum     : std_logic_vector(ADC_RESOLUTION_BITS+1 downto 0);

    signal init_ovf     : std_logic;
    signal d_out_avg    : std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
    signal d_valid      : std_logic;
    signal ovf          : std_logic;

    signal counter      : unsigned(ADC_RESOLUTION_BITS-1 downto 0) := (others => '0');

    signal s_data_sum_check : unsigned(ADC_RESOLUTION_BITS+1 downto 0);
    signal s_init_sum_check : unsigned(ADC_RESOLUTION_BITS+1 downto 0);

    component adc_channel_mux
        generic(
            ADC_RESOLUTION_BITS     : integer := 14;
            OVERFLOW_VAL            : std_logic_vector(13 downto 0) := "00000001111111"
        );
        port(
            d_in1       : in std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
            d_in2       : in std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);

            d_out       : out std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
            ovf         : out std_logic
        );
    end component;

    component adc_channel_shift_reg
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
    end component;

component adc_channel_pipeline
    generic (
        ADC_RESOLUTION_BITS : integer := 14
    );
    port (
        clk         : in std_logic;
        rstn        : in std_logic;

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
end component;

    component adc_channel_avg
        generic(
            ADC_RESOLUTION_BITS     : integer := 14;
            BUFFER_SIZE             : integer := 4
        );
        port (
            clk         : in std_logic;
            rstn        : in std_logic;
    
            d_in0       : in std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
            d_in1       : in std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
            d_in2       : in std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
            d_in3       : in std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
            ovf_in      : in std_logic;

            d_sum       : out std_logic_vector(ADC_RESOLUTION_BITS+1 downto 0);
    
            init        : in std_logic;
            done        : in std_logic;
            
            init_sum    : out std_logic_vector(ADC_RESOLUTION_BITS+1 downto 0);
            done_sum    : out std_logic_vector(ADC_RESOLUTION_BITS+1 downto 0);
            init_ovf    : out std_logic;
            d_out_avg   : out std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
            d_valid     : out std_logic;
            ovf         : out std_logic
        );
    end component;

begin

    mux_0: adc_channel_mux
        generic map(
            ADC_RESOLUTION_BITS => ADC_RESOLUTION_BITS,
            OVERFLOW_VAL => OVERFLOW_VAL
        )
        port map (
            d_in1       => d_in1,
            d_in2       => d_in2,

            d_out       => d_mux,
            ovf         => ovf_mux
        );

    shift_reg_0: adc_channel_shift_reg
        generic map(
            ADC_RESOLUTION_BITS => ADC_RESOLUTION_BITS,
            BUFFER_SIZE => BUFFER_SIZE
        )
        port map(
            clk         => clk,
            rstn        => rstn,
    
            d_in        => d_mux,
            ovf_in      => ovf_mux,
    
            d_out0      => d_sr0,
            d_out1      => d_sr1,
            d_out2      => d_sr2,
            d_out3      => d_sr3,
            ovf         => ovf_sr
        );

    avg_0: adc_channel_avg
        generic map(
            ADC_RESOLUTION_BITS => ADC_RESOLUTION_BITS,
            BUFFER_SIZE => BUFFER_SIZE
        )
        port map (
            clk         => clk,
            rstn        => rstn,
    
            d_in0       => d_sr0,
            d_in1       => d_sr1,
            d_in2       => d_sr2,
            d_in3       => d_sr3,
            ovf_in      => ovf_sr,

            d_sum       => d_sum,
    
            init        => init,
            done        => done,
            
            init_sum    => init_sum,
            done_sum    => done_sum,

            init_ovf    => init_ovf,
            d_out_avg   => d_out_avg,
            d_valid     => d_valid,
            ovf         => ovf
        );

    d_in1 <= std_logic_vector(counter);
    d_in2 <= std_logic_vector(counter);

    clk_process : process
    begin
        counter <= (others => '0');
        while clk_gen_en loop
            counter <= (counter + x"1");
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

        wait for CLK_PERIOD * 8;
        init <= '1';
        wait for CLK_PERIOD;
        init <= '0';

        wait for CLK_PERIOD * 4;
        done <= '1';
        wait for CLK_PERIOD;
        done <= '0';
        wait for CLK_PERIOD * 4;
        clk_gen_en <= false;
        report "Adc channel simulatoin finished";
        wait;

    end process;

    data_sum : process
        variable data_sum_check : unsigned(ADC_RESOLUTION_BITS+1 downto 0);
    begin
        wait until falling_edge(clk);
        data_sum_check := resize(unsigned(d_sr0), 16) + resize(unsigned(d_sr1), 16) +
                    resize(unsigned(d_sr2), 16) + resize(unsigned(d_sr3), 16);
        s_data_sum_check <= data_sum_check;
    end process;
    
    init_sum_check : process
    begin
        wait until rising_edge(init);
        wait for 2 ns;
        s_init_sum_check <= s_data_sum_check;
        report "Init sum in testbench " & integer'image(to_integer(s_data_sum_check))
                & " sum in logic " & integer'image(to_integer(unsigned(init_sum)));
    end process;

    done_sum_check : process
    begin
        wait until rising_edge(d_valid);
        wait for 2 ns;
        report "(Done sum - Init sum) in testbench " & integer'image(to_integer(s_data_sum_check - s_init_sum_check))
                & " sum in logic " & integer'image(to_integer(unsigned(done_sum)));
        report "Average in testbench " & integer'image(to_integer((s_data_sum_check - s_init_sum_check)/4))
                & " average in logic " & integer'image(to_integer(unsigned(d_out_avg)));
    end process;

end Behavioral;