library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity ampl_logic_tb is
end;

architecture bench of ampl_logic_tb is

  constant CLK_PERIOD : time := 12.5 ns;
  constant CLK_SHIFT : time := 12.5 ns/2 - 2 ns; -- rising edge is 2 ns quicker than clk20 rising edge
  constant ADC_PIPELINE_DELAY : integer := 7;
  constant ADC_RESOLUTION : integer := 12;  

  type shift_array is array (0 to ADC_PIPELINE_DELAY-1) of std_logic_vector(ADC_RESOLUTION-1 downto 0);

  signal clk80            : std_logic := '0';
  signal clk80_shifted    : std_logic := '0';
  signal rstn             : std_logic := '0';

  signal clk40            : std_logic := '0';
  signal gate_str1_i      : std_logic := '0';
  signal clk20            : std_logic := '0';
  signal clk20n           : std_logic := '0';

  signal int_a           : std_logic_vector (ADC_RESOLUTION-1 downto 0) := (others => '0');
  signal int_b           : std_logic_vector (ADC_RESOLUTION-1 downto 0) := (others => '0');
  signal data_out         : std_logic_vector (ADC_RESOLUTION downto 0) := (others => '0');

  signal adc_a_pipeline   : shift_array := (others => (others => '0'));
  signal adc_b_pipeline   : shift_array := (others => (others => '0'));
  signal adc_a_val        : std_logic_vector(ADC_RESOLUTION-1 downto 0) := (others => '0');
  signal adc_b_val        : std_logic_vector(ADC_RESOLUTION-1 downto 0) := (others => '0');

  signal CFD_out          : std_logic := '0';
  signal dv               : std_logic := '0';
  signal gate_str1_o      : std_logic := '0';
  signal evnt             : std_logic := '0';
  signal evout            : std_logic := '0';

  signal gate_strobe      : std_logic := '0';
  signal clk_gen_en       : boolean := true;

begin

  ampl_logic_0 : entity work.ampl_logic
  port map (
    clk80 => clk80,
    rstn => rstn,

    clk40 => clk40,
    clk20 => clk20,
    clk20n => clk20n,

    data_a => adc_a_val,
    data_b => adc_b_val,
    data_out => data_out,

    strb => CFD_out,
    dv => dv,
    en => gate_str1_o,
    evnt => evnt,
    evout => evout
  );

  clock_gen: process begin
    wait for CLK_SHIFT;  
    while clk_gen_en loop
      clk80_shifted <= '0';
      wait for CLK_PERIOD/2;
      clk80_shifted <= '1';
      wait for CLK_PERIOD/2;
    end loop;
    wait;
  end process;

  clock_shifted_gen: process begin
      
    while clk_gen_en loop
      clk80 <= '0';
      wait for CLK_PERIOD/2;
      clk80 <= '1';
      wait for CLK_PERIOD/2;
    end loop;
    wait;
  end process;

  gate_str1_i <= clk40;

  gate_strobe_signal: process begin
    while true loop
          wait until rising_edge(gate_str1_i);
          wait for 10 ns;
          gate_strobe <= '1';
          wait until falling_edge(gate_str1_i);
          wait for 2 ns;
          gate_strobe <= '0';
    end loop;
  end process;

  strb_latch: process (CFD_out) begin
    if rstn = '0' then
      gate_str1_o <= '0';
    elsif rising_edge(CFD_out) then
      gate_str1_o <= gate_strobe;
    end if;
  end process;

  integrator_values: process
    variable a : unsigned(ADC_RESOLUTION-1 downto 0) := (others => '0');
    variable b : unsigned(ADC_RESOLUTION-1 downto 0) := (others => '1');
  begin
    while clk_gen_en loop
      wait until rising_edge(clk20) or rising_edge(clk20n);
      int_a <= std_logic_vector(unsigned(a)) when clk20n = '0' else (others => '0');
      int_b <= std_logic_vector(unsigned(b)) when clk20 = '0' else (others => '0');
      a := a + 1;
      b := b - 1;
    end loop;
    wait;
  end process;

  adc_pipeline : process
    variable adc_a_val_pipeline : shift_array := (others => (others => '0'));
    variable adc_b_val_pipeline : shift_array := (others => (others => '0'));
  begin
      while true loop
          wait until rising_edge(clk80_shifted);
          
          for i in ADC_PIPELINE_DELAY-1 downto 1 loop
            adc_a_val_pipeline(i) := adc_a_val_pipeline(i-1);
            adc_b_val_pipeline(i) := adc_b_val_pipeline(i-1);
          end loop;
            
          adc_a_val_pipeline(0) := int_a;
          adc_b_val_pipeline(0) := int_b;

          adc_a_val <= adc_a_val_pipeline(ADC_PIPELINE_DELAY-1);
          adc_b_val <= adc_b_val_pipeline(ADC_PIPELINE_DELAY-1);

          adc_a_pipeline <= adc_a_val_pipeline;
          adc_b_pipeline <= adc_b_val_pipeline;
      end loop;
  end process;

  stimulus: process
    variable rand       : real;
    variable delay_time : time;
    variable seed1, seed2 : positive := 12345;
  begin
    evnt <= '0';
    -- baseline measurement
    -- rstn <= '0';
    -- CFD_out <= '0';
    -- wait for CLK_PERIOD/2;
    -- rstn <= '1';
    -- evnt <= '0';
    -- wait for CLK_PERIOD*2;
    -- evnt <= '1';
    -- wait until evout = '1';
    -- wait for CLK_PERIOD*20;

    -- CFD_out pulse no 1
    rstn <= '0';
    wait for CLK_PERIOD;
    evnt <= '0';
    wait for CLK_PERIOD;
    rstn <= '1';
    wait for CLK_PERIOD*8;
    wait until rising_edge(gate_strobe);
    uniform(seed1, seed2, rand);
    delay_time := (1.0 + rand * 2.0) * 1 ns;
    wait for delay_time;
    CFD_out <= '1';
    uniform(seed1, seed2, rand);
    delay_time := (3.0 + rand * 7.0) * 1 ns;
    wait for delay_time;
    CFD_out <= '0';
    wait until rising_edge(clk80);
    wait for CLK_PERIOD*20;

    -- CFD_out pulse no 2
    wait until rising_edge(gate_strobe);
    uniform(seed1, seed2, rand);
    delay_time := (1.0 + rand * 2.0) * 1 ns;
    wait for delay_time;
    CFD_out <= '1';
    uniform(seed1, seed2, rand);
    delay_time := (3.0 + rand * 7.0) * 1 ns;
    wait for delay_time;
    CFD_out <= '0';
    wait until rising_edge(clk80);

    -- wait until dv = '1';
    wait for CLK_PERIOD*10;
    clk_gen_en <= false;

    wait;
  end process;

end;