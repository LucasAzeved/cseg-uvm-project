// bindings.sv

module dataMemory_bind_top;

	bind DataMemory dataMemory_prop dataMemory_bind(
	  .A(A),                        .WD(WD),
	  .out(out),      .mem_write(mem_write),
	  .clk(clk),
      .reset(reset),
	 

	  //internals
      .register(register)
	);

endmodule