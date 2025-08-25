library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.vcomponents.all;

entity io_event_calibration is
    Port (
        Event1_P : in  std_logic;
        Event1_N : in  std_logic;
        Event2_P : in  std_logic;
        Event2_N : in  std_logic;
        Event3_P : in  std_logic;
        Event3_N : in  std_logic;
        Event4_P : in  std_logic;
        Event4_N : in  std_logic;

        Event1 : out std_logic;
        Event2 : out std_logic;
        Event3 : out std_logic;
        Event4 : out std_logic;
        
        Calibration_P : out std_logic;
        Calibration_N : out std_logic;

        Calibration : in std_logic
    );
end entity io_event_calibration;

architecture RTL of io_event_calibration is
    
begin

    Event1_IBUF : entity IBUFDS port map (
            I  => Event1_P,
            IB => Event1_N,
            O  => Event1
        );

    Event2_IBUF : entity IBUFDS port map (
            I  => Event2_P,
            IB => Event2_N,
            O  => Event2
        );

    Event3_IBUF : entity IBUFDS port map (
            I  => Event3_P,
            IB => Event3_N,
            O  => Event3
        );

    Event4_IBUF : entity IBUFDS port map (
            I  => Event4_P,
            IB => Event4_N,
            O  => Event4
        );

    Calibration_OBUF : entity OBUFDS port map (
            I  => Calibration,
            O  => Calibration_P,
            OB => Calibration_N
        );

end architecture RTL;
