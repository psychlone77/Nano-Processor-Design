# Nano-Processor-Design

*All VHDL files are in relevant folders and there are included screenshots of simulations for each component*

![image](https://github.com/psychlone77/Nano-Processor-Design/assets/127029023/24b7ac63-57e2-49fd-9400-5081940fa8f5)
<br> http://dilum.bandara.lk/wp-content/uploads/CourseNotes/CS2052CA/Lab-9-10-–-Nanoprocessor-Design-Competition.pdf
![image](https://github.com/psychlone77/Nano-Processor-Design/assets/127029023/f6c42d60-6524-4ac8-978b-5c4aa7db6c27)

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


## 2-way 3-bit Mulitplexer - Edit made 🟡

**Note**:<br>
When Selector is 0 Line0 will be passed and Selector is 1, Line 1 will be passed.
![image](https://github.com/psychlone77/Nano-Processor-Design/assets/127029023/f74aad5e-7c33-4791-9f12-1a113e32515f)


## Program Counter - DONE ✅
**Note**:<br>
Program Counter has an input and a output. While output will only be set when the clock edge is 'falling'.
![image](https://github.com/psychlone77/Nano-Processor-Design/assets/127029023/1b7b5496-5f06-43a1-a375-da9aa1956221)

