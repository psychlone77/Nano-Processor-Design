----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/23/2023 11:38:05 AM
-- Design Name: 
-- Module Name: InstructionDecoder_Sim - Behavioral
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

entity InstructionDecoder_Sim is
--  Port ( );
end InstructionDecoder_Sim;

architecture Behavioral of InstructionDecoder_Sim is
component InstructionDecoder
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
end component;

signal Ins_TB : STD_LOGIC_VECTOR (12 downto 0);
signal ZeroFlag_TB : STD_LOGIC;
signal AddSubSel_TB : STD_LOGIC;
signal RegSel_1_TB : STD_LOGIC_VECTOR (2 downto 0);
signal RegSel_2_TB : STD_LOGIC_VECTOR (2 downto 0);
signal Value_TB : STD_LOGIC_VECTOR (3 downto 0);
signal LoadSel_TB : STD_LOGIC;
signal RegEn_TB : STD_LOGIC_VECTOR (2 downto 0);
signal JMP_Address_TB : STD_LOGIC_VECTOR (2 downto 0);
signal JMP_Flag_TB : STD_LOGIC;

begin

uut: InstructionDecoder
    port map (
        Ins => Ins_TB,
        ZeroFlag => ZeroFlag_TB,
        AddSubSel => AddSubSel_TB,
        RegSel_1 => RegSel_1_TB,
        RegSel_2 => RegSel_2_TB,
        Value => Value_TB,
        LoadSel => LoadSel_TB,
        RegEn => RegEn_TB,
        JMP_Address => JMP_Address_TB,
        JMP_Flag => JMP_Flag_TB
    );
    
process
begin
    Ins_TB <= "0100010001010"; -- MOVI 001 1010
    wait for 100ns;
    Ins_TB <= "0001110100000"; -- ADD 111, 010 
    wait for 100ns;
    Ins_TB <= "0011100000000"; -- NEG 110
    wait for 100ns;
    wait for 100ns;
    Ins_TB <= "1110101110000"; -- SUB R2,R7
    Ins_TB <= "0111010000011"; -- JZR 101, 011
    ZeroFlag_TB <= '0';
    wait for 100ns;
    Ins_TB <= "0111010000011"; -- JZR 101, 011
    ZeroFlag_TB <= '1';
    wait for 100ns;
    Ins_TB <= "1001110000101"; -- JNZ R7, 5
    ZeroFlag_TB <= '0';
    wait for 100ns;
    Ins_TB <= "1001110000101"; -- JNZ R7, 5
    ZeroFlag_TB <= '1';
    wait;
end process;

end Behavioral;
