library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity adc_chanell_pipeline is
    generic (
        ADC_RESOLUTION_BITS : integer := 14;
        NUM_PIPELINE_STAGES : integer := 2
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
end entity adc_chanell_pipeline;

architecture Behavioral of adc_chanell_pipeline is
    type reg_array is array (0 to NUM_PIPELINE_STAGES-1) of std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
    signal d_in0_reg, d_in1_reg, d_in2_reg, d_in3_reg : reg_array;

    type ovf_array is array (0 to NUM_PIPELINE_STAGES-1) of std_logic;
    signal ovf_reg : ovf_array;
begin

    gen_pipeline : for i in 0 to NUM_PIPELINE_STAGES-1 generate
    begin
        process(clk)
        begin
            if rising_edge(clk) then
                if rstn = '0' then
                    d_in0_reg(i) <= (others => '0');
                    d_in1_reg(i) <= (others => '0');
                    d_in2_reg(i) <= (others => '0');
                    d_in3_reg(i) <= (others => '0');
                    ovf_reg(i)   <= '0';
                else
                    if i = 0 then
                        d_in0_reg(i) <= d_in0;
                        d_in1_reg(i) <= d_in1;
                        d_in2_reg(i) <= d_in2;
                        d_in3_reg(i) <= d_in3;
                        ovf_reg(i)   <= ovf_in;
                    else
                        d_in0_reg(i) <= d_in0_reg(i-1);
                        d_in1_reg(i) <= d_in1_reg(i-1);
                        d_in2_reg(i) <= d_in2_reg(i-1);
                        d_in3_reg(i) <= d_in3_reg(i-1);
                        ovf_reg(i)   <= ovf_reg(i-1);
                    end if;
                end if;
            end if;
        end process;
    end generate;

    d_out0_p <= d_in0_reg(NUM_PIPELINE_STAGES-1);
    d_out1_p <= d_in1_reg(NUM_PIPELINE_STAGES-1);
    d_out2_p <= d_in2_reg(NUM_PIPELINE_STAGES-1);
    d_out3_p <= d_in3_reg(NUM_PIPELINE_STAGES-1);
    ovf      <= ovf_reg(NUM_PIPELINE_STAGES-1);

end architecture Behavioral;