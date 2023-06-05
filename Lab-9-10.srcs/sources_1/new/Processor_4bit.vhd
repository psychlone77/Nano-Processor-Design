----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 10:49:49 AM
-- Design Name: 
-- Module Name: Processor-4bit - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Processor_4bit is
    Port ( Clk : in STD_LOGIC;
           Reset : in STD_LOGIC;
           OverFlow : out STD_LOGIC;
           ZeroFlag : out STD_LOGIC;
           led : out STD_LOGIC_VECTOR (3 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0);
           sevenSeg : out STD_LOGIC_VECTOR (6 downto 0)
           );
end Processor_4bit;

architecture Behavioral of Processor_4bit is

    component ProgramROM
        Port ( address : in STD_LOGIC_VECTOR (2 downto 0);
                data : out STD_LOGIC_VECTOR (12 downto 0));
    end component;
    
    component ProgramCounter
        Port (
            Input : in std_logic_vector (2 downto 0);
            Clk : in  std_logic;
            Reset : in  std_logic;
            Output : out std_logic_vector(2 downto 0)
        );
    end component;
    
    component ThreeBitAdder
        Port ( A : in STD_LOGIC_VECTOR (2 downto 0);
               S : out STD_LOGIC_VECTOR (2 downto 0);
               C_out : out STD_LOGIC);
    end component;
    
    component TwoLine3bitMUX
        Port ( Line0 : in STD_LOGIC_VECTOR (2 downto 0);
               Line1 : in STD_LOGIC_VECTOR (2 downto 0);
               Sel : in STD_LOGIC;
               LineOut : out STD_LOGIC_VECTOR (2 downto 0));
    end component;
    
    component InstructionDecoder
        Port ( Ins : in STD_LOGIC_VECTOR (12 downto 0);
               ZeroFlag : in STD_LOGIC;
               AddSubSel : out STD_LOGIC;
               RegSel_1 : out STD_LOGIC_VECTOR (2 downto 0);
               RegSel_2 : out STD_LOGIC_VECTOR (2 downto 0);
               Value : out STD_LOGIC_VECTOR (3 downto 0);
               LoadSel : out STD_LOGIC;
               RegEn : out STD_LOGIC_VECTOR (2 downto 0);
               JMP_Address : out STD_LOGIC_VECTOR (2 downto 0);
               JMP_Flag : out STD_LOGIC);
    end component;
    
    component TwoLine4bitMUX
        Port ( Line0 : in STD_LOGIC_VECTOR (3 downto 0);
               Line1 : in STD_LOGIC_VECTOR (3 downto 0);
               Sel : in STD_LOGIC;
               LineOut : out STD_LOGIC_VECTOR (3 downto 0));
    end component;
    
    component Add_Sub_Unit
        Port (  A : in STD_LOGIC_vector (3 downto 0); --First Input
                B : in STD_LOGIC_vector (3 downto 0); --Second Input, this input will be inversed when M=1
                M : in STD_LOGIC; -- Add or Subtract Select
                S : out STD_LOGIC_vector(3 downto 0); -- Output
                C_out : out STD_LOGIC; -- Carry Out
                Zero_Flag : out STD_LOGIC;
                V : out STD_LOGIC); -- OverFlow bit
    end component;
    
    component MUX_8way_4bit
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
    end component;
    
    component Reg_Bank
        Port ( D : in STD_LOGIC_VECTOR (3 downto 0); --input bits
               RegEn : in STD_LOGIC_VECTOR (2 downto 0); --which register to enable
               Reset : in STD_LOGIC;
               Clk : in STD_LOGIC;
               Out0 : out STD_LOGIC_VECTOR (3 downto 0);
               Out1 : out STD_LOGIC_VECTOR (3 downto 0);
               Out2 : out STD_LOGIC_VECTOR (3 downto 0);
               Out3 : out STD_LOGIC_VECTOR (3 downto 0);
               Out4 : out STD_LOGIC_VECTOR (3 downto 0);
               Out5 : out STD_LOGIC_VECTOR (3 downto 0);
               Out6 : out STD_LOGIC_VECTOR (3 downto 0);
               Out7 : out STD_LOGIC_VECTOR (3 downto 0)
               );
    end component;
    
    component Slow_Clk
        Port ( Clk_in : in STD_LOGIC;
               Clk_out : out STD_LOGIC);
    end component;
    
    component LUT_16_7
        Port ( address : in STD_LOGIC_VECTOR (3 downto 0);
                data : out STD_LOGIC_VECTOR (6 downto 0));
    end component;
    
    signal AdderOut, PC_out, MUX_23_out, RegSel_1, RegSel_2, RegEn  : std_logic_vector (2 downto 0);
    signal MUX_24_out, Value, AddSub_out : std_logic_vector (3 downto 0);
    signal PR_out : std_logic_vector (12 downto 0);
    signal AdderCarry : std_logic;
    signal sClk, JMP_flag, AddSub_ZF, LoadSel, AddSubSel, C_out : std_logic;
    signal JMP_address : std_logic_vector (2 downto 0);
    signal Reg0, Reg1, Reg2, Reg3, Reg4, Reg5, Reg6, Reg7 : std_logic_vector (3 downto 0);
    signal MUX_84_A_out, MUX_84_B_out : std_logic_vector (3 downto 0);


