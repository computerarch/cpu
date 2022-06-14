`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:50:52 06/12/2022 
// Design Name: 
// Module Name:    ControlUnit 
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
module ControlUnit(Opcode,Clk,ALUop,Branch,Regdst,ALUsrc,Regwrite,Memread,Memtoreg,Memwrite
    );
input [3:0]Opcode;
input Clk;
output reg Branch;
output reg Regdst;
output reg ALUsrc;
output reg Regwrite;
output reg Memread;
output reg Memtoreg;
output reg Memwrite;
output reg [2:0] ALUop;
always @(Clk)
	begin
	if(Opcode==0)
	begin
		Branch=0;
		Regdst=1;
		ALUsrc=0;
		Regwrite=1;
		Memread=0;
		Memtoreg=0;
		Memwrite=0;
		ALUop=4;
	end
	if(Opcode==1)
	begin
		Branch=1;
		Regdst=0;
		ALUsrc=0;
		Regwrite=0;
		Memread=0;
		Memtoreg=0;
		Memwrite=0;
		ALUop=1;
	end
	if(Opcode==3)
	begin
		Branch=0;
		Regdst=0;
		ALUsrc=1;
		Regwrite=1;
		Memread=1;
		Memtoreg=1;
		Memwrite=0;
		ALUop=2;
	end
	if(Opcode==11)
	begin
		Branch=0;
		Regdst=0;
		ALUsrc=1;
		Regwrite=0;
		Memread=0;
		Memtoreg=0;
		Memwrite=1;
		ALUop=2;
	end
end
endmodule
