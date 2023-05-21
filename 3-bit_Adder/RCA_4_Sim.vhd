library IEEE;                                                                          
use IEEE.STD_LOGIC_1164.ALL;

entity RCA_4_Sim is                                                                     
--  Port ( );                                                                          
end RCA_4_Sim;                                                                          
                                                                                       
architecture Behavioral of RCA_4_Sim is                                                 
COMPONENT RCA_4                                                                        
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           C_in : in STD_LOGIC;
           S : out STD_LOGIC_VECTOR (2 downto 0);
           C_out : out STD_LOGIC);                                          
END COMPONENT;                                                                         
SIGNAL A, S : std_logic_vector (2 downto 0);
Signal C_in, C_out : std_logic;                     
begin                                                                                  
UUT: RCA_4 PORT MAP(                                                                   
    A => A,                                                                                                                                                   
    --B => B,                                                                                                                                                   
    C_in => C_in,                                                                      
    C_out => C_out,                                                                    
    S => S                                                                                                                                                   
);                                                                                     
    process                                                                            
    begin 
        --first 4 digit number                                                                             
        A(0) <= '0';                                                                     
        A(1) <= '0';                                                                     
        A(2) <= '0';
        C_in <= '0';
                                                                                                                                                                                                                         
        WAIT FOR 200 ns;
		-- output from previous                                                               
        A(0) <= S(0);                                                                     
        A(1) <= S(1);                                                                     
        A(2) <= S(2);                                                                            
        WAIT FOR 200 ns;
        
		-- output from previous                                                               
        A(0) <= S(0);                                                                     
        A(1) <= S(1);                                                                     
        A(2) <= S(2);                                                                                         
        WAIT FOR 200 ns;
        
        -- output from previous                                                               
        A(0) <= S(0);                                                                     
        A(1) <= S(1);                                                                     
        A(2) <= S(2);
        WAIT FOR 200 ns;
                
        -- output from previous                                                               
        A(0) <= S(0);                                                                     
        A(1) <= S(1);                                                                     
        A(2) <= S(2);
        WAIT FOR 200 ns;
        
        -- output from previous                                                               
        A(0) <= S(0);                                                                     
        A(1) <= S(1);                                                                     
        A(2) <= S(2);
        WAIT FOR 200 ns;
        
       -- output from previous                                                               
        A(0) <= S(0);                                                                     
        A(1) <= S(1);                                                                     
        A(2) <= S(2);
        WAIT FOR 200 ns;
       -- output from previous                                                               
        A(0) <= S(0);                                                                     
        A(1) <= S(1);                                                                     
        A(2) <= S(2);       
        WAIT;                                                                          
     end process;                                                                      
                                                                                       
end Behavioral;