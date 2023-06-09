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
           ZeroFlag : in STD_LOGIC;
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
    
    -- JZR 011, JNR 100
    JMP_Address <= Ins(2 downto 0);
    JMP_Flag <= (NOT(Ins(12)) AND Ins(11) AND Ins(10) AND ZeroFlag) OR
                (Ins(12) AND NOT(Ins(11)) AND NOT(Ins(10)) AND NOT(ZeroFlag));
--    JMP_Flag <= ( Ins(12) AND not(Ins(11)) AND not(Ins(10)) ) XOR ZeroFlag;
    
    --MOVI 010
    LoadSel <= NOT(Ins(12)) AND Ins(11) AND NOT(Ins(10));
    Value <= Ins(3 downto 0);
    
    --NEG 001, ADD 000, SUB 111
    AddSubSel <= ( (NOT(Ins(12)) AND NOT(Ins(11))) OR (Ins(12) AND Ins(11)) ) AND Ins(10);
    

end Behavioral;
