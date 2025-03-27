class mult_driver extends uvm_driver #(mult_input_t);
`uvm_component_utils(mult_driver);

//virtual dut_if_base dut_vi;
virtual dut_if dut_vi;

function new(string name, uvm_component parent);
  super.new(name, parent);
endfunction : new

function void build_phase(uvm_phase phase);
	`uvm_info("msg", "Building DRIVER", UVM_NONE)
	
	//if (!uvm_config_db #(virtual dut_if_base)::get (null,"*", "dut_vi", dut_vi) )
	if (!uvm_config_db #(virtual dut_if)::get (null,"*", "dut_vi", dut_vi) )
		`uvm_fatal("my_driver", "No DUT_IF");
	`uvm_info("msg", "DRIVER Done!!!", UVM_NONE)
endfunction : build_phase

task run_phase(uvm_phase phase);
	mult_input_t tx;
	dut_vi.reset_dut();

	forever
	begin
	  seq_item_port.get_next_item(tx);
	  dut_vi.do_mult(tx.A, tx.B, tx.dout);
	  seq_item_port.item_done();
	  //`uvm_info("msg", "transaction done !", UVM_HIGH)
	end
endtask: run_phase

endclass: mult_driver
