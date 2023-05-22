----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/21/2023 09:00:12 PM
-- Design Name: 
-- Module Name: TwoLine3bitMUX_Sim - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity TwoLine3bitMUX_Sim is
--  Port ( );
end TwoLine3bitMUX_Sim;

architecture Behavioral of TwoLine3bitMUX_Sim is
Component TwoLine3bitMUX
    Port ( Line0 : in STD_LOGIC_VECTOR (2 downto 0);
           Line1 : in STD_LOGIC_VECTOR (2 downto 0);
           Sel : in STD_LOGIC;
           LineOut : out STD_LOGIC_VECTOR (2 downto 0));
end Component;

signal line0, line1, lineOut : std_logic_vector (2 downto 0);
signal sel : std_logic;

begin
UUT: TwoLine3bitMUX PORT MAP(                                                                   
    Line0 => line0,
    Line1 => line1,
    Sel => sel,
    LineOut => lineOut                                                                                                                                                   
);

process
    begin
        line0 <= "010";
        line1 <= "111";
        sel <= '0';
        wait for 200ns;
        line1 <= "111";
        sel <= '1';
        wait;
    end process;

end Behavioral;
