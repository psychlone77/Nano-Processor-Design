library IEEE;                                                                          
use IEEE.STD_LOGIC_1164.ALL;

entity ThreeBitAdder_Sim is                                                                     
--  Port ( );                                                                          
end ThreeBitAdder_Sim;                                                                          
                                                                                       
architecture Behavioral of ThreeBitAdder_Sim is                                                 
COMPONENT ThreeBitAdder                                                                        
    Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
           S : out STD_LOGIC_VECTOR (2 downto 0);
           C_out : out STD_LOGIC);                                          
END COMPONENT;                                                                         
SIGNAL A, S : std_logic_vector (2 downto 0);
Signal C_out : std_logic;                     
begin                                                                                  
UUT: ThreeBitAdder PORT MAP(                                                                   
    A => A,                                                                                                                                                   
    --B => B,                                                                                                                                                                                                                       
    C_out => C_out,                                                                    
    S => S                                                                                                                                                   
);                                                                                     
    process                                                                            
    begin 
        --first 4 digit number                                                                             
        A(0) <= '0';                                                                     
        A(1) <= '0';                                                                     
        A(2) <= '0';
                                                                                                                                                                                                                         
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