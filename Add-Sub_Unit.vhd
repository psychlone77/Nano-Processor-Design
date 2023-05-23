


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Add_Sub_Unit is
Port (  A : in STD_LOGIC_vector (3 downto 0);
        B : in STD_LOGIC_vector (3 downto 0);
        M : in STD_LOGIC;
        S : out STD_LOGIC_vector(3 downto 0);
        C_out : out STD_LOGIC;
        V : out std_logic);
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
SIGNAL FA0_S, FA0_C, FA1_S, FA1_C, FA2_S, FA2_C, FA3_S, FA3_C,varV : std_logic;
signal varB :std_logic_vector(3 downto 0);
begin
varB(0)<=B(0) xor M;
varB(1)<=B(1) xor M;
varB(2)<=B(2) xor M;
varB(3)<=B(3) xor M;
FA_0 : FA
port map (
A => A(0),
B => varB(0),
C_in => M, -- Set to ground
S => S(0),
C_Out => FA0_C);
FA_1 : FA
port map (
A => A(1),
B => varB(1),
C_in => FA0_C,
S => S(1),
C_Out => FA1_C);
FA_2 : FA
port map (
A => A(2),
B => varB(2),
C_in => FA1_C,
S => S(2),
C_Out => FA2_C);
FA_3 : FA
port map (
A => A(3),
B => varB(3),
C_in => FA2_C,
S => S(3),
C_out => FA3_C); 
--this part had to be changed from the Assignment code
varV <= FA2_C OR FA3_C; -- this part was added so the proper C_out was ouput
C_out <= FA3_C AND varV;
V<=varV;---- if V is 0 should not consider the carryout ----if v==1 shouold consider the carryout

end Behavioral;
