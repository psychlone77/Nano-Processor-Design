--To be used to increment the Program Counter
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RCA_3bit is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           -- no second input since it is always 1
           C_in : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (2 downto 0);
           C_out : out STD_LOGIC);
end RCA_3bit;

architecture Behavioral of RCA_3bit is
    component FA
     port (
     A: in std_logic;
     B: in std_logic;
     C_in: in std_logic;
     S: out std_logic;
     C_out: out std_logic);
     end component;
    
     SIGNAL FA0_C, FA1_C, FA2_C  : std_logic; 
begin
 FA_0 : FA
    port map (
         A => A(0),
         B => '1',
         C_in => '0', -- Set to ground
         S => S(0),
         C_Out => FA0_C);
 FA_1 : FA
    port map (
         A => A(1),
         B => '0',
         C_in => FA0_C,
         S => S(1),
         C_Out => FA1_C);
 FA_2 : FA
    port map ( 
         A => A(2),
         B => '0',
         C_in => FA1_C,
         S => S(2),
         C_Out => FA2_C);
         
C_out <= FA2_C; --C_out will be carry out from the final Full Adder

end Behavioral;
