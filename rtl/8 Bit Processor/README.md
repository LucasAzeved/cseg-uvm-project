# 8 Bit Single Cycle Processor in SystemVerilog

This is the endsem project of fourth term in EU. A simple 8 bit processor with 16 bit instruction set. This al includes some extra circuit elements we did throught the semester
(NBitFullAdder, flop, XOR and 4 input mux). Special thanks to axel223 for his repository.

This processor consists of these parts: 
###### Program Counter: One 8-bit register
###### Register File: Holds 8-bit 8 register
###### Instruction Memory: 8-bit address input, and outputs 16-bit
###### Data Memory: 8-bit read/write memory
###### ALU: Performs arithmetic and logical operations

## Instruction Format
Instructions are 16 bit and format is as follows:

|Type           |15-12	        |11-9	          |8-6	          |5-3	          |2-0      |
| ------------- | ------------- | ------------- | ------------- | ------------- | --------|
|R (register)	  |Opcode	        |Rd	            |Ra	            |Rb	            | Func    |
|I (immediate)  |Opcode	        |RD             |Ra	            |Imm[5:0]
|J (jump)	      |Opcode	        |[11:8] dont care|	            Addr [7:0]

## Instruction Set
|Instruction	    |Opcode/Func	|Type	  |Operation                            |
| --------------- | ----------- | ----- | ----------------------------------- |
|ADD rd, ra, rb	  |0000 / 000	  |R	    |rd             = ra + rb                   |
|SUB rd, ra, rb	  |0000 / 010	  |R	    |rd            = ra - rb                |
|AND rd, ra, rb	  |0000 / 100	  |R	    |rd             = ra AND rb              |
|OR rd, ra, rb	  |0000 / 101	  |R	    |rd             = ra OR rb               |
|XOR rd, ra, rb	  |0000 / 101	  |R	    |rd             = ra XOR rb               |
|BIC rd, ra, rb	  |0000 / 101	  |R	    |rd             = ra & ~rb               |
|RSB rd, ra, rb	  |0000 / 101	  |R	    |rd             = rb - ra               |
|ADDI rd, ra, imm	|0100	        |I	    |rd             = ra + imm               |
|LW rd, imm(ra)	  |1011	        |I	    |rd             = DMEM[ra + imm]         |
|SW rd, imm(ra)	  |1111	        |I	    |DMEM[ra + imm] =  rd         |
|BEQ rd, ra, imm	|1000	        |I	    |If (ra == rb) pc =  pc + imm |
|J addr	          |0010	        |J	    |pc = addr + addr                      | 

## Circuit elements

###### Instruction Memory
Contains instructions and also PC. Takes extended immediate, jump and equality as inputs. Outputs instructions and calculates PC according to jump and branch.

###### Register File
8 bit 8 registers. Takes 2 address , 1 data and 1 write address inputs and outputs ra and rb. Also takes RegWrite as input to determine if it will write the data to registers.

###### Data Memory
8 bit 256 registers. Takes data and address as an inputs and outputs data. Takes clock as an input and therefore is sequantial.

###### Arithmetic and Logic Unit (ALU)
Brain of the processor. Performs math operations. Outputs result and br. br is 1 if ra and rb is equal.

###### Control unit
Takes opcode and func as input and sends signals to other parts. Decides what operation will the alu perform or if the register will write etc.
Signals and what they do:

RegWrite: Decides if the calculated value will be written to regfile <br/>
ALUSrc: Decides if this is an immediate operation, or a register operation <br/>
AluControl: Tells ALU what operation to perform <br/>
MemWrite: Decides if the calculated value will be written to memory <br/>
MemToReg: Decides if data being written into the register file comes from memory or from output of the ALU <br/>
Jump: Tells the instructionMemory this is an jump operation <br/>
Branch: This actually outputs from ALU. If ra=rb, br is 1. <br/>
r2Chooser: For SW and BEQ we need to read rd. So this signals lets us choose between rd or rb for RD2 <br/>


