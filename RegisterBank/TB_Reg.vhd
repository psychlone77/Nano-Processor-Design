----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/24/2023 09:04:09 AM
-- Design Name: 
-- Module Name: TB_Reg - Behavioral
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

entity TB_Reg is
--  Port ( );
end TB_Reg;

architecture Behavioral of TB_Reg is
    
component Reg is
    Port ( D : in STD_LOGIC_VECTOR (3 downto 0);
           En : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 downto 0));
end component;
    
signal D,Q:std_logic_vector(3 downto 0);
signal En,Clk :std_logic;

begin
    UUT: Reg PORT MAP(
    D=>D,
    En=>En,
    Clk => Clk,
    Q=>Q);


Clk_process: process
    begin
        Clk<='0';
        wait for 5ns ;
        Clk<='1';
        wait for 5 ns ;
    end process;
            
process 
    begin
    En<='1';
    D<="0000";
    wait for 20 ns;
    D<="1110";
    wait;
end process;


end Behavioral;
