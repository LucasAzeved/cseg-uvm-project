`timescale 1ns / 1ps

module Processortb();
  reg clk;
  reg [15:0] out;
  
  // Instantiate the processor
  Processor dut(clk, out);
  
  // Clock generation
  initial begin 
    clk = 0;
    forever #10 clk = ~clk;  
  end
  
  // Monitor outputs
  initial begin
    $display("Time\tPC\tInstruction\tOut");
    $monitor("%0t\t%d\t%h\t%h", $time, dut.PC, dut.instruction, out);
  end
  
  // Test sequence
  initial begin
    // Reset sequence - wait for a few clock cycles to initialize
    repeat(5) @(posedge clk);
    
    // Test R-type instructions (ADD, SUB, AND, OR, XOR, BIC, RSB)
    // Each instruction executes and we observe changes in registers
    repeat(10) @(posedge clk);
    
    // Test I-type instructions (ADDI, LW, SW, BEQ)
    repeat(10) @(posedge clk);
    
    // Test J-type instruction (J)
    repeat(5) @(posedge clk);
    
    // Test branch instructions specifically
    // Force equality signal to test branch paths
    @(posedge clk) dut.equality = 1'b1;
    @(posedge clk) dut.equality = 1'b0;
    
    // Test jump functionality
    @(posedge clk) dut.jump = 1'b1;
    @(posedge clk) dut.jump = 1'b0;
    
    // Test memory operations
    repeat(8) @(posedge clk);
    
    // Test ALU operations with different control signals
    // Test all ALU operations by forcing ALU control values
    @(posedge clk);
    force dut.AluControl = 3'b000; // ADD
    @(posedge clk);
    release dut.AluControl;
    
    @(posedge clk);
    force dut.AluControl = 3'b001; // SUB
    @(posedge clk);
    release dut.AluControl;
    
    @(posedge clk);
    force dut.AluControl = 3'b010; // AND
    @(posedge clk);
    release dut.AluControl;
    
    @(posedge clk);
    force dut.AluControl = 3'b011; // OR
    @(posedge clk);
    release dut.AluControl;
    
    @(posedge clk);
    force dut.AluControl = 3'b100; // EOR/XOR
    @(posedge clk);
    release dut.AluControl;
    
    @(posedge clk);
    force dut.AluControl = 3'b101; // BIC
    @(posedge clk);
    release dut.AluControl;
    
    @(posedge clk);
    force dut.AluControl = 3'b110; // RSB
    @(posedge clk);
    release dut.AluControl;
    
    @(posedge clk);
    force dut.AluControl = 3'b111; // BEQ
    @(posedge clk);
    release dut.AluControl;
    
    // Test control unit with different opcodes
    @(posedge clk);
    force dut.instruction[15:12] = 4'b0000; // R-type
    force dut.instruction[2:0] = 3'b000;    // ADD
    @(posedge clk);
    release dut.instruction;
    
    @(posedge clk);
    force dut.instruction[15:12] = 4'b0100; // ADDI
    @(posedge clk);
    release dut.instruction;
    
    @(posedge clk);
    force dut.instruction[15:12] = 4'b1011; // LW
    @(posedge clk);
    release dut.instruction;
    
    @(posedge clk);
    force dut.instruction[15:12] = 4'b1111; // SW
    @(posedge clk);
    release dut.instruction;
    
    @(posedge clk);
    force dut.instruction[15:12] = 4'b1000; // BEQ
    @(posedge clk);
    release dut.instruction;
    
    @(posedge clk);
    force dut.instruction[15:12] = 4'b0010; // J
    @(posedge clk);
    release dut.instruction;
    
    // Test all R-type function codes
    @(posedge clk);
    force dut.instruction[15:12] = 4'b0000; // R-type
    force dut.instruction[2:0] = 3'b010;    // SUB
    @(posedge clk);
    release dut.instruction;
    
    @(posedge clk);
    force dut.instruction[15:12] = 4'b0000; // R-type
    force dut.instruction[2:0] = 3'b100;    // AND
    @(posedge clk);
    release dut.instruction;
    
    @(posedge clk);
    force dut.instruction[15:12] = 4'b0000; // R-type
    force dut.instruction[2:0] = 3'b101;    // OR
    @(posedge clk);
    release dut.instruction;
    
    @(posedge clk);
    force dut.instruction[15:12] = 4'b0000; // R-type
    force dut.instruction[2:0] = 3'b001;    // XOR/EOR variant
    @(posedge clk);
    release dut.instruction;
    
    @(posedge clk);
    force dut.instruction[15:12] = 4'b0000; // R-type
    force dut.instruction[2:0] = 3'b011;    // BIC variant
    @(posedge clk);
    release dut.instruction;
    
    @(posedge clk);
    force dut.instruction[15:12] = 4'b0000; // R-type
    force dut.instruction[2:0] = 3'b111;    // RSB variant
    @(posedge clk);
    release dut.instruction;
    
    // Run for a while to let processor execute the program in IM
    repeat(30) @(posedge clk);
    
    // Test RegFile write operations
    @(posedge clk);
    force dut.RegWrite = 1'b1;
    @(posedge clk);
    release dut.RegWrite;
    
    // Test memory write operations
    @(posedge clk);
    force dut.MemWrite = 1'b1;
    @(posedge clk);
    release dut.MemWrite;
    
    // Test different mux selections
    @(posedge clk);
    force dut.AluSrc = 1'b1;
    @(posedge clk);
    release dut.AluSrc;
    
    @(posedge clk);
    force dut.MemtoReg = 1'b1;
    @(posedge clk);
    release dut.MemtoReg;
    
    @(posedge clk);
    force dut.r2Chooser = 1'b1;
    @(posedge clk);
    release dut.r2Chooser;
    
    // Wait a bit more to finish simulation
    repeat(10) @(posedge clk);
    
    $display("Simulation completed successfully");
    $finish;
  end

endmodule
