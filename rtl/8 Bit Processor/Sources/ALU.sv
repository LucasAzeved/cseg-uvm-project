`timescale 1ns / 1ps

module ALU(
    input [7:0] A,
    input [7:0] B,
    output reg [7:0] aluOut,
    input [2:0] aluControl, 
    output reg equality
	);

parameter	ALU_OP_ADD	= 3'b000,
			ALU_OP_SUB	= 3'b001,
			ALU_OP_AND	= 3'b010,
			ALU_OP_OR	= 3'b011,
			ALU_OP_EOR	= 3'b100,
			ALU_OP_BIC	= 3'b101,
			ALU_OP_RSB	= 3'b110,
			ALU_OP_BEQ	= 3'b111;
always @(*) 
begin
	case(aluControl)
			ALU_OP_ADD 	: aluOut = A + B;
			ALU_OP_SUB 	: aluOut = A - B;
			ALU_OP_AND 	: aluOut = A & B;
			ALU_OP_OR	: aluOut = A | B;
			ALU_OP_EOR	: aluOut = A ^ B;
			ALU_OP_BIC	: aluOut = A & ~B;
			ALU_OP_RSB	: aluOut = B - A;
			ALU_OP_BEQ	: begin
							 equality = (A==B)?1'b1:1'b0; 
						  end
	endcase
end
endmodule
