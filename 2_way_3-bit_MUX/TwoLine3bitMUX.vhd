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
           Sel : in STD_LOGIC;
           LineOut : out STD_LOGIC_VECTOR (2 downto 0));
end TwoLine3bitMUX;

architecture Behavioral of TwoLine3bitMUX is

begin

LineOut(0) <= (Line0(0) AND NOT(Sel)) OR (Line1(0) AND Sel);
LineOut(1) <= (Line0(1) AND NOT(Sel)) OR (Line1(1) AND Sel);
LineOut(2) <= (Line0(2) AND NOT(Sel)) OR (Line1(2) AND Sel);

end Behavioral;
