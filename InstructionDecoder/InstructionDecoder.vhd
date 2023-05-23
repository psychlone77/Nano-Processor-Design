----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/22/2023 10:18:13 PM
-- Design Name: 
-- Module Name: InstructionDecoder - Behavioral
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

entity InstructionDecoder is
    Port ( Ins : in STD_LOGIC_VECTOR (12 downto 0);
           RegCheck : in STD_LOGIC_VECTOR (3 downto 0);
           AddSubSel : out STD_LOGIC;
           RegSel_1 : out STD_LOGIC_VECTOR (2 downto 0);
           RegSel_2 : out STD_LOGIC_VECTOR (2 downto 0);
           Value : out STD_LOGIC_VECTOR (3 downto 0);
           LoadSel : out STD_LOGIC;
           RegEn : out STD_LOGIC_VECTOR (2 downto 0);
           JMP_Address : out STD_LOGIC_VECTOR (2 downto 0);
           JMP_Flag : out STD_LOGIC);
end InstructionDecoder;

architecture Behavioral of InstructionDecoder is

begin

--Common
RegEn <= Ins(9 downto 7);
RegSel_1 <= Ins(9 downto 7);
RegSel_2 <= Ins(6 downto 4);

-- JZR
JMP_Address <= Ins(2 downto 0);
JMP_Flag <= Ins(11) AND Ins(10) AND NOT(RegCheck(0)) AND NOT(RegCheck(1)) AND NOT(RegCheck(2)) AND NOT(RegCheck(3));
-- could use the zero flag instead of RegCheck

--MOVI
LoadSel <= Ins(11) AND NOT(Ins(10));
Value <= Ins(3 downto 0);

--NEG
AddSubSel <= NOT(Ins(11)) AND Ins(10);

end Behavioral;
