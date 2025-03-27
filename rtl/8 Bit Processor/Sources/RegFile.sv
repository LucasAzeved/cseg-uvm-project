`timescale 1ns / 1ps

module RegFile(A1, A2, A3, WD3, RD1, RD2, WE3, clk);
    input [2:0] A1, A2, A3;
    input [7:0] WD3;
    output [7:0] RD1, RD2;
    input WE3;
    input clk;

  reg [7:0] registers [7:0];

  assign  RD1 = registers[A1];
  assign  RD2 = registers[A2];
  
  
  initial begin
     registers[0] <= 8'd5;
     registers[1] <= 8'd12;
     registers[2] <= 8'd27;
     registers[3] <= 8'd30;
     registers[4] <= 8'd43;
     registers[5] <= 8'd57;
     registers[6] <= 8'd69;
     registers[7] <= 8'd102;
end
  always @ (posedge clk) 
  begin
    if(WE3)
        registers[A3] <=  WD3; 
  end
  
endmodule
