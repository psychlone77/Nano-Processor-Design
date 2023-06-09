library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ProgramROM_Sim is
--  Port ( );
end ProgramRom_Sim;

architecture Behavioral of ProgramROM_Sim is

component ProgramROM 
    Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
           data : out STD_LOGIC_VECTOR (12 downto 0));
end component;

signal varAddress : std_logic_vector (2 downto 0);
signal varData : std_logic_vector (12 downto 0);
begin
UUT : ProgramROM Port Map (
    address => varAddress,
    data => varData);

process 
begin
    varAddress <= "000";
    wait for 100ns;

    varAddress <= "001";
    wait for 100ns;

    varAddress <= "010";
    wait for 100ns;

    varAddress <= "011";
    wait for 100ns;

    wait;
end process;

end Behavioral;