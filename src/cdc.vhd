library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity cdc is
    generic (
        WIDTH       : integer := 8;
        SYNC_STAGES : integer := 2
    );
    port (
        data_in  : in  std_logic_vector(WIDTH-1 downto 0);
        
        clk_dest : in  std_logic;
        rstn_dest: in  std_logic;
        data_out : out std_logic_vector(WIDTH-1 downto 0)
    );
end entity cdc;

architecture Behavioral of cdc is
    type sync_array_t is array (0 to WIDTH-1) of std_logic_vector(SYNC_STAGES-1 downto 0);
    signal sync_regs : sync_array_t;
    
    attribute ASYNC_REG : string;
    attribute ASYNC_REG of sync_regs : signal is "TRUE";

begin

    assert SYNC_STAGES >= 1
        report "SYNC_STAGES must be >= 1"
        severity failure;

    gen_sync: for i in 0 to WIDTH-1 generate
        process (clk_dest, rstn_dest)
        begin
            if rstn_dest = '0' then
                sync_regs(i) <= (others => '0');
            elsif rising_edge(clk_dest) then
                sync_regs(i)(0) <= data_in(i);
                for j in 1 to SYNC_STAGES-1 loop
                    sync_regs(i)(j) <= sync_regs(i)(j-1);
                end loop;
            end if;
        end process;
        
        data_out(i) <= sync_regs(i)(SYNC_STAGES-1);
    end generate gen_sync;

end architecture Behavioral;
