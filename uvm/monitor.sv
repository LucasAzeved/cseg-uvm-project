class our_monitor extends uvm_monitor;

    `uvm_component_utils(our_monitor)

    our_interface intf;
    our_packet pkt;

    uvm_analysis_port #(our_sequence_item) mon_port;

    function new(string name = "our_monitor", uvm_component parent=null);
        super.new(name, parent);
    endfunction: new

    // build phase
    function void build_phase(uvm_phase phase);
        // build other components
        pkt = our_packet::type_id::create("Our Packet");
        // get method
        uvm_config_db #(virtual our_interface)::get(null, "*", "intf", intf);

        mon_port = new("Monitor Port", this);
    endfunction

    // connect phase
    function void connect_phase(uvm_phase phase);
        // necessary connections
    endfunction

    // run phase
    task run_phase(uvm_phase phase);
        forever begin
            @(posedge intf.clk);
            
            pkt.input_1 <= intf.input_1;
            pkt.input_2 <= intf.input_2;
        end
    endtask

endclass : our_monitor

/*
class my_monitor extends uvm_monitor;
`uvm_component_utils(my_monitor);

uvm_analysis_port #(my_transaction) aport;
virtual dut_if dut_vi;

function new(string name, uvm_component parent);
  super.new(name,parent);
endfunction: new

function void build_phase(uvm_phase phase);
  `uvm_info("msg", "Building MONITOR", UVM_NONE)
  aport = new("aport", this); 
  if (!uvm_config_db #(virtual dut_if)::get (null,"*", "dut_vi", dut_vi) )
    `uvm_fatal("my_monitor", "No DUT_IF");  
  `uvm_info("msg", "MONITOR Done !!!", UVM_NONE)
endfunction: build_phase

task run_phase(uvm_phase phase);
  my_transaction tx;
  forever
  begin
    @(posedge dut_vi.clk);
    tx = my_transaction::type_id::create("tx");
    $cast(tx.cmd, dut_vi.cmd);
    tx.data = dut_vi.data;
    aport.write(tx);
    //`uvm_info("msg", "New transaction", UVM_HIGH)
  end
endtask: run_phase

endclass : my_monitor
*/
