----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/21/2023 08:50:50 PM
-- Design Name: 
-- Module Name: 2way3bitMUX - Behavioral
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

entity TwoLine3bitMUX is
    Port ( Line0 : in STD_LOGIC_VECTOR (2 downto 0);
           Line1 : in STD_LOGIC_VECTOR (2 downto 0);
           Selector : in STD_LOGIC;
           LineOut : out STD_LOGIC_VECTOR (2 downto 0));
end TwoLine3bitMUX;

architecture Behavioral of TwoLine3bitMUX is

begin

    process(Line0, Line1, Selector)
    begin
        if Selector = '0' then
            LineOut <= Line0;
        else
            LineOut <= Line1;
        end if;
    end process;
    
end Behavioral;
