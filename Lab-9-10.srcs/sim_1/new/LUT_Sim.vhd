library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity LUT_Sim is
--  Port ( );
end LUT_Sim;

architecture Behavioral of LUT_Sim is

component LUT_16_7 
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
           data : out STD_LOGIC_VECTOR (6 downto 0));
end component;

signal varAddress : std_logic_vector (3 downto 0);
signal varData : std_logic_vector (6 downto 0);
begin
UUT : LUT_16_7 Port Map (
    address => varAddress,
    data => varData);

process 
begin
    varAddress <= "0101";
    wait for 100ns;

    varAddress <= "1111";
    wait for 100ns;

    varAddress <= "0100";
    wait for 100ns;

    varAddress <= "0000";
    wait for 100ns;

    wait;
end process;

end Behavioral;
