library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ThreeBitAdder is
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           -- no second input since it is always 1
           S : out STD_LOGIC_VECTOR (2 downto 0);
           C_out : out STD_LOGIC);
end ThreeBitAdder;

architecture Behavioral of ThreeBitAdder is
    component FA
     port (
     A: in std_logic;
     B: in std_logic;
     C_in: in std_logic;
     S: out std_logic;
     C_out: out std_logic);
     end component;
    
     SIGNAL FA0_S, FA0_C, FA1_S, FA1_C, FA2_S, FA2_C  : std_logic; 
     signal temp :std_logic_vector (2 downto 0);
     
begin
    process(A) 
    begin
        if(A = "111") then
            temp <= "110"; --prevents adder from counting beyond 1111
        else
            temp <= A;
        end if;
    end process;
    
     FA_0 : FA
        port map (
             A => temp(0),
             B => '1',
             C_in => '0', -- Set to ground
             S => S(0),
             C_Out => FA0_C);
     FA_1 : FA
        port map (
             A => temp(1),
             B => '0',
             C_in => FA0_C,
             S => S(1),
             C_Out => FA1_C);
     FA_2 : FA
        port map ( 
             A => temp(2),
             B => '0',
             C_in => FA1_C,
             S => S(2),
             C_Out => FA2_C);
             
    C_out <= FA2_C;

end Behavioral;