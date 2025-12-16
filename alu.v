`timescale 1ns / 1ps
module alu #(parameter WIDTH=4)(
input [WIDTH-1:0]A,
input [WIDTH-1:0]B,
input c_in,
input [2:0]opcode,
output reg[WIDTH-1:0]result,
output reg zero);
always @(*)begin
result={WIDTH{1'b0}};zero=1'b0;
    case(opcode)
          3'b000:begin
                 if(c_in)
                  result=A+1'b1;//increament A
                 else
                  result=A;//transfer A
                 end
          3'b001:begin
                 if(c_in)
                  result=A+B+1'b1;//add with carry
                 else
                  result=A+B;//addition
                 end
          3'b010:begin
                 if(c_in)
                  result=A+(~B)+1'b1;//substraction
                 else
                  result=A+(~B);//subtract with borrow
                 end
          3'b011:begin
                 if(c_in)
                   result=A;//transfer A
                 else
                   result=A-1'b1;//decreament A
                 end
          3'b100:result=A&B;//AND
          3'b101:result=A|B;//OR
          3'b110:result=A^B;//XOR
          3'b111:result=~A;//NOT
     endcase
     zero=(result=={WIDTH{1'b0}});
end          
endmodule
