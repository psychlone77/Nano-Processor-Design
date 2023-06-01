----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/24/2023 07:02:10 AM
-- Design Name: 
-- Module Name: TB_MUX_8way_4bit - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity MUX_8way_4bit_Sim is
--  Port ( );
end MUX_8way_4bit_Sim;

architecture Behavioral of MUX_8way_4bit_Sim is

component MUX_8way_4bit
port (  RegSel : in STD_LOGIC_VECTOR (2 downto 0);
        Reg0 : in STD_LOGIC_VECTOR (3 downto 0);
        Reg1 : in STD_LOGIC_VECTOR (3 downto 0);
        Reg2 : in STD_LOGIC_VECTOR (3 downto 0);
        Reg3 : in STD_LOGIC_VECTOR (3 downto 0);
        Reg4 : in STD_LOGIC_VECTOR (3 downto 0);
        Reg5 : in STD_LOGIC_VECTOR (3 downto 0);
        Reg6 : in STD_LOGIC_VECTOR (3 downto 0);
        Reg7 : in STD_LOGIC_VECTOR (3 downto 0);
        S : out STD_LOGIC_vector(3 downto 0));
end component;

signal RegSel: std_logic_vector (2 downto 0);
signal Reg0,Reg1,Reg2,Reg3,Reg4,Reg5,Reg6,Reg7,S: std_logic_vector (3 downto 0);


begin
UUT: MUX_8way_4bit PORT MAP(
        RegSel=> RegSel, 
        Reg0 => Reg0,
        Reg1 => Reg1,
        Reg2 => Reg2,
        Reg3 => Reg3,
        Reg4 => Reg4,
        Reg5 => Reg5,
        Reg6 => Reg6,
        Reg7 => Reg7,
        S=>S);
        
process
    begin
        RegSel<="000";
        Reg0<="0000";
        Reg1<="0001";
        Reg2<="0010";
        Reg3<="1111";
        Reg4<="0100";
        Reg5<="0101";
        Reg6<="0110";
        Reg7<="0111";
        wait for 100 ns;
        RegSel<="001";
        wait for 100 ns;
        RegSel<="010";
        wait for 100 ns;
        RegSel<="011";
        wait for 100 ns;
        RegSel<="100";
        wait for 100 ns;
        RegSel<="101";
        wait for 100 ns;
        RegSel<="110";
        wait for 100 ns;
        RegSel<="111";
        wait;
end process;



end Behavioral;
