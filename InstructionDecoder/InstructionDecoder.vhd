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

-- Instruction Format bit indexes 
-- (12,11,10),(9,8,7),(6,5,4),(3,2,1,0)
    
--Common
RegEn <= Ins(9 downto 7);
RegSel_1 <= Ins(9 downto 7);
RegSel_2 <= Ins(6 downto 4);

-- JZR -    011 RRR 000 0ddd
JMP_Address <= Ins(2 downto 0);
JMP_Flag <= Ins(11) AND Ins(10) AND NOT(RegCheck(0)) AND NOT(RegCheck(1)) AND NOT(RegCheck(2)) AND NOT(RegCheck(3));
-- could use the zero flag instead of RegCheck

--MOVI -    010 RRR 000 dddd
LoadSel <= Ins(11) AND NOT(Ins(10));
Value <= Ins(3 downto 0);

--NEG -     001 RRR 000 0000
--ADD -     000 RRR RRR 0000
AddSubSel <= NOT(Ins(11)) AND Ins(10);

end Behavioral;
