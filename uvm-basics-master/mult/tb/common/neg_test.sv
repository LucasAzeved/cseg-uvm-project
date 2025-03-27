class neg_test extends uvm_test;
`uvm_component_utils(neg_test)

mult_env env_h;

function new (string name, uvm_component parent);
  super.new(name,parent);
endfunction : new

function void build_phase(uvm_phase phase);
  env_h = mult_env::type_id::create("env", this);
  `uvm_info("msg", "Building Environment DONE!", UVM_LOW)
endfunction: build_phase

task run_phase(uvm_phase phase);
  mult_neg_seq seq;
  seq = mult_neg_seq::type_id::create("seq");
  phase.raise_objection(this);
  seq.start(env_h.agent_h.sequencer_h);
  phase.drop_objection(this);
endtask

endclass: neg_test
