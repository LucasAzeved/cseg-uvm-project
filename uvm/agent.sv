class our_agent extends uvm_agent;

    `uvm_component_utils(our_agent)

    our_sequencer seqr;
    our_driver    drv;
    our_monitor   mon;

    function new(string name = "our_agent", uvm_component parent = null);
        super.new(name, parent);
    endfunction

    // build phase
    function void build_phase(uvm_phase phase);
        seqr = our_sequencer::type_id::create("seqr", this);
        drv = our_driver::type_id::create("drv", this);
        mon = our_monitor::type_id::create("mon", this);
    endfunction

    // connect phase
    function void connect_phase(uvm_phase phase);
        // necessary connections
        drv.seq_item_port.connect(seqr.seq_item_export);
    endfunction
endclass

/*
class my_agent extends uvm_agent;
`uvm_component_utils(my_agent);

 uvm_analysis_port #(my_transaction) aport;

 my_sequencer my_sequencer_h;
 my_driver    my_driver_h;
 my_monitor   my_monitor_h;
 
function new(string name, uvm_component parent);
  super.new(name,parent);
endfunction: new

function void build_phase(uvm_phase phase);
  aport = new("aport", this); 
  `uvm_info("msg", "Building Agent", UVM_NONE)
  my_sequencer_h = my_sequencer::type_id::create("my_sequencer", this);
  my_driver_h = my_driver::type_id::create("my_driver", this);
  my_monitor_h = my_monitor::type_id::create("my_monitor", this);
  `uvm_info("msg", "Building Agent DONE!", UVM_NONE)
endfunction: build_phase

function void connect_phase(uvm_phase phase);
  `uvm_info("msg", "Connecting Agent", UVM_NONE)
  my_driver_h.seq_item_port.connect(my_sequencer_h.seq_item_export);
  my_monitor_h.aport.connect(aport);
  `uvm_info("msg", "Connecting Agent DONE!", UVM_NONE)
endfunction: connect_phase

endclass: my_agent
*/