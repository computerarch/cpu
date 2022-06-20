`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:09:56 06/14/2022 
// Design Name: 
// Module Name:    R_file_mod 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Register_file(
   input clk,
   input write,
   input [2:0] wr_Addr,
   input [15:0] wr_Data,
   input [2:0] rd_AddrA,
   output reg [15:0] rd_DataA,
   input [2:0] rd_AddrB,
   output reg [15:0] rd_DataB,
	input register_dis
	);
	reg [15:0] r0;
	reg [15:0] r1;
	reg [15:0] r2;
	reg [15:0] r3;
	wire tmp;
   always @(*) begin
	   case (rd_AddrA)
	0:begin 
	rd_DataA = r0;
	end
	1:begin
	rd_DataA = r1;
	end
	2:begin
	rd_DataA = r2;
	end
	3:begin
	rd_DataA = r3;
	end
	default: begin
	rd_DataA = 0;
	end
      endcase
	   case (rd_AddrB)
	0:begin
	rd_DataB = r0;
	end
	1:begin
	rd_DataB = r1;
	end
	2:begin 
	rd_DataB = r2;
	end
	3:begin
	rd_DataB = r3;
	end
	default:begin
	rd_DataB = 0;
	end
      endcase
   end
   always @(posedge clk) begin
      if (write) 
	case (wr_Addr) 
	  0: r0 <= wr_Data;
	  1: r1 <= wr_Data;
	  2: r2 <= wr_Data;
	  3: r3 <= wr_Data;
	endcase
   end 
endmodule
