`timescale 1ns / 1ps

module InstructionMemory(
    input [7:0] extendedIm,
    input equality,
    input jump,
    output reg [15:0] out,
    input logic clk,
    output reg [5:0] PC);

reg [15:0] instruction_memory [31:0];

// Opcode 
//  0000  000 000 000 000

initial instruction_memory[0] = 16'b0000_010_001_000_000; // Type R | Rd = r001 - r000 | ADD
initial instruction_memory[1] = 16'b0000_010_001_000_001; // Type R | Rd = r001 - r000 | SUB
initial instruction_memory[2] = 16'b0000_011_010_000_010; // Type R | Rd = r001 - r000 | AND
initial instruction_memory[3] = 16'b0000_011_010_000_011; // Type R | Rd = r001 - r000 | OR
initial instruction_memory[4] = 16'b0000_101_011_100_100; // Type R | Rd = r001 - r000 | EOR
initial instruction_memory[5] = 16'b0000_111_101_110_101; // Type R | Rd = r001 - r000 | BIC
initial instruction_memory[6] = 16'b0000_111_101_111_111; // Type R | Rd = r001 - r000 | BEQ
initial instruction_memory[7] = 16'b0100_111_111_001111;  // Type I | Rd = r001 - r000 | ADDI
initial instruction_memory[8] = 16'b1111_111_010_001000;  // Type I | Rd = r001 - r000 | SW
initial instruction_memory[9] = 16'b1011_111_011_001001;
initial instruction_memory[10] = 16'b0100_000_010_001000;
initial instruction_memory[11] = 16'b0100_001_010_001000;
initial instruction_memory[12] = 16'b1000_000_001_000110;
initial instruction_memory[18] = 16'b0000_010_001_000_000;
initial instruction_memory[19] = 16'b0010_0011_00000011;
initial instruction_memory[22] = 16'b0100_001_001_010011;

initial PC = 5'b00; 

assign out = instruction_memory[PC];

always @(posedge clk) 
begin
    if(jump != 1'b0)
        PC <= PC + out[7:0];
    else if (equality == 1'b1)
        PC <= PC + extendedIm;
    else 
        PC <= PC + 8'd1;
end

endmodule
