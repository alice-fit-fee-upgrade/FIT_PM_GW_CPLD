library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity cnt2_tb is
end;

architecture bench of cnt2_tb is

  constant CLK_PERIOD : time := 10 ns;

  signal clk : std_logic;
  signal o : std_logic_vector (1 downto 0);

  component cnt2 
    port(
      clk     : in std_logic;
      o       : out std_logic_vector (1 downto 0)
    );
  end component;

begin

  cnt2_inst : cnt2
  port map (
    clk => clk,
    o => o
  );

  clock_gen: process begin
      
    for i in 0 to 9 loop
      clk <= '0';
      wait for CLK_PERIOD / 2;
      clk <= '1';
      wait for CLK_PERIOD / 2;
      report "Cnt2 simulatoin finished";
    end loop;
    wait;
end process;


end;