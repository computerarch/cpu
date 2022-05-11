`timescale 1ns / 1ps
module alu_mod(a,b,alu_select,alu_out,carry);
    input [15:0] a,b;                 
    input [2:0] alu_select;
    output [15:0] alu_out;
    output carry;
	 reg [15:0] res;
	 wire [16:0] tmp_carry;
	 assign alu_out = res;
	 assign tmp_carry = {1'b0,a} + {1'b0,b};//calculate carry
	 assign carry = tmp_carry[16];
	 always @(*)
    begin
        case(alu_select)
        3'b000: // and
           res = a & b ; 
        3'b001: // or
           res = a | b ;
        3'b010: // xor
           res = (a & (~b)) | ((~a) & b);
        3'b011: // nor
           res = ~(a | b);
        3'b100: // add
           res = a + b;
        3'b101: // sub
	   res = a - b;
        3'b110: // mult
           res = a * b;
        3'b111: // divide
	   res = a / b;
        default: 
           res = a + b; 
        endcase
    end 
endmodule
