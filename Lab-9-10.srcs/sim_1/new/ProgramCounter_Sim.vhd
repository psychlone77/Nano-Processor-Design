----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/22/2023 11:23:04 AM
-- Design Name: 
-- Module Name: ProgramCounter_Sim - Behavioral
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

entity ProgramCounter_Sim is
--  Port ( );
end ProgramCounter_Sim;

architecture Behavioral of ProgramCounter_Sim is
component ProgramCounter 
port (
    Input : in std_logic_vector(2 downto 0);
    Clk : in  std_logic;
    Reset : in  std_logic;
    Output : out std_logic_vector(2 downto 0));
end component;

signal Clk, Reset : std_logic;
signal Input, Output : std_logic_vector (2 downto 0);

begin
UUT : ProgramCounter Port Map (
    Input => Input,
    Clk => Clk,
    Reset => Reset,
    Output => Output
    );
process
begin
    Clk <= '0';
    wait for 100ns;
    while true loop
        Clk <= not(Clk);
        wait for 100ns;
        Clk <= not(Clk);
        wait for 100ns;
    end loop;
end process;

process 
    begin
    Reset <= '1';
    wait for 250ns;
    Reset <= '0';
    wait for 10ns;
    Input <= "111";
    wait for 200ns;
    Input <= "101";
    wait;
end process;

end Behavioral;
