`timescale 1ns / 1ps

module DataMemory(
    input [7:0] A,
    input [7:0] WD,
    output reg [7:0] out,
    input mem_write,
    input clk,
    input reset
    );

reg [7:0] register [255:0];
assign out = register[A];
always@(posedge clk) 
begin
	if(mem_write) register[A] <= WD;
	
end

endmodule
