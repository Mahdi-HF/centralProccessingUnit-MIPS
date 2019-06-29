`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   03:39:15 06/29/2019
// Design Name:   Controller
// Module Name:   Z:/Memari_Project/MemariProject/ControllerTest.v
// Project Name:  MemariProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Controller
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ControllerTest;

	// Inputs
	reg [5:0] Op;
	reg [5:0] funct;
	reg Clk;
	reg INT;
	reg NMI;
	reg INTD;

	// Outputs
	wire isBranch;
	wire PCWrite;
	wire lorD;
	wire MemWrite;
	wire MemtoReg;
	wire IRWrite;
	wire INA;
	wire [1:0] aluControl;
	wire [1:0] ALUSrcB;
	wire PCSource;
	wire ALUSrcA;
	wire RegWrite;
	wire RegDst;
	wire isInterrupted;

	// Instantiate the Unit Under Test (UUT)
	Controller uut (
		.Op(Op), 
		.funct(funct), 
		.Clk(Clk), 
		.INT(INT), 
		.NMI(NMI), 
		.INTD(INTD), 
		.isBranch(isBranch), 
		.PCWrite(PCWrite), 
		.lorD(lorD), 
		.MemWrite(MemWrite), 
		.MemtoReg(MemtoReg), 
		.IRWrite(IRWrite), 
		.INA(INA), 
		.aluControl(aluControl), 
		.ALUSrcB(ALUSrcB), 
		.PCSource(PCSource), 
		.ALUSrcA(ALUSrcA), 
		.RegWrite(RegWrite), 
		.RegDst(RegDst), 
		.isInterrupted(isInterrupted)
	);

	always #50 CLK = ~CLK;

	initial begin
		// Initialize Inputs
		Op = 0;funct = 0;Clk = 0;INT = 0;NMI = 0;INTD = 0;

		#100; 
		Op = 6'b000000; funct = 0;Clk = 0;INT = 0;NMI = 0;INTD = 0;



	end
      
endmodule

