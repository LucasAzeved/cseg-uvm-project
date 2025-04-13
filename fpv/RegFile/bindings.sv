// bindings.sv

module regFile_bind_top;

	bind RegFile regFile_prop regFile_bind(
	  
    // binds interface
    .A1(A1),
    .A2(A2),
    .A3(A3),
    .WD3(WD3),
    .RD1(RD1),
    .RD2(RD2),
    .WE3(WE3),
    .clk(clk),
    .reset(reset),

    //internals
    .registers(registers)
	);

endmodule