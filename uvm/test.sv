//import uvm_package
import uvm_pkg::*;
`include "uvm_macros.svh"
`include "env.sv"
`include "our_sequence.sv"
// Include files from fpv and rtl folders
`include "../fpv/RegFile/fpv.sv"
`include "../rtl/regfile_if.svh"

class basic_test extends uvm_test;
    //use macro to register component/object to the factory.
    `uvm_component_utils(basic_test)

    //instantiate virtual interface, the environment, and sequence to send
    virtual regfile_if vif;
    env test_env;
    our_sequence seq;

    function new(string name = "basic_test", uvm_component parent = null);
        super.new(name, parent);
    endfunction: new

    virtual function void build_phase(uvm_phase phase);
      super.build_phase(phase);
      test_env = env::type_id::create("test_env", this);
      seq = our_sequence::type_id::create("seq");

      //get the interface from the config_db
      if (!uvm_config_db#(virtual regfile_if)::get(this, "", "vif", vif)) begin
          `uvm_fatal(get_type_name(), "failed to get handle to virtual interface")
      end

      //Pass interface to all descendants
      uvm_config_db#(virtual regfile_if)::set(this, "*", "vif", vif);
    endfunction: build_phase

    virtual function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
        uvm_top.print_topology();
    endfunction: end_of_elaboration_phase
    
    virtual task run_phase(uvm_phase phase);
        phase.raise_objection(this, "raise objection for basic test");
        $display("%t run_phase of test started", $time);
        seq.start(test_env.agt.sqr);
        phase.drop_objection(this, "drop objection for basic test");
    endtask: run_phase
endclass: basic_test


// class our_test extends uvm_test;

// 	`uvm_component_utils(our_test)

// 	//constructor
// 	function new ( string name = "our_test", uvm_component parent = null);
// 		super.new(name, parent)
// 	endfunction

// 	//main logic

// 	//methods
// 	//properties

// endclass

/*
class my_test extends uvm_test;

my_dut_config dut_config_0;

function void build_phase(uvm_phase phase);
	dut_config_0 = new();
	
	if (!uvm_config_db #(virtual dut_if)::get (this,"", "dut_vi", dut_config_0.dut_vi) )
		`uvm_fatal("MY_TEST", "No DUT_IF");
	// other DUT configuration
	uvm_config_db# (my_dut_config)::set(this,"*", "dut_config", dut_config_0);

endfunction : build_phase

endclass: my_test
*/
