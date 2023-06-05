----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 02:34:27 PM
-- Design Name: 
-- Module Name: Processor_4bit_Sim - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Processor_4bit_Sim is
--  Port ( );
end Processor_4bit_Sim;

architecture Behavioral of Processor_4bit_Sim is


    component Processor_4bit
        Port ( Clk : in STD_LOGIC;
               Reset : in STD_LOGIC;
               OverFlow : out STD_LOGIC;
               ZeroFlag : out STD_LOGIC;
               sevenSeg : out STD_LOGIC_VECTOR (6 downto 0)
               );
    end component;
    
    signal Clk, Reset, OverFlow, ZeroFlag : std_logic;
    signal sevenSeg : std_logic_vector (6 downto 0);
    
    -- Declare signals for internal monitoring
    signal AdderOut: std_logic_vector (2 downto 0);
    signal PC_out: std_logic_vector (2 downto 0);
    signal MUX_23_out: std_logic_vector (2 downto 0);
    signal RegSel_1: std_logic_vector (2 downto 0);
    signal RegSel_2: std_logic_vector (2 downto 0);
    signal RegEn: std_logic_vector (2 downto 0);
    signal MUX_24_out: std_logic_vector (3 downto 0);
    signal Value: std_logic_vector (3 downto 0);
    signal AddSub_out: std_logic_vector (3 downto 0);
    signal A: std_logic_vector (3 downto 0);
    signal B: std_logic_vector (3 downto 0);
    signal PR_out: std_logic_vector (12 downto 0);
    signal AdderCarry: std_logic;
    signal sClk: std_logic;
    signal JMP_flag: std_logic;
    signal AddSub_ZF: std_logic;
    signal LoadSel: std_logic;
    signal AddSubSel: std_logic;
    signal C_out: std_logic;
    signal JMP_address: std_logic_vector (2 downto 0);
    signal Reg0: std_logic_vector (3 downto 0);
    signal Reg1: std_logic_vector (3 downto 0);
    signal Reg2: std_logic_vector (3 downto 0);
    signal Reg3: std_logic_vector (3 downto 0);
    signal Reg4: std_logic_vector (3 downto 0);
    signal Reg5: std_logic_vector (3 downto 0);
    signal Reg6: std_logic_vector (3 downto 0);
    signal Reg7: std_logic_vector (3 downto 0);
    signal MUX_84_A_out: std_logic_vector (3 downto 0);
    signal MUX_84_B_out: std_logic_vector (3 downto 0);

begin

    UUT : Processor_4bit Port Map (
        Clk => Clk,
        Reset => Reset,
        OverFlow => OverFlow,
        ZeroFlag => ZeroFlag,
        sevenSeg => sevenSeg
        );

    process
        begin
            Clk <= '0';
            wait for 20ns;
            while true loop
                Clk <= not(Clk);
                wait for 10ns;
                Clk <= not(Clk);
                wait for 10ns;
            end loop;
    end process;
    
    process
        begin
            Reset <= '1';
            wait for 40ns;
            Reset <= '0';
            wait;
    end process;
    

    -- Add processes for monitoring internal signals
    monitor_process: process
    begin
        while now < 1000 ns loop  -- Adjust the simulation time as needed
            -- Monitor internal signals here
            AdderOut <= UUT.AdderOut;
            PC_out <= UUT.PC_out;
            MUX_23_out <= UUT.MUX_23_out;
            RegSel_1 <= UUT.RegSel_1;
            RegSel_2 <= UUT.RegSel_2;
            RegEn <= UUT.RegEn;
            MUX_24_out <= UUT.MUX_24_out;
            Value <= UUT.Value;
            AddSub_out <= UUT.AddSub_out;
            A <= UUT.A;
            B <= UUT.B;
            PR_out <= UUT.PR_out;
            AdderCarry <= UUT.AdderCarry;
            sClk <= UUT.sClk;
            JMP_flag <= UUT.JMP_flag;
            AddSub_ZF <= UUT.AddSub_ZF;
            LoadSel <= UUT.LoadSel;
            AddSubSel <= UUT.AddSubSel;
            C_out <= UUT.C_out;
            JMP_address <= UUT.JMP_address;
            Reg0 <= UUT.Reg0;
            Reg1 <= UUT.Reg1;
            Reg2 <= UUT.Reg2;
            Reg3 <= UUT.Reg3;
            Reg4 <= UUT.Reg4;
            Reg5 <= UUT.Reg5;
            Reg6 <= UUT.Reg6;
            Reg7 <= UUT.Reg7;
            MUX_84_A_out <= UUT.MUX_84_A_out;
            MUX_84_B_out <= UUT.MUX_84_B_out;

            -- Wait for some time before sampling again
            wait for 1 ns;
        end loop;
        wait;
    end process monitor_process;

    

end Behavioral;
