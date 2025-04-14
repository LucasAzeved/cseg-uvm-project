`ifndef REGFILE_IF_SVH
`define REGFILE_IF_SVH

`timescale 1ps/1ps

interface regfile_if(input bit clk);
    // Interface signals for RegFile
    logic [2:0] A1;
    logic [2:0] A2;
    logic [2:0] A3;
    logic [7:0] WD3;
    logic [7:0] RD1;
    logic [7:0] RD2;
    logic WE3;
    logic reset;

    // These are modport definitions for driver and monitor
    clocking driver_ck @(posedge clk);
        output A1, A2, A3, WD3, WE3, reset;
        input RD1, RD2;
    endclocking: driver_ck

    clocking monitor_ck @(posedge clk);
        input A1, A2, A3, WD3, RD1, RD2, WE3, reset;
    endclocking: monitor_ck

    // Modport for the DUT
    modport dut (
        input A1, A2, A3, WD3, WE3, clk, reset,
        output RD1, RD2
    );
    
endinterface //regfile_if

`endif //REGFILE_IF_SVH
