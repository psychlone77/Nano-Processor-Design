library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TwoLine4bitMUX_Sim is
--  Port ( );
end TwoLine4bitMUX_Sim;

architecture Behavioral of TwoLine4bitMUX_Sim is
Component TwoLine4bitMUX
    Port ( Line0 : in STD_LOGIC_VECTOR (3 downto 0);
           Line1 : in STD_LOGIC_VECTOR (3 downto 0);
           Sel : in STD_LOGIC;
           LineOut : out STD_LOGIC_VECTOR (3 downto 0));
end Component;

signal line0, line1, lineOut : std_logic_vector (3 downto 0);
signal sel : std_logic;

begin
UUT: TwoLine4bitMUX PORT MAP(                                                                   
    Line0 => line0,
    Line1 => line1,
    Sel => sel,
    LineOut => lineOut                                                                                                                                                   
);

process
    begin
        line0 <= "0101";
        line1 <= "1111";
        sel <= '0';
        wait for 200ns;
        line1 <= "1111";
        sel <= '1';
        wait;
    end process;

end Behavioral;
