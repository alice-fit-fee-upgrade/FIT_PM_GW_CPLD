-- Recovered from pm_cpld_gold_2026.jed, SHA256 1748e3c4...556f3d95.
-- This is the NEW physical readback target, distinct from the 2024 input.
-- Register/resource mapping and SAT proofs: decoded/readback-2026/state_map.json.
-- No hardware programming has been performed.
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity amplcpld is
  port(CLK80, STR, ENA, EV : in std_logic;
       ADC0, ADC1 : in std_logic_vector(11 downto 0);
       DOUT : out std_logic_vector(12 downto 0);
       CLK40, CLK20_P, CLK20_N, DV, EV_out : out std_logic);
end entity;
architecture recovered_2026 of amplcpld is
  signal CNT : unsigned(1 downto 0) := (others=>'1');
  signal clk20n_reg : std_logic := '0';
  signal str_div, str1, str2 : std_logic := '1';
  signal dly : std_logic_vector(6 downto 0) := (others=>'1');
  signal dv_reg : std_logic := '1';
  signal O : std_logic_vector(12 downto 0) := (others=>'1');
  -- Additional STR path is independent of ENA; it inhibits calibration restart.
  signal raw_str_toggle : std_logic := '1';
  signal raw_sync : std_logic_vector(2 downto 0) := (others=>'1');
  signal raw_edge, raw_stretch : std_logic := '1';
  signal inhibit_pipe : std_logic_vector(3 downto 0) := (others=>'1');
  -- Ten-bit saturating timer plus phase state, not the historical seven-bit counter.
  signal c_count : unsigned(9 downto 0) := (others=>'1');
  signal cal_phase, cal_sample : std_logic := '1';
  signal restart, data_enable : std_logic;
begin
  DOUT<=O; CLK40<=CNT(0); CLK20_P<=CNT(1); CLK20_N<=clk20n_reg;
  DV<=dv_reg;
  -- Golden FB2/MC4 is combinational: EV_OUT directly follows EV_IN.
  EV_out<=EV;
  restart <= '1' when CNT(0)='1' and c_count=1023 and
                        inhibit_pipe="0000" and cal_phase=CNT(1) else '0';
  data_enable <= dly(6) or cal_sample;
  process(STR)
  begin
    if falling_edge(STR) then
      raw_str_toggle <= not raw_str_toggle;
      if ENA='1' then str_div<=not str_div; end if;
    end if;
  end process;
  process(CLK80)
  begin
    if falling_edge(CLK80) then
      CNT<=CNT+1;
      clk20n_reg<=not(CNT(1) xor CNT(0));
      if CNT(0)='0' then str1<=str_div; end if;
    end if;
  end process;
  process(CLK80)
  begin
    if rising_edge(CLK80) then
      str2<=str1;
      dly<=dly(5 downto 0) & (str1 xor str2);
      dv_reg<=data_enable;
      raw_sync<=raw_sync(1 downto 0) & raw_str_toggle;
      raw_edge<=raw_sync(1) xor raw_sync(2);
      if CNT(0)='0' then
        raw_stretch<=raw_edge or (raw_sync(1) xor raw_sync(2));
        inhibit_pipe<=inhibit_pipe(2 downto 0) & raw_stretch;
      end if;
      if restart='1' then
        c_count<=(others=>'0');
        cal_phase<=not cal_phase;
      elsif CNT="11" and c_count/=1023 then
        c_count<=c_count+1;
      end if;
      if CNT(0)='0' then cal_sample<='0';
      elsif restart='1' then cal_sample<='1';
      end if;
      if data_enable='1' then
        if CNT(1)='1' then O<='0' & ADC0;
        else O<='1' & ADC1;
        end if;
      end if;
    end if;
  end process;
end architecture;
