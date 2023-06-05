library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;


entity ProgramROM is
Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
        data : out STD_LOGIC_VECTOR (12 downto 0));
end ProgramROM;

architecture Behavioral of ProgramROM is

type rom_type is array (0 to 7) of std_logic_vector(12 downto 0);

signal ROM : rom_type := (
    "0101110000010", --0 (MOVI R7, 10    - 010 001 000 0010)
    "0100100000001", --1 (MOVI R2, 1     - 010 010 000 0001)
    "0010100000000", --2 (NEG R2         - 001 010 000 0000)
    "0001110100001", --3 (ADD R7, R2     - 000 001 010 0001)
    "0111110000111", --4 (JZR R7, 7      - 011 001 000 0111)
    "0110000000011", --5 (JZR R0, 3      - 011 001 000 0011)
    "0000000000000", --6
    "0000000000000"  --7
    );


begin
    process(address)
    begin
        if address = "UUU" then
            data <= "0000000000000"; -- Assign a specific value for undefined address
        else
            data <= ROM(to_integer(unsigned(address)));
        end if;
    end process;
end Behavioral;