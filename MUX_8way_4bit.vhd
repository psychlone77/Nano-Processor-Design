library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity MUX_8way_4bit is
Port (  RegSel : in STD_LOGIC_VECTOR (2 downto 0);
        Reg0 : in STD_LOGIC_VECTOR (3 downto 0);
        Reg1 : in STD_LOGIC_VECTOR (3 downto 0);
        Reg2 : in STD_LOGIC_VECTOR (3 downto 0);
        Reg3 : in STD_LOGIC_VECTOR (3 downto 0);
        Reg4 : in STD_LOGIC_VECTOR (3 downto 0);
        Reg5 : in STD_LOGIC_VECTOR (3 downto 0);
        Reg6 : in STD_LOGIC_VECTOR (3 downto 0);
        Reg7 : in STD_LOGIC_VECTOR (3 downto 0);
        S : out STD_LOGIC_vector(3 downto 0));
end MUX_8way_4bit;
architecture Behavioral of MUX_8way_4bit is
signal varSel : std_logic_vector(2 downto 0);

--begin
----when (varSel="000") then
begin
varSel<=RegSel;
pro_1:Process(varSel)
Begin 
        Case varSel IS
            when "000" => S<=Reg0;
            when "001" => S<=Reg1;
            when "010" => S<=Reg2;
            when "011" => S<=Reg3;
            when "100" => S<=Reg4;
            when "101" => S<=Reg5;
            when "110" => S<=Reg6;
            when others => S<=Reg7;
   end case;     
 end process;
 
end Behavioral;




