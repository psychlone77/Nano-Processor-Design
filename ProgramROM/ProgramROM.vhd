library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;


entity ProgramROM is
Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
        data : out STD_LOGIC_VECTOR (12 downto 0));
end ProgramROM;

architecture Behavioral of ProgramROM is

type rom_type is array (0 to 7) of std_logic_vector(12 downto 0);

-- hardcode your instructions here
signal ROM : rom_type := (
    "0000000000000", --0
    "0000000000000", --1
    "0011110000000", --2
    "0000000000000", --3
    "0000000000000", --4
    "0000000000000", --5
    "0000000000000", --6
    "0000000000011"  --7
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
