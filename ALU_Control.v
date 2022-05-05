`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:55:52 05/03/2022 
// Design Name: 
// Module Name:    ALU_Control 
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
module ALU_Control(func,aluOp,aluCtr
    );
	input [3:0]func;
	input [2:0]aluOp;
	wire [2:0]s_aluOp = aluOp;
	output reg [2:0] aluCtr;
	always @*
	begin	
	if(s_aluOp [0] == 1 && s_aluOp[1] != 1 )
		aluCtr = 5;
	else 
		aluCtr  = 4;
	if(s_aluOp[2] == 1) //R type
		aluCtr = func/2;
	if(aluOp == 0)
		aluCtr = 0;
	end

endmodule
