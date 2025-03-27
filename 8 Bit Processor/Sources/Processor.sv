`timescale 1ns / 1ps

module Processor(
input reg clk,
output reg [15:0] out);

reg [15:0] instruction; 
reg [7:0] RD1,RD2;
reg [7:0] extendOut;
reg [7:0] aluMuxOut;
reg [7:0] aluResult;
reg RegWrite,
 AluSrc, MemWrite, MemtoReg, jump, r2Chooser, equality;
reg [5:0] PC;
reg [2:0] AluControl;
reg [7:0] dataMemOut;
reg [7:0] finalMuxOut;
reg [2:0] r2chooseout;

ControlUnit CU(instruction[15:12], instruction[2:0], RegWrite, AluSrc,
    AluControl, MemWrite, MemtoReg, jump, r2Chooser);
    
InstructionMemory im(extendOut, equality, jump, instruction, clk, PC);

MUX2 R2Mux(instruction[5:3], instruction[11:9], r2chooseout, r2Chooser);

MUX2 muxBeforeAlu(RD2, extendOut, aluMuxOut, AluSrc);

MUX2 finalMux(aluResult, dataMemOut, finalMuxOut, MemtoReg);

RegFile rf(instruction[8:6], r2chooseout, instruction[11:9], finalMuxOut, RD1, RD2, RegWrite, clk);

ALU alu(RD1, aluMuxOut, aluResult, AluControl, equality);

Extend ex(instruction[5:0], extendOut);

DataMemory dm(aluResult, RD2, dataMemOut, MemWrite, clk);

assign out = finalMuxOut;
endmodule

