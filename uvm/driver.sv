import uvm_pkg::*;
`include "uvm_macros.svh"

`include "regfile_transaction.svh"

class driver extends uvm_driver #(regfile_transaction);
    `uvm_component_utils(driver)
    
    virtual regfile_if vif;
    
    function new(string name = "driver", uvm_component parent = null);
        super.new(name, parent);
    endfunction
    
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual regfile_if)::get(this, "", "vif", vif)) begin
            `uvm_fatal(get_type_name(), "Failed to get virtual interface from config_db")
        end
    endfunction
    
    virtual task run_phase(uvm_phase phase);
        regfile_transaction reg_data;
        
        // Initialize signals
        vif.driver_ck.A1 <= '0;
        vif.driver_ck.A2 <= '0;
        vif.driver_ck.A3 <= '0;
        vif.driver_ck.WD3 <= '0;
        vif.driver_ck.WE3 <= '0;
        
        forever begin
            seq_item_port.get_next_item(reg_data);
            
            // Drive signals to interface
            @(posedge vif.clk);
            vif.driver_ck.A1 <= reg_data.A1;
            vif.driver_ck.A2 <= reg_data.A2;
            vif.driver_ck.A3 <= reg_data.A3;
            vif.driver_ck.WD3 <= reg_data.WD3;
            vif.driver_ck.WE3 <= reg_data.WE3;
            
            seq_item_port.item_done();
        end
    endtask
endclass



// class our_driver extends uvm_driver #(our_packet);

//     `uvm_component_utils(our_driver)

//     our_interface intf;  // instantiated our interface
//     our_packet pkt;

//     function new(string name = "our_driver", uvm_component parent=null);
//         super.new(name, parent);
//     endfunction: new

//     // build phase
// 	function void build_phase(uvm_phase phase);
//         // build other components
//         pkt = our_packet::type_id::create("Our Packet");
//         // get method
//         uvm_config_db #(virtual our_interface)::get(null, "*", "intf", intf);
//     endfunction

//     // connect phase
// 	function void connect_phase(uvm_phase phase);
// 		// necessary connections
// 	endfunction

// 	// run phase
// 	task run_phase(uvm_phase phase);
// 		forever begin
// 			@(posedge intf.clk);
			
// 			seq_item_port.get_next_item(pkt);
			
// 			intf.input_1 <= pkt.input_1;
// 			intf.input_2 <= pkt.input_2;
			
// 			seq_item_port.item_done();
// 		end
// 	endtask
// 	// main logic

// endclass: our_driver

/*
class my_driver extends uvm_driver #(my_transaction);
`uvm_component_utils(my_driver);

virtual dut_if dut_vi;

function new(string name, uvm_component parent);
  super.new(name, parent);
endfunction : new

function void build_phase(uvm_phase phase);
	`uvm_info("msg", "Building DRIVER", UVM_NONE)
	
	if (!uvm_config_db #(virtual dut_if)::get (null,"*", "dut_vi", dut_vi) )
		`uvm_fatal("my_driver", "No DUT_IF");
	`uvm_info("msg", "DRIVER Done!!!", UVM_NONE)
endfunction : build_phase

task run_phase(uvm_phase phase);
	my_transaction tx;
	string data_str;
	dut_vi.reset_dut();
	forever
		begin
		seq_item_port.get_next_item(tx);
		dut_vi.do_dut(tx.cmd,tx.data,tx.dout);
		data_str = $psprintf("data = %0d, dout = %0d", tx.data, tx.dout);
		`uvm_info ("DRIVER", {"PASS: ", data_str}, UVM_HIGH)	
		seq_item_port.item_done();
	end
endtask: run_phase

endclass: my_driver
*/