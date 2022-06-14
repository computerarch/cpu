`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:30:42 06/12/2022
// Design Name:   ControlUnit
// Module Name:   E:/University/4002/Memari -Z.Beiki/ControlUnit/ControlUnit_tst.v
// Project Name:  ControlUnit
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ControlUnit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ControlUnit_tst;

	// Inputs
	reg [3:0] Opcode;
	reg Clk;

	// Outputs
	wire [2:0] ALUop;
	wire Branch;
	wire Regdst;
	wire ALUsrc;
	wire Regwrite;
	wire Memread;
	wire Memtoreg;
	wire Memwrite;

	// Instantiate the Unit Under Test (UUT)
	ControlUnit uut (
		.Opcode(Opcode), 
		.Clk(Clk), 
		.ALUop(ALUop), 
		.Branch(Branch), 
		.Regdst(Regdst), 
		.ALUsrc(ALUsrc), 
		.Regwrite(Regwrite), 
		.Memread(Memread), 
		.Memtoreg(Memtoreg), 
		.Memwrite(Memwrite)
	);
	always #50 Clk=~Clk;
	initial begin
		// Initialize Inputs
		Opcode = 0;
		Clk = 0;
		#50;
		
		Opcode = 1;
		#50;
		
		Opcode = 0;
		#50;
		
		Opcode = 3;
		#50;
		
		Opcode = 0;
		#50;
		
		Opcode = 11;
		#50;
        
		// Add stimulus here
	end
      
endmodule

