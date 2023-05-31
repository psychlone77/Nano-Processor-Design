library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

--Program Counter will hold the current count until the next clock cycle.
--Note the D-flip-flops used here experince a change during the falling edge.

entity ProgramCounter is
    Port (
        Input : in std_logic_vector (2 downto 0);
        Clk : in  std_logic;
        Reset : in  std_logic;
        Output : out std_logic_vector(2 downto 0)
    );
end ProgramCounter;

architecture Behavioral of ProgramCounter is

component D_FF
    Port(  D : in STD_LOGIC;
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Q : out STD_LOGIC;
           Qbar : out STD_LOGIC);
end component;

signal currentCount : std_logic_vector (2 downto 0);

begin

D_FF0 : D_FF
    Port map ( D => Input(0), Clk => Clk, Res => Reset, Q => Output(0)); 

D_FF1 : D_FF
    Port map ( D => Input(1), Clk => Clk, Res => Reset, Q => Output(1)); 

D_FF2 : D_FF
    Port map ( D => Input(2), Clk => Clk, Res => Reset, Q => Output(2)); 

end Behavioral;
