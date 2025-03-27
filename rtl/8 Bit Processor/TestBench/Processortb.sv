`timescale 1ns / 1ps

module Processortb();
reg clk;
reg [15:0] out;
Processor dut(clk, out);

initial begin 
    clk = 0;
    forever #25 clk = ~clk;  
    end

endmodule
