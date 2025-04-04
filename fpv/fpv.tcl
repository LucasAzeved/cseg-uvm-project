# fpv.tcl

clear -all

# analyze the design
# analyze -vhdl ../../../rtl/v4/t4.vhd ;
analyze -sv ../rtl/8_Bit_Processor/Sources/DataMemory.sv ;

# Analyze property files
analyze -sva bindings.sv fpv.sv ;

#set_evaluate_properties_on_formal_reset off

# elaborate the design, point to the design top level
elaborate -top {DataMemory}

# Set up Clocks and Resets
clock clk -factor 1 -phase 1
reset -expression {reset = '1'};

# get designs statistics
get_design_info
#Statistics [for instance "sanduiche"]
#---------------------------
# Flops:         2 (10) (0 property flop bits)
# Latches:       0 (0)
# Gates:         80 (501)
# Nets:          95
# Ports:         12
# RTL Lines:     113
# RTL Instances: 1
# Embedded Assumptions: 0
# Embedded Assertions:  0
# Embedded Covers:      0

# this command might be useful for more complex designs
#set_max_trace_length 150
prove -all

# Report proof results
report