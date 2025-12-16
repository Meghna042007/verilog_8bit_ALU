`timescale 1ns / 1ps

module tb_alu;
    localparam WIDTH = 8;
    reg  [WIDTH-1:0] A, B;
    reg  [2:0] opcode;
    reg c_in;
    wire [WIDTH-1:0] result;
    wire zero;
    alu #(.WIDTH(WIDTH)) dut (
        .A(A),
        .B(B),
        .opcode(opcode),
        .c_in(c_in),
        .result(result),
        .zero(zero)
    );
  initial begin
        A =8'b00000000; B =8'b00000000;opcode=8'b00000000;c_in =1'b0;
        #10;
        $display("ALU TEST START");

        // Arithmetic
        A=8'd10; B=8'd3;opcode=3'b000;c_in=1'b0; #10; // A
        $display("A=%d, A : result=%0d zero=%b",A,result,zero);

        A=8'd10; B=8'd3;opcode=3'b000;c_in=1'b1; #10; // A+1
        $display("A=%d, A+1 : result=%0d zero=%b",A,result,zero);

        A=8'd10; B=8'd3;opcode=3'b001;c_in=1'b0; #10; // A+B
        $display("A=%d,B=%d, A+B : result=%0d zero=%b",A,B,result,zero);

        A=8'd10; B=8'd3;opcode=3'b001;c_in=1; #10; // A+B+1
        $display("A=%d,B=%d, A+B+1 : result=%0d zero=%b",A,B,result, zero);

        A=8'd10; B=8'd3;opcode=3'b010;c_in=0; #10; // A+~B
        $display("A=%d,B=%d, A+~B : result=%0d zero=%b",A,B,result, zero);

        A=8'd10; B=8'd3;opcode=3'b010;c_in=1; #10; // A+~B+1 (A-B)
        $display("A=%d,B=%d, A-B : result=%0d zero=%b",A,B,result, zero);

        A=8'd10; B=8'd0;opcode=3'b011;c_in=0; #10; // A-1
        $display("A=%d, A-1 : result=%0d zero=%b",A, result, zero);

        A=8'd1;  B=8'd0;opcode=3'b011;c_in=1; #10; // zero check
        $display("A=%d, A-1=0 : result=%0d zero=%b",A,result, zero);

        // Logic
        A=8'hAA; B=8'h55;opcode=3'b100;c_in=0; #10; // AND
        $display("A=%b,B=%b, AND : result=%b zero=%b",A,B,result, zero);

        A=8'hAA; B=8'h55;opcode=3'b101;c_in=0; #10; // OR
        $display("A=%b,B=%b,OR : result=%b zero=%b",A,B,result, zero);

        A=8'hAA; B=8'hAA;opcode=3'b110;c_in=0; #10; // XOR
        $display("A=%b,B=%b,XOR : result=%b zero=%b",A,B,result, zero);

        A=8'hFF; B=8'h00;opcode=3'b111;c_in=0; #10; // NOT A
        $display("A=%b, NOT A : result=%b zero=%b",A,result, zero);

        $display("ALU TEST END");
        $finish;
    end

endmodule

