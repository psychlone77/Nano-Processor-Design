# Nano-Processor-Design

*All VHDL files are in relevant folders and there are included screenshots of simulations for each component*

![image](https://github.com/psychlone77/Nano-Processor-Design/assets/127029023/24b7ac63-57e2-49fd-9400-5081940fa8f5)
<br>
<br>


## Program ROM - DONE ✅

**Note**:<br>
Simple Lookup table, uses 13-bit instructions so we can add include some more additional instructions if we need.
![image](https://github.com/psychlone77/Nano-Processor-Design/assets/127029023/df47c82d-e4ca-4464-bb0a-e5ca35c50dea)
<br>
<br>


## 3-Bit Adder - DONE ✅

**Note**:<br>
Adder only has one input, other input is always 1
Once '111' is reached the output will reset to '000' and C_out will become '1', which could be useful to indicate an end of program instructions.
![image](https://github.com/psychlone77/Nano-Processor-Design/assets/127029023/a131ad93-793b-46b9-9848-7504357e587c)
<br>


## 2-way 3-bit Mulitplexer - DONE ✅

**Note**:<br>
When Selector is 0 Line0 will be passed and Selector is 1, Line 1 will be passed.
![image](https://github.com/psychlone77/Nano-Processor-Design/assets/127029023/f74aad5e-7c33-4791-9f12-1a113e32515f)


## Program Counter - NOT DONE ❌
Some chatGPT code. Process clk works, using temporary variable to store count until process finished is good. Also must import 3-bit adder send current count to adder, and get back the next count value.
Since next count would depend on previous instruction we must run the program counter half a cycle ahead.

        library IEEE;
        use IEEE.STD_LOGIC_1164.ALL;
        entity ProgramCounter is
            Port (
                clk : in  std_logic;
                reset : in  std_logic;
                count : out std_logic_vector(3 downto 0)
            );
        end ProgramCounter;

        architecture Behavioral of ProgramCounter is
            signal reg_count : std_logic_vector(3 downto 0);
        begin
            process(clk)
            begin
                if rising_edge(clk) then
                    if reset = '1' then
                        reg_count <= (others => '0'); -- Reset to 0
                    else
                        reg_count <= reg_count + 1; -- Increment count
                    end if;
                end if;
            end process;

            count <= reg_count;
        end Behavioral;
