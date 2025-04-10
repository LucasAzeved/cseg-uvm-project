class our_packet extends uvm_sequence_item;
    `uvm_object_utils(our_packet)
    
    //request
    rand bit [7:0] input1;
    rand bit [7:0] input2;
    
    //response
    bit [15:0] output3;
    
    function new(string name = "our_packet");
        super.new(name);
    endfunction
endclass