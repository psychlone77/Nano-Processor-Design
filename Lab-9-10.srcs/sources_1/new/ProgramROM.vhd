library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;


entity ProgramROM is
Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
        data : out STD_LOGIC_VECTOR (12 downto 0));
end ProgramROM;

architecture Behavioral of ProgramROM is

type rom_type is array (0 to 7) of std_logic_vector(12 downto 0);

-- count from 3 to 1 using JZR instruction
--signal ROM : rom_type := (
--    "0101110000011", --0 (MOVI R7, 3     - 010 001 000 0010)
--    "0100100000001", --1 (MOVI R2, 1     - 010 010 000 0001)
--    "0010100000000", --2 (NEG R2         - 001 010 000 0000)
--    "0001110100001", --3 (ADD R7, R2     - 000 001 010 0001)
--    "0111110000111", --4 (JZR R7, 7      - 011 001 000 0111)
--    "0110000000011", --5 (JZR R0, 3      - 011 001 000 0011)
--    "0000000000000", --6
--    "0000000000000"  --7
--    );

-- subtract two numbers directly
--signal ROM : rom_type := (
--    "0101110000111", --0 (MOVI R7, 111    - 010 001 000 0010)
--    "0100100000001", --1 (MOVI R2, 1     - 010 010 000 0001)
--    "1110101110000", --2 (SUB R2, R7     - 111 010 111 0000)
--    "0000000000000", --3 
--    "0000000000000", --4 
--    "0000000000000", --5 
--    "0000000000000", --6
--    "0000000000000"  --7
--    );

-- count from 3 to 0 with JNR instruction
signal ROM : rom_type := (
    "0101110000011", --0 (MOVI R7, 10    - 010 001 000 0010)
    "0100100000001", --1 (MOVI R2, 1     - 010 010 000 0001)
    "0010100000000", --2 (NEG R2         - 001 010 000 0000)
    "0001110100001", --3 (ADD R7, R2     - 000 001 010 0001)
    "1001110000011", --4 (JNR R7, 3      - 011 001 000 0111)
    "0000000000000", --5 
    "0000000000000", --6
    "0000000000000"  --7
    );


begin
    process(address)
    begin
        data <= ROM(to_integer(unsigned(address)));
    end process;
end Behavioral;