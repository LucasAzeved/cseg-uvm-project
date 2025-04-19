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
  
  function void write(regfile_transaction tr);
    // Fix declarations - move ALL declarations to the top
    bit [7:0] expected_RD1;
    bit [7:0] expected_RD2;
    
    // Ignorar transações com endereços indefinidos
    if ($isunknown(tr.A1) || $isunknown(tr.A2) || $isunknown(tr.A3)) begin
      `uvm_info(get_type_name(), "Ignorando transação com endereços indefinidos", UVM_MEDIUM)
      return;
    end
    
    // Primeiro armazene os valores esperados baseados no estado atual
    expected_RD1 = reg_model[tr.A1];
    expected_RD2 = reg_model[tr.A2];
    
    // Depois atualize o modelo para a próxima transação
    if(tr.WE3) begin
      reg_model[tr.A3] = tr.WD3;
      `uvm_info(get_type_name(), $sformatf("Write to reg[%0d]: %0d", tr.A3, tr.WD3), UVM_MEDIUM)
    end
    
    // Compare com os valores esperados
    if(tr.RD1 !== expected_RD1)
      `uvm_error(get_type_name(), $sformatf("RD1 mismatch: Expected %0d, Got %0d for A1=%0d", 
                                          expected_RD1, tr.RD1, tr.A1))
    else
      `uvm_info(get_type_name(), $sformatf("RD1 match: %0d for A1=%0d", tr.RD1, tr.A1), UVM_HIGH)
      
    if(tr.RD2 !== expected_RD2)
      `uvm_error(get_type_name(), $sformatf("RD2 mismatch: Expected %0d, Got %0d for A2=%0d", 
                                          expected_RD2, tr.RD2, tr.A2))
    else
      `uvm_info(get_type_name(), $sformatf("RD2 match: %0d for A2=%0d", tr.RD2, tr.A2), UVM_HIGH)
  endfunction
endclass

