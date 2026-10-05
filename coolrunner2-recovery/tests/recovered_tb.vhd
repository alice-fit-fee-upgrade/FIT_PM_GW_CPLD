library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use std.textio.all;
use std.env.all;
entity recovered_tb is
  generic(vector_path:string:="../../tests/vectors.txt");
end;
architecture test of recovered_tb is
  signal clk80, str, ena, ev : std_logic := '0';
  signal a,b : std_logic_vector(11 downto 0) := (others=>'0');
  signal dout : std_logic_vector(12 downto 0);
  signal c40,c20p,c20n,dv,evo : std_logic;
  function bit(v:integer) return std_logic is
  begin if v=0 then return '0';else return '1';end if;end;
begin
  dut:entity work.amplcpld port map(CLK80=>clk80,STR=>str,ENA=>ena,EV=>ev,ADC0=>a,ADC1=>b,DOUT=>dout,CLK40=>c40,CLK20_P=>c20p,CLK20_N=>c20n,DV=>dv,EV_out=>evo);
  process
    file vectors:text open read_mode is vector_path;
    variable l:line;
    type vals is array(0 to 11) of integer;
    variable v:vals;
    variable n:integer:=0;
  begin
    while not endfile(vectors) loop
      readline(vectors,l);
      for i in v'range loop read(l,v(i));end loop;
      clk80<=bit(v(0));str<=bit(v(1));ena<=bit(v(2));ev<=bit(v(3));
      a<=std_logic_vector(to_unsigned(v(4),12));b<=std_logic_vector(to_unsigned(v(5),12));
      wait for 1 ns;
      assert c40=bit(v(6)) and c20p=bit(v(7)) and c20n=bit(v(8)) and dv=bit(v(9)) and evo=bit(v(10)) and dout=std_logic_vector(to_unsigned(v(11),13))
        report "Golden mismatch at vector " & integer'image(n) severity failure;
      n:=n+1;wait for 5 ns;
    end loop;
    report "PASS: " & integer'image(n) & " golden vectors" severity note;
    finish;
  end process;
end;
