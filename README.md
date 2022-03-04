# ALU32
A 32-bit ALU, includes status flags for Zero, Carry Out, Overflow, and Negative.

## Details
### The Top Level 1 Diagram
A detailed diagram of the innerworkings of the 32-bit ALU is shown below in the diagram.

![alt text](https://github.com/baxtrax/ALU32/blob/main/Images/ALU%20LVL%201.jpg?raw=true)


A ALU is the main "brain" of a CPU. It does the math behind its operations and does many other things such as shifting data and basic evaluation of logic statements.

### Testbench and verification
The ALU is composed into one file. The testbench is also included to verify its functionality. 

#### Flag Verification:
![alt text](https://github.com/baxtrax/ALU32/blob/main/Images/ALU%20Testing%20Flags.png?raw=true)
#### Opcode Verification
![alt text](https://github.com/baxtrax/ALU32/blob/main/Images/ALU%20Testing%20Opcodes.png?raw=true)

## Running it
You can use these files with any type of simulation software. This project I personally used Quartus Prime and its simulation package that comes with named ModelSim(Now updated to QuestaSim) but any software that can run and simulate verilog code should do just fine as well.
