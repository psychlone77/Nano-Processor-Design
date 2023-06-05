library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Add_Sub_Unit is
    Port (  A : in STD_LOGIC_vector (3 downto 0); --First Input
            B : in STD_LOGIC_vector (3 downto 0); --Second Input, this input will be inversed when M=1
            M : in STD_LOGIC; -- Add or Subtract Select
            S : out STD_LOGIC_vector(3 downto 0); -- Output
            C_out : out STD_LOGIC; -- Carry Out
            Zero_Flag : out STD_LOGIC;
            V : out STD_LOGIC); -- OverFlow bit
end Add_Sub_Unit;



architecture Behavioral of Add_Sub_Unit is

component FA
port (
        A: in std_logic;
        B: in std_logic;
        C_in: in std_logic;
        S: out std_logic;
        C_out: out std_logic);
end component;

signal FA0_S, FA0_C, FA1_S, FA1_C, FA2_S, FA2_C, FA3_S, FA3_C, varV : std_logic;
signal varB, varS : std_logic_vector(3 downto 0);

begin
    varB(0) <= B(0) XOR M;
    varB(1) <= B(1) XOR M;
    varB(2) <= B(2) XOR M;
    varB(3) <= B(3) XOR M;

    FA_0 : FA port map (
            A => A(0),
            B => varB(0),
            C_in => M,
            S => varS(0),
            C_Out => FA0_C);
            
    FA_1 : FA port map (
            A => A(1),
            B => varB(1),
            C_in => FA0_C,
            S => varS(1),
            C_Out => FA1_C);
            
    FA_2 : FA port map (
            A => A(2),
            B => varB(2),
            C_in => FA1_C,
            S => varS(2),
            C_Out => FA2_C);
            
    FA_3 : FA port map (
            A => A(3),
            B => varB(3),
            C_in => FA2_C,
            S => varS(3),
            C_out => FA3_C); 
            
            
    varV <= FA2_C XOR FA3_C;
    V <= varV; 
    C_out <= FA3_C;
    S <= varS;
    Zero_Flag <= NOT(varS(0) OR varS(1) OR varS(2) OR varS(3) OR varV);

end Behavioral;
