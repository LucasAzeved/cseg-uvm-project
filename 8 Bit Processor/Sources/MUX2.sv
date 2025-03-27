`timescale 1ns / 1ps

module MUX2(
    input logic [7:0] d0, d1,
    output logic [7:0] y,
    input logic s);
    assign y = s ? d1 : d0;
endmodule

