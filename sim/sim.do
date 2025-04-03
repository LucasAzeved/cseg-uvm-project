if {[file isdirectory work]} { vdel -all -lib work }

vlib work 
vmap work work

vlog -cover sbcefx ../rtl/8_Bit_Processor/Sources/ALU.sv
vlog -cover sbcefx ../rtl/8_Bit_Processor/Sources/ControlUnit.sv
vlog -cover sbcefx ../rtl/8_Bit_Processor/Sources/DataMemory.sv
vlog -cover sbcefx ../rtl/8_Bit_Processor/Sources/Extend.sv
vlog -cover sbcefx ../rtl/8_Bit_Processor/Sources/Flop.sv
vlog -cover sbcefx ../rtl/8_Bit_Processor/Sources/FullAdder.sv
vlog -cover sbcefx ../rtl/8_Bit_Processor/Sources/InstructionMemory.sv
vlog -cover sbcefx ../rtl/8_Bit_Processor/Sources/MUX2.sv
vlog -cover sbcefx ../rtl/8_Bit_Processor/Sources/MUX4.sv
vlog -cover sbcefx ../rtl/8_Bit_Processor/Sources/NbitFullAdder.sv
vlog -cover sbcefx ../rtl/8_Bit_Processor/Sources/Processor.sv
vlog -cover sbcefx ../rtl/8_Bit_Processor/Sources/RegFile.sv
vlog -cover sbcefx ../rtl/8_Bit_Processor/Sources/XOR.sv
vlog -cover sbcefx ../rtl/8_Bit_Processor/TestBench/Processortb.sv

vsim -coverage -t 10ps work.Processortb

do wave.do

set StdArithNoWarnings 1

run 10 us

coverage report -file coverage_rep
coverage save coverag