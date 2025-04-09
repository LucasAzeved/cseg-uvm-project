# fpv.tcl

clear -all

analyze -sv ../rtl/8_Bit_Processor/Sources/DataMemory.sv ;

# Analyze property files
analyze -sva bindings.sv fpv.sv ;

#set_evaluate_properties_on_formal_reset off

# elaborate the design, point to the design top level
elaborate -top {DataMemory}

# Set up Clocks and Resets
clock clk -factor 1 -phase 1
reset -expression {reset == 1'b1};

# get designs statistics
set_max_trace_length 150
get_design_info -list multiple_driven

prove -all

# Report proof results
report

# check_loop -viewer