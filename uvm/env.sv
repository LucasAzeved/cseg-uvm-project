import uvm_pkg::*;
`include "uvm_macros.svh"
`include "agent.sv"
`include "regfile_transaction.svh"
`include "regfile_scoreboard.sv"

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
    
    // This function is called after the build phase of all components
      // Possibly remove this function since "connect_phase" function no longer connects the monitor to any analysis components
    virtual function void connect_phase(uvm_phase phase);
        super.connect_phase(phase);
        agt.mon.ap.connect(scb.analysis_export);
    endfunction: connect_phase

endclass: env




// class our_env extends uvm_env;

//     `uvm_component_utils(our_env)

//     // instantiate classes
//     our_agent agnt;

//     function new(string name = "our_env", uvm_component parent = null);
//         super.new(name, parent);
//     endfunction

//     // build phase
//     function void build_phase(uvm_phase phase);
//         `uvm_info(get_type_name(), "In the build phase", UVM_MEDIUM);
        
//         agnt = our_agent::type_id::create("agnt", this); // create agent
//     endfunction

// endclass

/*
class my_env extends uvm_env;
`uvm_component_utils(my_env);

 my_agent           my_agent_h;
 my_subscriber      my_subscriber_h;
 my_param_container my_param_h;
 
function new(string name, uvm_component parent);
  super.new(name,parent);
endfunction: new


function void build_phase(uvm_phase phase);
  `uvm_info("msg", "Building ENV", UVM_NONE)

  my_param_h = my_param_container::type_id::create("my_param");
  uvm_config_db#(my_param_container)::set(null, "*", "my_param", my_param_h);

  my_agent_h = my_agent::type_id::create("my_agent", this);
  my_subscriber_h = my_subscriber::type_id::create("my_subscriber", this);
  `uvm_info("msg", "ENV Done !", UVM_NONE)
endfunction: build_phase

function void connect_phase(uvm_phase phase);
  `uvm_info("msg", "Connecting ENV", UVM_NONE)
  my_agent_h.aport.connect(my_subscriber_h.analysis_export);
  `uvm_info("msg", "Connecting ENV Done !", UVM_NONE)
endfunction: connect_phase

endclass: my_env
*/