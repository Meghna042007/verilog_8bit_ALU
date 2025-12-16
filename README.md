# verilog_8bit_ALU
Parameterized 8-bit ALU in Verilog with testbench
ALU v1 – Parameterized Arithmetic Logic Unit (Verilog)
# Overview

This project implements a parameterized, combinational Arithmetic Logic Unit (ALU) in Verilog.
The design is based on a textbook ALU truth table and supports both arithmetic and logic operations controlled via select lines and a carry-in (Cin).
The ALU is designed at RTL level, synthesizable, and verified using a self-checking testbench and waveform simulation in Xilinx Vivado (XSIM).

# Features

1.Parameterized data width (default: 8-bit)
2.Arithmetic and logic operations
3.Increment and decrement support
4.Clean separation of arithmetic and logic units
5.Zero flag generation
6.Fully verified with simulation and waveforms

# Interface
Inputs:-

A [WIDTH-1:0] : Operand A
B [WIDTH-1:0] : Operand B
opcode[2:0] : Operation select (S2 S1 S0)
c_in : Carry-in (used only for arithmetic operations)

Outputs
result [WIDTH-1:0] : ALU result
zero : Zero flag (1 if result == 0)

Operation Truth Table
Arithmetic Operations (S2 = 0)
S2	S1	S0	Cin	Operation	Description
0	  0	  0	  0	  F = A	Transfer A
0	  0	  0	  1   F = A + 1	Increment A
0	  0	  1	  0	  F = A + B	Addition
0	  0	  1	  1	  F = A + B + 1	Add with carry
0	  1	  0	  0	  F = A + ~B	Subtract with borrow
0	  1	  0	  1	  F = A − B	Subtraction
0	  1	  1	  0   F = A − 1	Decrement A
0	  1	  1	  1	  F = A	Transfer A
Logic Operations (S2 = 1, Cin = don’t care)
S2	S1	S0	Operation
1	  0	  0	  A AND B
1	  0	  1	  A OR B
1	  1	  0	  A XOR B
1	  1	  1	  NOT A
Zero Flag
The zero flag is asserted when the ALU output is all zeros:
zero = (result == {WIDTH{1'b0}});


This works consistently across all arithmetic and logic operations.

# Design Notes

The ALU uses one shared arithmetic datapath, with operations controlled via select lines and Cin.
No carry/borrow flags are generated intentionally to avoid ambiguous flag semantics.
Arithmetic operations use proper width handling to prevent truncation errors.
Logic operations are completely independent of Cin.

# Verification

Verified using a dedicated testbench in Vivado
Console ($display) output confirms correct operation
Waveforms confirm:
correct opcode decoding
correct result transitions
correct zero flag behavior
no X/Z propagation

Simulation completed successfully with all test cases passing.

# Tools Used

Language: Verilog HDL
Simulator: Xilinx Vivado XSIM
Design Type: Combinational RTL

# Future Improvements (v2 Ideas)

Carry and overflow flags
Signed arithmetic support
Shift and compare operations
Pipelined or sequential version

# Author

Designed and verified as part of RTL/Verilog learning and ALU architecture exploration.
