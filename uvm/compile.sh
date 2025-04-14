#!/bin/bash
# Clean previous compilation
rm -rf work

# Create work library
vlib work

# Compile all UVM files in correct order
vlog -sv +incdir+../uvm+../rtl+../include \
    ../uvm/regfile_transaction.svh \
    ../uvm/driver.sv \
    ../uvm/monitor.sv \
    ../uvm/agent.sv \
    ../uvm/regfile_scoreboard.sv \
    ../uvm/env.sv \
    ../uvm/our_sequence.sv \
    ../uvm/test.sv \
    ../uvm/tb_regfile.sv
