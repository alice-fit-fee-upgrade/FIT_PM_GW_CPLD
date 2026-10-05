-- FIT PM12 golden-readback recovery. Target XC2C128-7-VQ100.
-- Architecture and signal names follow the historical amplcpld.vhd.
-- Register locations and initialization were recovered from JEDEC.
-- See decoded/state_map.json and tests/transition-proof.json.
-- ISE 14.7 + amplcpld.ucf reproduces all 55341 golden configuration fuses.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity amplcpld is
  port (
    CLK80, STR, ENA, EV : in std_logic;
    ADC0, ADC1 : in std_logic_vector(11 downto 0);
    DOUT : out std_logic_vector(12 downto 0);
    CLK40, CLK20_P, CLK20_N, DV, EV_out : out std_logic
  );
end entity;

architecture recovered of amplcpld is
  signal CNT : unsigned(1 downto 0) := (others => '0');
  signal c_count : unsigned(6 downto 0) := (others => '0');
  signal dly : std_logic_vector(7 downto 0) := (others => '0');
  signal evnt_i : std_logic_vector(2 downto 0) := (others => '0');
  signal O : std_logic_vector(12 downto 0) := (others => '0');
  signal str_div, str1, str2, cal_str, EVOUT : std_logic := '0';
  -- FB6/MC16 is an actual negative-phase output register, initialized high.
  signal clk20n_reg : std_logic := '1';
begin
  DOUT <= O;
  CLK40 <= CNT(0);
  CLK20_P <= CNT(1);
  CLK20_N <= clk20n_reg;
  DV <= dly(7);
  EV_out <= EVOUT;

  process(CLK80)
  begin
    if falling_edge(CLK80) then
      CNT <= CNT + 1;
      clk20n_reg <= not (CNT(1) xor CNT(0));
      if CNT(0) = '0' then
        str1 <= str_div;
      end if;
    end if;
  end process;

  -- FB6/MC1: toggle on falling CFD_OUT edge, T input from pin 64 (ENA).
  process(STR)
  begin
    if falling_edge(STR) then
      if ENA = '1' then str_div <= not str_div; end if;
    end if;
  end process;

  process(CLK80)
  begin
    if rising_edge(CLK80) then
      if evnt_i(2) = '0' and evnt_i(1) = '1' then
        c_count <= (others => '0');
        cal_str <= '1';
      elsif CNT(0) = '1' then
        if c_count = 127 then
          cal_str <= '0';
        else
          c_count <= c_count + 1;
        end if;
      end if;

      if EV = '0' then
        EVOUT <= '0';
      elsif c_count = 127 and cal_str = '1' then
        EVOUT <= '1';
      end if;

      str2 <= str1;
      evnt_i <= evnt_i(1 downto 0) & EV;
      dly <= dly(6 downto 0) & ((str1 xor str2) or (cal_str and CNT(0)));

      -- FB3 and FB7 implement registered ADC mux with hold, enable dly(6).
      if dly(6) = '1' then
        if CNT(1) = '1' then O <= '0' & ADC0;
        else O <= '1' & ADC1;
        end if;
      end if;
    end if;
  end process;
end architecture;
