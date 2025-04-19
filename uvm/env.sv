`ifndef ENV_SV
`define ENV_SV

import uvm_pkg::*;
`include "uvm_macros.svh"
`include "regfile_scoreboard.sv"
`include "agent.sv"

class env extends uvm_env;
  `uvm_component_utils(env)
  
  agent agt;
  regfile_scoreboard scb;
  
  function new(string name = "env", uvm_component parent = null);
    super.new(name, parent);
  endfunction: new
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    agt = agent::type_id::create("agt", this);
    scb = regfile_scoreboard::type_id::create("scb", this);
  endfunction: build_phase
  
  virtual function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    agt.mon.ap.connect(scb.analysis_export);
  endfunction: connect_phase
  
endclass: env

`endif //ENV_SV