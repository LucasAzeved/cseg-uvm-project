`ifndef REGFILE_TRANSACTION_SVH
`define REGFILE_TRANSACTION_SVH

import uvm_pkg::*;
`include "uvm_macros.svh"

class regfile_transaction extends uvm_sequence_item;
    // Transaction fields
    rand logic [2:0] A1;
    rand logic [2:0] A2;
    rand logic [2:0] A3;
    rand logic [7:0] WD3;
    rand logic WE3;
    logic [7:0] RD1;
    logic [7:0] RD2;
    
    // UVM automation macros for fields
    `uvm_object_utils_begin(regfile_transaction)
        `uvm_field_int(A1, UVM_ALL_ON)
        `uvm_field_int(A2, UVM_ALL_ON)
        `uvm_field_int(A3, UVM_ALL_ON)
        `uvm_field_int(WD3, UVM_ALL_ON)
        `uvm_field_int(WE3, UVM_ALL_ON)
        `uvm_field_int(RD1, UVM_ALL_ON)
        `uvm_field_int(RD2, UVM_ALL_ON)
    `uvm_object_utils_end
    
    // Constructor
    function new(string name = "regfile_transaction");
        super.new(name);
    endfunction
    
endclass

`endif // REGFILE_TRANSACTION_SVH
