# Nano-Processor-Design

*All VHDL files are in relevant folders and there are included screenshots of simulations for each component*

![image](https://github.com/psychlone77/Nano-Processor-Design/assets/127029023/24b7ac63-57e2-49fd-9400-5081940fa8f5)
<br> http://dilum.bandara.lk/wp-content/uploads/CourseNotes/CS2052CA/Lab-9-10-–-Nanoprocessor-Design-Competition.pdf
![image](https://github.com/psychlone77/Nano-Processor-Design/assets/127029023/f6c42d60-6524-4ac8-978b-5c4aa7db6c27)

<br>
<br>


## Program ROM - DONE ✅

**Note**:<br>
Simple Lookup table, uses 13-bit instructions so we can include some more additional instructions if we need.
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
*Edit: Changed the code to use logic gates.*
![image](https://github.com/psychlone77/Nano-Processor-Design/assets/127029023/f74aad5e-7c33-4791-9f12-1a113e32515f)


## Program Counter - DONE ✅
**Note**:<br>
Program Counter has an input and a output. While output will only be set when the clock edge is 'falling'. Had to use D-Flip flops from Lab5.
![image](https://github.com/psychlone77/Nano-Processor-Design/assets/127029023/1b7b5496-5f06-43a1-a375-da9aa1956221)


## Instruction Decoder - DONE ✅

**Note**:<br>
All instructions were tested and simulated. I have created a 13 bit instruction, so we can include extra instructions in the future as need be. Also we could use the zero flag from the 4bit adder to directly for the Jump instruction.
![image](https://github.com/psychlone77/Nano-Processor-Design/assets/127029023/b7811b2a-c1c4-414c-b110-0502941b280b)


## 4-bit Adder-Sub Unit - DONE ✅

**Note**:<br>
OverFlow and ZeroFlag are the main differences. Also input B is the input which will be converted to its negative when we try to subtract the 2 numbers by setting M = '1'.
![image](https://github.com/psychlone77/Nano-Processor-Design/assets/127029023/37a04da8-3692-4177-9606-04dea3f59379)


## Register Bank - DONE ✅

**Note**:<br>
We included 8 registers with a 3 to 8 decoder to select which register to enable. Also Register 0 is hardcoded to "0000" so it doesn't interfere with the adder when we want to select only one register.
![image](https://github.com/psychlone77/Nano-Processor-Design/assets/129372525/04de7e32-02b9-42da-849f-68b5092c053e)


## 8 way 4-bit Multiplexer - NOT DONE 🟡

**Note**:<br>
We need to use logic gates to build it.

        library ieee;
        use ieee.std_logic_1164.all;

        entity EightWay4BitMux is
            port (
                Sel3, Sel2, Sel1, Sel0 : in std_logic_vector(3 downto 0);
                Input0, Input1, Input2, Input3, Input4, Input5, Input6, Input7 : in std_logic_vector(3 downto 0);
                Output : out std_logic_vector(3 downto 0)
            );
        end EightWay4BitMux;

        architecture Behavioral of EightWay4BitMux is
        begin
            process(Sel3, Sel2, Sel1, Sel0, Input0, Input1, Input2, Input3, Input4, Input5, Input6, Input7)
            begin
                Output <= (Sel3 and Sel2 and Sel1 and Sel0)     and Input0     or
                          (Sel3 and Sel2 and Sel1 and not Sel0) and Input1     or
                          (Sel3 and Sel2 and not Sel1 and Sel0) and Input2     or
                          (Sel3 and Sel2 and not Sel1 and not Sel0) and Input3 or
                          (Sel3 and not Sel2 and Sel1 and Sel0) and Input4     or
                          (Sel3 and not Sel2 and Sel1 and not Sel0) and Input5 or
                          (Sel3 and not Sel2 and not Sel1 and Sel0) and Input6 or
                          (Sel3 and not Sel2 and not Sel1 and not Sel0) and Input7;
            end process;
        end Behavioral

