library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity ampl_logic is
  generic (
    ADC_RESOLUTION_BITS   : integer := 14;
    DATA_OUT_W            : integer := 13;
    ADC_OVERFLOW_VAL      : integer := 16#1FFF# -- 16#3FFF# max value for 14-bits
  );
  port (
    clk       : in std_logic;
    rstn      : in std_logic;

    clk_gate  : in std_logic;
    clk_int_A : in std_logic;
    clk_int_B : in std_logic;

    enai      : in std_logic;
    strb      : in std_logic;
    evnt      : in std_logic;
    evout     : out std_logic;
    
    clk_inA   : in std_logic;
    d_inAA     : in std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
    d_inAB     : in std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);

    clk_inB   : in std_logic;
    d_inBA     : in std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
    d_inBB     : in std_logic_vector(ADC_RESOLUTION_BITS-1 downto 0);
    
    d_val     : out std_logic;
    d_out     : out std_logic_vector(DATA_OUT_W-1 downto 0)
  );
end ampl_logic;

architecture logic of ampl_logic is

  signal cnt_out    : std_logic_vector (1 downto 0) := (others => '0'); -- cnt2 output
  signal cal_str    : std_logic := '0'; -- true on 1 cycle after c_count = "1111111"
  signal c_count    : std_logic_vector (6 downto 0) := (others => '0'); -- counter inremented every cycle if clk_gate = '1'

  signal str_div    : std_logic := '0';
  signal str_synch  : std_logic_vector (1 downto 0) := (others => '0');

  signal evnt_synch : std_logic_vector (2 downto 0) := (others => '0');
  signal dly        : std_logic_vector (7 downto 0) := (others => '0');

begin

  -- cnt2_inst : cnt2 port map (
  --   clk => clk,
  --   o   => cnt_out
  -- );

  -- mux_latch_inst : mux_latch port map (
  --   in_a  => d_inA,
  --   in_b  => d_inB,
  --   o     => d_out,
  --   clk   => clk,
  --   sel0  => dly(6),
  --   sel1  => clk20
  -- );

  process (clk) begin

    if falling_edge(clk) then
      if (clk_gate = '0') then
        str_synch(0) <= str_div;
      end if;
    end if;
  end process;

  d_val <= dly(7);

  process (clk) begin

    if rstn = '0' then
      c_count <= "0000000";
      cal_str <= '0';
      evout <= '0';
      dly <= x"00";
    
    elsif rising_edge(clk) then
      if (evnt_synch(2) = '0' and evnt_synch(1) = '1') then
        c_count <= "0000000";
        cal_str <= '1';
      elsif (clk_gate = '1') then
        if c_count = "1111111" then
          cal_str <= '0';
        else
          c_count <= c_count + 1;
        end if;
      end if;

      if (evnt = '0') then
        evout <= '0';
      elsif (c_count = "1111111" and cal_str = '1') then
        evout <= '1';
      end if;

      str_synch(1)   <= str_synch(0);
      evnt_synch <= evnt_synch(1 downto 0) & evnt;
      for i in 0 to 6 loop
        dly(i + 1) <= dly(i);
      end loop;
      dly(0) <= (str_synch(0) xor str_synch(1)) or (cal_str and clk_gate);
    end if;
  end process;

  -- process (strb)
  -- begin
  --   if (strb'event and strb = '0') then
  --     if (enai = '1') then
  --       str_div <= not str_div;
  --     end if;
  --   end if;
  -- end process;

end logic;