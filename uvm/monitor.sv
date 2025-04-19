import uvm_pkg::*;
`include "uvm_macros.svh"

`include "regfile_transaction.svh"

class monitor extends uvm_monitor;
    `uvm_component_utils(monitor)
    
    virtual regfile_if vif;
    uvm_analysis_port #(regfile_transaction) ap;
    
    function new(string name = "monitor", uvm_component parent = null);
        super.new(name, parent);
    endfunction
    
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual regfile_if)::get(this, "", "vif", vif)) begin
            `uvm_fatal(get_type_name(), "Failed to get virtual interface from config_db")
        end
        ap = new("ap", this);
    endfunction
    
    virtual task run_phase(uvm_phase phase);
        regfile_transaction reg_data;
        
        // Wait for reset to complete
        @(negedge vif.reset);
        repeat(2) @(posedge vif.clk); // Stabilization after reset
        
        forever begin
            // Create new transaction
            reg_data = regfile_transaction::type_id::create("reg_data");
            
            // Sample inputs at clock edge
            @(posedge vif.clk);
            reg_data.A1 = vif.monitor_ck.A1;
            reg_data.A2 = vif.monitor_ck.A2;
            reg_data.A3 = vif.monitor_ck.A3;
            reg_data.WD3 = vif.monitor_ck.WD3;
            reg_data.WE3 = vif.monitor_ck.WE3;
            
            // For RegFile, outputs appear on the SAME clock cycle as inputs
            // If your DUT needs additional delay cycles, add them here
            reg_data.RD1 = vif.monitor_ck.RD1;
            reg_data.RD2 = vif.monitor_ck.RD2;
            
            // Send transaction to scoreboard
            ap.write(reg_data);
        end
    endtask: run_phase
endclass