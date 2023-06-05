----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/22/2023 11:05:25 AM
-- Design Name: 
-- Module Name: ProgramCounter - Behavioral
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

entity ProgramCounter is
    Port (
        Input : in std_logic_vector (2 downto 0);
        Clk : in  std_logic;
        Reset : in  std_logic;
        Output : out std_logic_vector(2 downto 0)
    );
end ProgramCounter;

architecture Behavioral of ProgramCounter is

component D_FF
    Port(D : in STD_LOGIC;
       Res : in STD_LOGIC;
       Clk : in STD_LOGIC;
       Q : out STD_LOGIC;
       Qbar : out STD_LOGIC);
end component;


begin

    D_FF0 : D_FF
        Port map ( D => Input(0), Clk => Clk, Res => Reset, Q => Output(0)); 
    
    D_FF1 : D_FF
        Port map ( D => Input(1), Clk => Clk, Res => Reset, Q => Output(1)); 
    
    D_FF2 : D_FF
        Port map ( D => Input(2), Clk => Clk, Res => Reset, Q => Output(2)); 

end Behavioral;
