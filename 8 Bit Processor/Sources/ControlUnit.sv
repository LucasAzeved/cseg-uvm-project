`timescale 1ns / 1ps

module ControlUnit(
    input [3:0] opcode,
    input [2:0] func,
    output reg RegWrite,
    output reg AluSrc,
    output reg [2:0] AluControl,
    output reg MemWrite,
    output reg MemtoReg,
    output reg jump,
    output reg r2Chooser);
always @(*) 
begin
	if (opcode == 4'b0000) 
	begin
		if (func == 3'b000) 
		begin
		AluControl		<= 3'b000;
		AluSrc		    <= 1'b0;
		MemtoReg 	    <= 1'b0;
		RegWrite	    <= 1'b1;
		MemWrite	    <= 1'b0;
		jump			<= 1'b0;
		r2Chooser       <= 1'b0;
		end
		if (func == 3'b010) 
		begin
		AluControl		<= 3'b001;
		AluSrc		    <= 1'b0;
		MemtoReg 	    <= 1'b0;
		RegWrite	    <= 1'b1;
		MemWrite	    <= 1'b0;
		jump			<= 1'b0;
		r2Chooser       <= 1'b0;
		end
		if (func == 3'b100) 
		begin
		AluControl		<= 3'b010;
		AluSrc		    <= 1'b0;
		MemtoReg 	    <= 1'b0;
		RegWrite	    <= 1'b1;
		MemWrite	    <= 1'b0;
		jump			<= 1'b0;
		r2Chooser       <= 1'b0;
		end
		if (func == 3'b101) 
		begin
		AluControl		<= 3'b011;
		AluSrc		    <= 1'b0;
		MemtoReg 	    <= 1'b0;
		RegWrite	    <= 1'b1;
		MemWrite	    <= 1'b0;
		jump			<= 1'b0;
		r2Chooser       <= 1'b0;
		end
		if (func == 3'b001) 
		begin
		AluControl		<= 3'b100;
		AluSrc		    <= 1'b0;
		MemtoReg 	    <= 1'b0;
		RegWrite	    <= 1'b1;
		MemWrite	    <= 1'b0;
		jump			<= 1'b0;
		r2Chooser       <= 1'b0;
		end
		if (func == 3'b011) 
		begin
		AluControl		<= 3'b101;
		AluSrc		    <= 1'b0;
		MemtoReg 	    <= 1'b0;
		RegWrite	    <= 1'b1;
		MemWrite	    <= 1'b0;
		jump			<= 1'b0;
		r2Chooser       <= 1'b0;
		end
		if (func == 3'b111) 
		begin
		AluControl		<= 3'b110;
		AluSrc		    <= 1'b0;
		MemtoReg 	    <= 1'b0;
		RegWrite	    <= 1'b1;
		MemWrite	    <= 1'b0;
		jump			<= 1'b0;
		r2Chooser       <= 1'b0;
		end
	end
	else if (opcode==4'b0100)
		begin
		AluControl		<= 3'b000;
		AluSrc		    <= 1'b1;
		MemtoReg 	    <= 1'b0;
		RegWrite	    <= 1'b1;
		MemWrite	    <= 1'b0;
		jump		    <= 1'b0;
		r2Chooser       <= 1'b0;	
		end
	else if (opcode==4'b1011)
		begin
		AluControl		<= 3'b000;
		AluSrc		    <= 1'b1;
		MemtoReg 	    <= 1'b1;
		RegWrite	    <= 1'b1;
		MemWrite	    <= 1'b0;
		jump		    <= 1'b0;
		r2Chooser       <= 1'b0;	
		end
	else if (opcode==4'b1111)
		begin
		AluControl		<= 3'b000;
		AluSrc		    <= 1'b1;
		RegWrite	    <= 1'b0;
		MemWrite	    <= 1'b1;
		MemtoReg        <= 1'b0;
		jump		    <= 1'b0;	
		r2Chooser       <= 1'b1;
		end
	else if (opcode==4'b1000)
		begin
		AluControl		<= 3'b111;
		AluSrc		    <= 1'b0;
		RegWrite	    <= 1'b0;
		MemWrite	    <= 1'b0;
		MemtoReg        <= 1'b0;
		jump		    <= 1'b0;	
		r2Chooser       <= 1'b1;
		end
	else if (opcode==4'b0010)
		begin
		AluSrc		    <= 1'b1;
		RegWrite	    <= 1'b0;		
		MemWrite	    <= 1'b0;
		jump		    <= 1'b1;	
		r2Chooser       <= 1'b0;
		end
end
endmodule
