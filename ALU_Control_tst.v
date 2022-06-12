`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:48:00 05/04/2022
// Design Name:   ALU_Control
// Module Name:   E:/University/4002/Memari -Z.Beiki/Alu_Control/ALU_Control_tst.v
// Project Name:  Alu_Control
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU_Control
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALU_Control_tst;

	// Inputs
	reg [3:0] func;
	reg [2:0] aluOp;

	// Outputs
	wire [2:0] aluCtr;

	// Instantiate the Unit Under Test (UUT)
	ALU_Control uut (
		.func(func), 
		.aluOp(aluOp), 
		.aluCtr(aluCtr)
	);

	initial begin
		// Initialize Inputs
		func = 4'b0110;
		aluOp = 100;
		#100;
		
      func = 4'b0110;
		aluOp = 110;
		#100;

		func = 4'b0110;
		aluOp = 111;
		#100;

		func = 4'b0110;
		aluOp = 101;
		#100;
	
		func = 4'b0110;
		aluOp = 000;
		#100;
	
		func = 4'b0110;
		aluOp = 001;
		#100;

		func = 4'b0110;
		aluOp = 011;
		#100;
		
		func = 4'b0110;
		aluOp = 010;
		#100;
		
		// Add stimulus here

	end
      
endmodule

