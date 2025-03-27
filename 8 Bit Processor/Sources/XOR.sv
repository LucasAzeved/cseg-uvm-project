`timescale 1ns / 1ps

module XOR(
    input logic a,b,
    output logic y);
    
    assign y = (a&~b)|(~a&b);
    
endmodule