begin

    Slow_Clk_0 : Slow_Clk port map ( Clk_in => Clk, Clk_out => sClk );
    
    PC : ProgramCounter port map ( Input => MUX_23_out, Clk => sClk, Reset => Reset, Output => PC_out );
    
    Adder : ThreeBitAdder port map ( A => PC_out, S => AdderOut, C_out => AdderCarry );
    
    MUX_23 : TwoLine3bitMUX port map ( Line0 => AdderOut, Line1 => JMP_address, Sel => JMP_flag, LineOut => MUX_23_out ); --fix inputs
    
    PR : ProgramROM port map ( address => PC_out, data => PR_out );
    
    LUT_7seg : LUT_16_7 port map ( address => Reg7, data => sevenSeg );
    
    MUX_24 : TwoLine4bitMUX port map ( Line0 => AddSub_out, Line1 => Value, Sel => LoadSel, LineOut => MUX_24_out );
    
    ID : InstructionDecoder 
        port map (  Ins => PR_out, 
                    ZeroFlag => AddSub_ZF,
                    AddSubSel => AddSubSel,
                    RegSel_1 => RegSel_1,
                    RegSel_2 => RegSel_2,
                    Value => Value,
                    LoadSel => LoadSel,
                    RegEn => RegEn,
                    JMP_Address => JMP_address,
                    JMP_Flag => JMP_flag
                    );
    
    AddSub : Add_Sub_Unit 
        port map (  A => MUX_84_B_out,
                    B => MUX_84_A_out,
                    M => AddSubSel,
                    S => AddSub_out,
                    C_out => C_out,
                    Zero_Flag => AddSub_ZF,
                    V => Overflow
                    );
    
    MUX_84_A : MUX_8way_4bit
        port map (  RegSel => RegSel_1, 
                    Reg0 => Reg0,
                    Reg1 => Reg1,
                    Reg2 => Reg2,
                    Reg3 => Reg3,
                    Reg4 => Reg4,
                    Reg5 => Reg5,
                    Reg6 => Reg6,
                    Reg7 => Reg7,
                    S => MUX_84_A_out
                    );
                    
    MUX_84_B : MUX_8way_4bit
        port map (  RegSel => RegSel_2, 
                    Reg0 => Reg0,
                    Reg1 => Reg1,
                    Reg2 => Reg2,
                    Reg3 => Reg3,
                    Reg4 => Reg4,
                    Reg5 => Reg5,
                    Reg6 => Reg6,
                    Reg7 => Reg7,
                    S => MUX_84_B_out
                    );
                                  
    
    RB : Reg_Bank 
        port map (  D => MUX_24_out,
                    RegEn => RegEn,
                    Reset => Reset,
                    Clk => sClk,
                    Out0 => Reg0,
                    Out1 => Reg1,
                    Out2 => Reg2,
                    Out3 => Reg3,
                    Out4 => Reg4,
                    Out5 => Reg5,
                    Out6 => Reg6,
                    Out7 => Reg7
                    );
                    
    process(AddSub_ZF)
    begin
        ZeroFlag <= AddSub_ZF;
    end process;
    
    an <= "1110"; --anode output
    
    process(Reg7)
    begin
        led <= Reg7;
    end process;

end Behavioral;
