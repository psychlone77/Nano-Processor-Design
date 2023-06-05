library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;


entity LUT_16_7 is
    Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
            data : out STD_LOGIC_VECTOR (6 downto 0));
end LUT_16_7;

architecture Behavioral of LUT_16_7 is

type rom_type is array (0 to 15) of std_logic_vector(6 downto 0);

signal sevenSegment_ROM : rom_type := (
    "0000001", --0
    "1001111", --1
    "0010010", --2
    "0000110", --3
    "1001100", --4
    "0100100", --5
    "0100000", --6
    "0001111", --7
    "0000000", --8
    "0000100", --9
    "0001000", --a
    "1100000", --b
    "0001110", --c
    "0000010", --d
    "0110000", --e
    "0111000"  --f
    );


begin
    process(address)
    begin
        if address = "UUUU" then
            data <= "0000001"; -- Assign a specific value for undefined address
        else
            data <= sevenSegment_ROM(to_integer(unsigned(address)));
        end if;
    end process;
end Behavioral;