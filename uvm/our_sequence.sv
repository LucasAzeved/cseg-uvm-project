import uvm_pkg::*;
`include "uvm_macros.svh"

`include "regfile_transaction.svh"

class our_sequence extends uvm_sequence#(regfile_transaction);
    `uvm_object_utils(our_sequence)
    function new(string name = "our_sequence");
        super.new(name);
    endfunction

    virtual task body();
        regfile_transaction regfile_data;
        
        // First, do some writes to the register file
        repeat(4) begin
            regfile_data = regfile_transaction::type_id::create("regfile_data");
            start_item(regfile_data);
            if (!regfile_data.randomize() with {WE3 == 1;}) begin
                `uvm_fatal(get_type_name(), "failed to randomize register file data for write")
            end
            finish_item(regfile_data);
        end
        
        // Then, do some reads from the register file
        repeat(4) begin
            regfile_data = regfile_transaction::type_id::create("regfile_data");
            start_item(regfile_data);
            if (!regfile_data.randomize() with {WE3 == 0;}) begin
                `uvm_fatal(get_type_name(), "failed to randomize register file data for read")
            end
            finish_item(regfile_data);
        end
    endtask: body
endclass


// class our_sequence extends uvm_sequence;
//     `uvm_object_utils(our_sequence)
    
//     our_packet pkt;

//     function new(string name = "our_sequence");
//         super.new(name);
//     endfunction

//     task body();
//         pkt = our_packet::type_id::create("Our Packet");
        
//         repeat(10) begin
//             start_item(pkt);
//             pkt.randomize();
//             finish_item(pkt);
//         end
//     endtask
// endclass