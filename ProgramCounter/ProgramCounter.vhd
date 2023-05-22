----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/22/2023 11:05:25 AM
-- Design Name: 
-- Module Name: ProgramCounter - Behavioral
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

entity ProgramCounter is
    Port (
        Input : in std_logic_vector (2 downto 0);
        Clk : in  std_logic;
        Reset : in  std_logic;
        Output : out std_logic_vector(2 downto 0)
    );
end ProgramCounter;

architecture Behavioral of ProgramCounter is

signal currentCount : std_logic_vector (2 downto 0);

begin

process(Clk)
    begin
        if falling_edge(Clk) then
            if Reset = '1' then
                currentCount <= "000";
            else
                currentCount <= Input;
            end if;
        end if;
end process;
Output <= currentCount;
end Behavioral;
