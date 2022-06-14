`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:47:50 06/14/2022 
// Design Name: 
// Module Name:    DataMemory 
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
module DataMemory(Memtoreg,Memwrite,Memread,Readdata,addr,Datawrite,Clk
    );
input Clk;
input [15:0] addr;
input Memtoreg;
input Memwrite;
input Memread;
input [15:0] Datawrite;
output reg[15:0] Readdata;
reg [7:0] mem [15:0];	 
always @*
	begin
		mem[0]=0000000000010100; //20
		mem[1]=0000000000000101; //5
		mem[2]=0000000000001111; //15
		mem[3]=0000000000000111; //7
		mem[4]=0000000000010010; //18
		mem[5]=0000000000000011; //3
		mem[6]=0000000000010011; //19
		mem[7]=0000000000001000; //8
	if(Memwrite==1) 
		mem[addr]=Datawrite;
	if(Memread==1)
		Readdata=mem[addr];
	if(Memtoreg==0)
		Readdata=addr;
	else
		Readdata=mem[addr];	
	end  
endmodule
