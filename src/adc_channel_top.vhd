library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity adc_channel is
    generic(
        ADC_RESOLUTION_BITS     : integer := 14;
        OVERFLOW_VAL            : std_logic_vector(13 downto 0) := "00000001111111"
    );
    port(
        adc_clk     : in std_logic;
        adc_rstn    : in std_logic;
        d_in1       : in std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
        d_in2       : in std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);

        init        : in std_logic;
        done        : in std_logic;

        d_sum       : out std_logic_vector(ADC_RESOLUTION_BITS+1 downto 0); 

        d_out_avg   : out std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
        ovf         : out std_logic
    );
end adc_channel;
    
architecture Behavioral of adc_channel is

constant BUFFER_SIZE : integer := 4;

signal d_mux        : std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0) := (others => '0');
signal ovf_mux      : std_logic;

signal d_sr0, d_sr1, d_sr2, d_sr3 : std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
signal ovf_sr       : std_logic;

signal init_sum     : std_logic_vector(ADC_RESOLUTION_BITS+1 downto 0);
signal done_sum     : std_logic_vector(ADC_RESOLUTION_BITS+1 downto 0);
signal init_ovf     : std_logic;

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
        done_ovf    : out std_logic
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
            clk         => adc_clk,
            rstn        => adc_rstn,
    
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
            clk         => adc_clk,
            rstn        => adc_rstn,
    
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
            done_ovf    => ovf
        );

end Behavioral;