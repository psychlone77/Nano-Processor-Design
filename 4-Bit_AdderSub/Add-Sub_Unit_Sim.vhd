library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity TB_4_RCA is
-- Port ( );
end TB_4_RCA;
  
architecture Behavioral of TB_4_RCA is
  
COMPONENT Add_Sub_Unit
PORT( A,B : IN STD_LOGIC_vector(3 downto 0);
      M : in std_logic;
      S : out STD_LOGIC_vector(3 downto 0);
      C_out,v : out std_logic );
END COMPONENT;

signal C_in,C_out,M : std_logic;
signal A,B,S :std_logic_vector(3 downto 0);

begin
  UUT: Add_Sub_Unit PORT MAP(
  A=>A,
  B=>B,
  C_out => C_out,
  S=>S,
  M=>M);
  process
  begin
  -- {X}3 is the first digit and {X}0 is the last digit
  -- eg: 0111 should be entered in order A3=0,A2=1,A1=1,A0=1
  --first 4 digit number
  M<='1';
  A(0) <= '0';
  A(1) <= '0';
  A(2) <= '0';
  A(3) <= '0';
  -- second number
  B(0) <= '1';
  B(1) <= '0';
  B(2) <= '1';
  B(3) <= '0';

  C_in <= C_OUT;


WAIT;
end process;
end Behavioral;
