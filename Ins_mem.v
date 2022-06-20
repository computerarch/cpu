`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:14:02 06/20/2022 
// Design Name: 
// Module Name:    Ins_mem 
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
module Ins_mem(
     input clk,
	  input z,
	  input br,
	  output reg [19:0] ins,
	  input [19:0] extend
    );
	 assign pc_in = 0;
    reg [199:0] arr [19:0];
	 reg [19:0] pc_out;
	 reg br_tk;
    always @(posedge clk) 
    begin
	  assign br_tk = z && br;
     if(br_tk == 0)
      begin
	     assign pc_out = pc_in;
	     assign pc_out = pc_out+4;
	     assign ins = arr[pc_out];
      end
     else
      begin
	     assign pc_out=pc_in;
	     assign pc_out = pc_out + 4 + (extend * 4);
	     assign ins = arr[pc_out];
      end	 
	  end
endmodule
