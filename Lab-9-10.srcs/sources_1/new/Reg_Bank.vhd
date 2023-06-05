----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/24/2023 01:32:01 PM
-- Design Name: 
-- Module Name: Reg_Bank - Behavioral
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

entity Reg_Bank is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0); --input bits
           RegEn : in STD_LOGIC_VECTOR (2 downto 0); --which register to enable
           Reset : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Out0 : out STD_LOGIC_VECTOR (3 downto 0);
           Out1 : out STD_LOGIC_VECTOR (3 downto 0);
           Out2 : out STD_LOGIC_VECTOR (3 downto 0);
           Out3 : out STD_LOGIC_VECTOR (3 downto 0);
           Out4 : out STD_LOGIC_VECTOR (3 downto 0);
           Out5 : out STD_LOGIC_VECTOR (3 downto 0);
           Out6 : out STD_LOGIC_VECTOR (3 downto 0);
           Out7 : out STD_LOGIC_VECTOR (3 downto 0)
           );
end Reg_Bank;

architecture Behavioral of Reg_Bank is

component Reg is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           Reset : in STD_LOGIC;
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component Decoder_3_to_8 is
    Port (  I : in STD_LOGIC_VECTOR (2 downto 0);
            EN : in STD_LOGIC;
            Y : out STD_LOGIC_VECTOR (7 downto 0));
end component;

signal varY : std_logic_vector (7 downto 0); --used to store Decoder output


begin

    Decoder : Decoder_3_to_8 Port Map ( I => RegEn, En => '1', Y => varY);

    Reg0 : Reg Port Map( D => "0000", Reset => '0', En => '1', Clk => Clk, Q => Out0); --Reg0 should always be "0000"
    Reg1 : Reg Port Map( D => D, Reset => Reset, En => varY(1), Clk => Clk, Q => Out1);
    Reg2 : Reg Port Map( D => D, Reset => Reset, En => varY(2), Clk => Clk, Q => Out2);
    Reg3 : Reg Port Map( D => D, Reset => Reset, En => varY(3), Clk => Clk, Q => Out3);
    Reg4 : Reg Port Map( D => D, Reset => Reset, En => varY(4), Clk => Clk, Q => Out4);
    Reg5 : Reg Port Map( D => D, Reset => Reset, En => varY(5), Clk => Clk, Q => Out5);
    Reg6 : Reg Port Map( D => D, Reset => Reset, En => varY(6), Clk => Clk, Q => Out6);
    Reg7 : Reg Port Map( D => D, Reset => Reset, En => varY(7), Clk => Clk, Q => Out7);

end Behavioral;
