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
		$display("foi: 1");
		AluControl		<= 3'b000;
		AluSrc		    <= 1'b0;
		MemtoReg 	    <= 1'b0;
		RegWrite	    <= 1'b1;
		MemWrite	    <= 1'b0;
		jump			<= 1'b0;
		r2Chooser       <= 1'b0;
		end
		if (func == 3'b001) 
<<<<<<< HEAD
=======
		begin
		AluControl		<= 3'b001;
		AluSrc		    <= 1'b0;
		MemtoReg 	    <= 1'b0;
		RegWrite	    <= 1'b1;
		MemWrite	    <= 1'b0;
		jump			<= 1'b0;
		r2Chooser       <= 1'b0;
		end
		if (func == 3'b010) 
		begin
		AluControl		<= 3'b010;
		AluSrc		    <= 1'b0;
		MemtoReg 	    <= 1'b0;
		RegWrite	    <= 1'b1;
		MemWrite	    <= 1'b0;
		jump			<= 1'b0;
		r2Chooser       <= 1'b0;
		end
		if (func == 3'b011) 
		begin
		AluControl		<= 3'b011;
		AluSrc		    <= 1'b0;
		MemtoReg 	    <= 1'b0;
		RegWrite	    <= 1'b1;
		MemWrite	    <= 1'b0;
		jump			<= 1'b0;
		r2Chooser       <= 1'b0;
		end
		if (func == 3'b100) 
>>>>>>> 4d40f576024ded7b75a9a8905cb798f7fa41b0c6
		begin
		$display("foi: 2");
		AluControl		<= 3'b001;
		AluSrc		    <= 1'b0;
		MemtoReg 	    <= 1'b0;
		RegWrite	    <= 1'b1;
		MemWrite	    <= 1'b0;
		jump			<= 1'b0;
		r2Chooser       <= 1'b0;
		end
		if (func == 3'b010) 
		begin
		$display("foi: 3");
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
		$display("foi: 4");
		AluControl		<= 3'b011;
		AluSrc		    <= 1'b0;
		MemtoReg 	    <= 1'b0;
		RegWrite	    <= 1'b1;
		MemWrite	    <= 1'b0;
		jump			<= 1'b0;
		r2Chooser       <= 1'b0;
		end
		if (func == 3'b100) 
		begin
		$display("foi: 5");
		AluControl		<= 3'b100;
		AluSrc		    <= 1'b0;
		MemtoReg 	    <= 1'b0;
		RegWrite	    <= 1'b1;
		MemWrite	    <= 1'b0;
		jump			<= 1'b0;
		r2Chooser       <= 1'b0;
		end
		if (func == 3'b101) 
		begin
		$display("foi: 6");
		AluControl		<= 3'b101;
		AluSrc		    <= 1'b0;
		MemtoReg 	    <= 1'b0;
		RegWrite	    <= 1'b1;
		MemWrite	    <= 1'b0;
		jump			<= 1'b0;
		r2Chooser       <= 1'b0;
		end
		if (func == 3'b110) 
		begin
		$display("foi: 7");
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
		$display("foi: 8");
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
		$display("foi: 9");
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
		$display("foi: 10");
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
		$display("foi: 11");
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
		$display("foi: 12");
		AluControl		<= 3'b111;
		AluSrc		    <= 1'b1;
		RegWrite	    <= 1'b0;		
		MemWrite	    <= 1'b0;
		jump		    <= 1'b1;	
		r2Chooser       <= 1'b0;
		end
	else 
		begin
		$display("foi: 13");
		AluControl		<= 3'b000;
		AluSrc		    <= 1'b0;
		RegWrite	    <= 1'b0;		
		MemWrite	    <= 1'b0;
		jump		    <= 1'b0;	
		r2Chooser       <= 1'b0;
		end
end
endmodule
