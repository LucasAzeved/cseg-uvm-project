onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /Processortb/dut/out
add wave -noupdate /Processortb/dut/instruction
add wave -noupdate /Processortb/dut/RD1
add wave -noupdate /Processortb/dut/RD2
add wave -noupdate /Processortb/dut/extendOut
add wave -noupdate /Processortb/dut/aluMuxOut
add wave -noupdate /Processortb/dut/aluResult
add wave -noupdate /Processortb/dut/RegWrite
add wave -noupdate /Processortb/dut/AluSrc
add wave -noupdate /Processortb/dut/MemWrite
add wave -noupdate /Processortb/dut/MemtoReg
add wave -noupdate /Processortb/dut/jump
add wave -noupdate /Processortb/dut/r2Chooser
add wave -noupdate /Processortb/dut/equality
add wave -noupdate /Processortb/dut/PC
add wave -noupdate /Processortb/dut/AluControl
add wave -noupdate /Processortb/dut/dataMemOut
add wave -noupdate /Processortb/dut/finalMuxOut
add wave -noupdate /Processortb/dut/r2chooseout
add wave -noupdate /Processortb/dut/im/instruction_memory
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {645700 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {2433770 ps}
