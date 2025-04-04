// bindings.sv

module dataMemory_bind_top;

	bind DataMemory dataMemory_prop dataMemory_bind(
	  .A(A),                        .WD(WD),
	  .out(out),      .mem_write(mem_write),
	  .clk(clk),
      .reset(reset),
	  //outs >> d100, green, atum, bacon, busy;

	  //internals
      .register(register)
	  //.count(count),
	  //.pe(pe),
	  //.ea(ea)
	);

endmodule