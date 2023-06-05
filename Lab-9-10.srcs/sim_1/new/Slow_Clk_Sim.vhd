----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/04/2023 06:00:23 PM
-- Design Name: 
-- Module Name: Slow_Clk_Sim - Behavioral
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

entity Slow_Clk_Sim is
--  Port ( );
end Slow_Clk_Sim;

architecture Behavioral of Slow_Clk_Sim is
COMPONENT Slow_Clk
    PORT( 
    Clk_in: in std_logic;
    Clk_out: out std_logic
    );
END COMPONENT;

signal Clk_in, Clk_out : std_logic;
begin
UUT: Slow_Clk PORT MAP(
    Clk_in => Clk_in,
    Clk_out => Clk_out
    );
    
    process
        begin
            -- Initialize the clock to 0
            Clk_in <= '0';
            wait for 20 ns;
            
            -- Toggle the clock every 10ns
            while true loop
                Clk_in <= not Clk_in;
                wait for 10 ns;
                Clk_in <= not Clk_in;
                wait for 10 ns;
            end loop;
        end process;
end Behavioral;
