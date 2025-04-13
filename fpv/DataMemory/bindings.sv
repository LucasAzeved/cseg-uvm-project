// bindings.sv

module dataMemory_bind_top;

	bind DataMemory dataMemory_prop dataMemory_bind(
    .clk(clk),
    .reset(reset),
    
    // binds interface
	  .A(A),
    .WD(WD),
	  .out(out),
    .mem_write(mem_write),
	  
	  //internals
    .register(register)
	);

endmodule
