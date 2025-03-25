library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_unsigned.all;
library UNISIM;
use UNISIM.vcomponents.all;

entity iddre1_tb is
end;

architecture bench of iddre1_tb is

  constant CLK_PERIOD : time := 10 ns;
  constant DATA_W : integer := 8;

  signal clk : std_logic;
  signal rstn : std_logic;
  signal data_in : std_logic_vector (DATA_W-1 downto 0);
  signal data_out_f, data_out_f_ff : std_logic_vector (DATA_W-1 downto 0);
  signal data_out_r : std_logic_vector (DATA_W-1 downto 0);
  signal data_out : std_logic_vector (2*DATA_W-1 downto 0);

begin

  --clk_n <= not(clk);

  ddr_data : for i in 0 to DATA_W-1 generate

    iddre1_inst : IDDRE1 generic map (
      DDR_CLK_EDGE => "OPPOSITE_EDGE",
      IS_CB_INVERTED => '1',
      IS_C_INVERTED => '0'
    )
    port map (
      R  => not(rstn),
      C  => clk,
      CB => clk,
      D  => data_in(i),
      Q1 => data_out_r(i),
      Q2 => data_out_f(i)
    );
  end generate;

  clock_gen: process begin
    data_in <= x"00";
    clk <= '0';
    rstn <= '0';
    wait for CLK_PERIOD;
    rstn <= '1';
    wait for CLK_PERIOD;
      
    for i in 0 to 9 loop
      data_in <= x"00" + i;
      clk <= '0';
      wait for CLK_PERIOD / 2;
      data_in <= x"F0" + i;
      clk <= '1';
      wait for CLK_PERIOD / 2;
      report "Cnt2 simulatoin finished";
    end loop;
    wait;

  end process;

  delay_process: process(clk, rstn) begin
    if rstn = '0' then
      data_out_f_ff <= (others => '0');
    else
      if rising_edge(clk) then
        for i in 0 to DATA_W-1 loop
          data_out_f_ff(i) <= data_out_f(i);
        end loop;
      end if;
    end if;
  end process;

  ff_process: process(clk, rstn) begin
    if rstn = '0' then
      data_out <= (others => '0');
    else
      if rising_edge(clk) then
        for i in 0 to DATA_W-1 loop
          data_out(2*i) <= data_out_f_ff(i);
          data_out(2*i+1) <= data_out_r(i);
        end loop;
      end if;
    end if;
  end process;

end;