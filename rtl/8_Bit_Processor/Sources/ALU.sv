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
			ALU_OP_ADD 	: begin
							aluOut = A + B;
							// $display("OP: %d | A: %d | B: %d | OUT: %d", ALU_OP_ADD, A, B, aluOut);
						  end
			ALU_OP_SUB 	: begin
						  	aluOut = A - B;
							// $display("OP: %d | A: %d | B: %d | OUT: %d", ALU_OP_SUB, A, B, aluOut);
						  end
			ALU_OP_AND 	: begin
						  	aluOut = A & B;
							// $display("OP: %d | A: %d | B: %d | OUT: %d", ALU_OP_AND, A, B, aluOut);
					      end
			ALU_OP_OR	: begin
							aluOut = A | B;
							// $display("OP: %d | A: %d | B: %d | OUT: %d", ALU_OP_OR, A, B, aluOut);
						  end
			ALU_OP_EOR	: begin
						  	aluOut = A ^ B;
						    // $display("OP: %d | A: %d | B: %d | OUT: %d", ALU_OP_EOR, A, B, aluOut);
						  end
			ALU_OP_BIC	: begin
							aluOut = A & ~B;
							// $display("OP: %d | A: %d | B: %d | OUT: %d", ALU_OP_BIC, A, B, aluOut);
						  end
			ALU_OP_RSB	: begin
							aluOut = B - A;
					      	// $display("OP: %d | A: %d | B: %d | OUT: %d", ALU_OP_RSB, A, B, aluOut);
						  end
			ALU_OP_BEQ	: begin
							equality = (A==B)?1'b1:1'b0;
							// $display("OP: %d | A: %d | B: %d | OUT: %d", ALU_OP_BEQ, A, B, equality);
					  	  end
			//default: begin
			//	aluOut = 8'b0;  // Default value when aluControl is not recognized
			//	equality = 1'b0; // Default value for equality output
			//	// $display("ERROR: Unknown ALU operation. aluControl: %b", aluControl);
			//end
	endcase
end
endmodule
