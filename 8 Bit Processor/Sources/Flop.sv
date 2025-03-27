`timescale 1ns / 1ps

module Flop(
    input logic clk, 
    input logic d,
    output logic q);
    always @(posedge clk)
    q<=d;
endmodule
