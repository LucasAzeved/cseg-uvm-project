class our_sequencer extends uvm_sequencer;

  `uvm_component_utils(our_sequencer)

  function new (string name = "our_sequencer", uvm_component parent = null);
    super.new(name, parent);
  
  endfunction: new

endclass: our_sequencer