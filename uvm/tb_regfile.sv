import uvm_pkg::*;
`include "uvm_macros.svh"

// Include the real RegFile design from its existing location
`include "../rtl/8_Bit_Processor/Sources/RegFile.sv" 
`include "../rtl/regfile_if.svh"
`include "test.sv"

`timescale 1ps/1ps
module tb_regfile;
    logic clk, reset;

    //clock generation
    initial begin
        clk <= 0;
        forever begin
            #5 clk <= !clk;
        end
    end

    //reset generation
    initial begin
        reset <= 1;
        repeat(10) @(posedge clk);
        reset <= 0;
    end

    // Instantiate the interface
    regfile_if regfile_if(.clk(clk));

    // Connect reset signal
    assign regfile_if.reset = reset;

    // Instantiate the DUT - use the existing RegFile from 8_Bit_Processor
    RegFile DUT(
        .clk(clk),
        .reset(reset),
        .A1(regfile_if.A1),
        .A2(regfile_if.A2),
        .A3(regfile_if.A3),
        .WD3(regfile_if.WD3),
        .WE3(regfile_if.WE3),
        .RD1(regfile_if.RD1),
        .RD2(regfile_if.RD2)
    );

    // Instantiate assertion module using the existing fpv module
    regFile_prop regFile_assertions(
        .A1(regfile_if.A1),
        .A2(regfile_if.A2),
        .A3(regfile_if.A3),
        .WD3(regfile_if.WD3),
        .RD1(regfile_if.RD1),
        .RD2(regfile_if.RD2),
        .WE3(regfile_if.WE3),
        .clk(clk),
        .reset(reset),
        .registers(DUT.registers)  // Connect to the internal registers
    );

    initial begin
        // Set interface in config_db to be used by testbench components
        uvm_config_db#(virtual regfile_if)::set(null, "*", "vif", regfile_if);
        
        // Run test
        run_test("basic_test");
    end
endmodule
