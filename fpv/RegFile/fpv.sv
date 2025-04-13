// fpv.sv

//module interface (entity)
module regFile_prop (

  input logic [2:0] A1, 
  input logic [2:0] A2, 
  input logic [2:0] A3,
  input logic [7:0] WD3,
  input logic [7:0] RD1, 
  input logic [7:0] RD2,
  input logic WE3,
  input logic clk,
  input logic reset,

  // internals
  input logic [7:0] registers [7:0]
);

default clocking @(posedge clk); endclocking 

property reg_write_prop;
	@(posedge clk) disable iff (reset)
    WE3 |-> ##1 registers[$past(A3)] == $past(WD3);
endproperty
reg_write_assertion : assert property (reg_write_prop);

endmodule /* regFile_prop */
