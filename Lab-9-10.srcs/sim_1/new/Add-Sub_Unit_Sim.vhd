library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Add_Sub_Sim is
-- Port ( );
end Add_Sub_Sim;
  
architecture Behavioral of Add_Sub_Sim is
  
COMPONENT Add_Sub_Unit
    PORT( A,B : IN STD_LOGIC_vector(3 downto 0);
          M : in std_logic;
          S : out STD_LOGIC_vector(3 downto 0);
          C_out : out std_logic;
          Zero_Flag : out std_logic;
          V : out std_logic );
END COMPONENT;

signal C_out,M, V, Zero_Flag : std_logic;
signal A,B,S :std_logic_vector(3 downto 0);

begin
  UUT: Add_Sub_Unit PORT MAP(
      A => A,
      B => B,
      C_out => C_out,
      V => V,
      S => S,
      Zero_Flag => Zero_Flag,
      M => M);
      
    process
        begin
        -- {X}3 is the first digit and {X}0 is the last digit
        -- eg: 0111 should be entered in order A3=0,A2=1,A1=1,A0=1
        --first calculation
        M <= '0';
        A(3) <= '0';
        A(2) <= '0';
        A(1) <= '0';
        A(0) <= '1';

        B(3) <= '0';
        B(2) <= '0';
        B(1) <= '1';
        B(0) <= '1';
        
        wait for 200ns;
        --second calculation
        M <= '0';
        A(3) <= '0';
        A(2) <= '1';
        A(1) <= '1';
        A(0) <= '1';

        B(3) <= '0';
        B(2) <= '0';
        B(1) <= '0';
        B(0) <= '1';        
        
        wait for 200ns;
        --third calculation
        M <= '1';
        A(3) <= '0';
        A(2) <= '1';
        A(1) <= '0';
        A(0) <= '1';

        B(3) <= '0';
        B(2) <= '0';
        B(1) <= '1';
        B(0) <= '0';        

        wait for 200ns;
        --fourth calculation
        M <= '1';
        A(3) <= '1';
        A(2) <= '0';
        A(1) <= '0';
        A(0) <= '0';

        B(3) <= '0';
        B(2) <= '1';
        B(1) <= '1';
        B(0) <= '0'; 
        
        wait for 200ns;
        --fifth calculation
        M <= '1';
        A(3) <= '0';
        A(2) <= '1';
        A(1) <= '0';
        A(0) <= '1';

        B(3) <= '0';
        B(2) <= '1';
        B(1) <= '0';
        B(0) <= '1';       

        WAIT;
    end process;
end Behavioral;
