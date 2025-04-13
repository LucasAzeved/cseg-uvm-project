// fpv.sv

//module interface (entity)
module dataMemory_prop (
  input  logic clk,         
  input  logic reset,
  input  logic [7:0] A,   // addr_in
  input  logic [7:0] WD,  // data_in
  input  logic [7:0] out, // data_out
  input  logic mem_write, // wb-byte

  // internals
  input  logic [7:0] register [255:0] // memory cells
);

default clocking @(posedge clk); endclocking //defaults all assertions to posedge

property mem_write_prop;
	@(posedge clk) disable iff (reset)
    mem_write |-> ##1 register[$past(A)] == $past(WD);
endproperty
mem_write_assertion : assert property (mem_write_prop);

endmodule /* dataMemory_prop */
