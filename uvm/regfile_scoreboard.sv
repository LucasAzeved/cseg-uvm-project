import uvm_pkg::*;
`include "uvm_macros.svh"
`include "regfile_transaction.svh"

class regfile_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(regfile_scoreboard)
  
  uvm_analysis_imp#(regfile_transaction, regfile_scoreboard) analysis_export;
  bit [7:0] reg_model[8]; // Model of the registers
  
  function new(string name, uvm_component parent);
    super.new(name, parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    analysis_export = new("analysis_export", this);
    // Initialize register model with same values as RegFile
    reg_model[0] = 8'd5;
    reg_model[1] = 8'd12;
    reg_model[2] = 8'd27;
    reg_model[3] = 8'd30;
    reg_model[4] = 8'd43;
    reg_model[5] = 8'd57;
    reg_model[6] = 8'd69;
    reg_model[7] = 8'd102;
  endfunction
  
  function write(regfile_transaction tr);
    // Update our register model if write occurs
    if(tr.WE3) begin
      reg_model[tr.A3] = tr.WD3;
      `uvm_info(get_type_name(), $sformatf("Write to reg[%0d]: %0d", tr.A3, tr.WD3), UVM_MEDIUM)
    end
    
    // Check read values against our model
    if(tr.RD1 !== reg_model[tr.A1])
      `uvm_error(get_type_name(), $sformatf("RD1 mismatch: Expected %0d, Got %0d for A1=%0d", 
                                          reg_model[tr.A1], tr.RD1, tr.A1))
    else
      `uvm_info(get_type_name(), $sformatf("RD1 match: %0d for A1=%0d", tr.RD1, tr.A1), UVM_HIGH)
      
    if(tr.RD2 !== reg_model[tr.A2])
      `uvm_error(get_type_name(), $sformatf("RD2 mismatch: Expected %0d, Got %0d for A2=%0d", 
                                          reg_model[tr.A2], tr.RD2, tr.A2))
    else
      `uvm_info(get_type_name(), $sformatf("RD2 match: %0d for A2=%0d", tr.RD2, tr.A2), UVM_HIGH)
  endfunction
endclass
