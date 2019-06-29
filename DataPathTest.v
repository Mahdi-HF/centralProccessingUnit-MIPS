`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   03:48:30 06/29/2019
// Design Name:   DataPath
// Module Name:   Z:/Memari_Project/MemariProject/DataPathTest.v
// Project Name:  MemariProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: DataPath
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module DataPathTest;

	// Inputs
	reg [1:0] aluControl;
	reg [1:0] aluSrcB;
	reg PCSource;
	reg ALUSrcA;
	reg RegWrite;
	reg RegDst;
	reg isInterrupted;
	reg clk;
	reg isBranch;
	reg PCWrite;
	reg lorD;
	reg MemWrite;
	reg MemtoReg;
	reg IRWrite;

	// Outputs
	wire [5:0] op;
	wire [5:0] funct;

	// Instantiate the Unit Under Test (UUT)
	DataPath uut (
		.aluControl(aluControl), 
		.aluSrcB(aluSrcB), 
		.PCSource(PCSource), 
		.ALUSrcA(ALUSrcA), 
		.RegWrite(RegWrite), 
		.RegDst(RegDst), 
		.isInterrupted(isInterrupted), 
		.clk(clk), 
		.isBranch(isBranch), 
		.PCWrite(PCWrite), 
		.lorD(lorD), 
		.MemWrite(MemWrite), 
		.MemtoReg(MemtoReg), 
		.IRWrite(IRWrite), 
		.op(op), 
		.funct(funct)
	);

	always #50 clk = ~clk;

	initial begin
		// Initialize Inputs
		aluControl <= 0;
		aluSrcB <= 0;
		PCSource <= 0;
		ALUSrcA <= 0;
		RegWrite <= 0;
		RegDst <= 0;
		isInterrupted <= 0;
		clk <= 0;
		isBranch <= 0;
		PCWrite <= 0;
		lorD <= 0;
		MemWrite <= 0;
		MemtoReg <= 0;
		IRWrite <= 0;

		#50;
		aluControl <= 0;
		aluSrcB <= 2'b01;
		PCSource <= 0;
		ALUSrcA <= 0;
		RegWrite <= 0;
		RegDst <= 0;
		isInterrupted <= 0;
		isBranch <= 0;
		PCWrite <= 1;
		lorD <= 0;
		MemWrite <= 0;
		MemtoReg <= 0;
		IRWrite <= 1;

		#50;
		aluControl <= 0;
		aluSrcB <= 2'b11;
		PCSource <= 0;
		ALUSrcA <= 0;
		RegWrite <= 0;
		RegDst <= 0;
		isInterrupted <= 0;
		isBranch <= 0;
		PCWrite <= 1;
		lorD <= 0;
		MemWrite <= 0;
		MemtoReg <= 0;
		IRWrite <= 1;
		
		#50;
		aluControl <= 2'b10;
		aluSrcB <= 2'b00;
		PCSource <= 0;
		ALUSrcA <= 1;
		RegWrite <= 0;
		RegDst <= 0;
		isInterrupted <= 0;
		isBranch <= 0;
		PCWrite <= 1;
		lorD <= 0;
		MemWrite <= 0;
		MemtoReg <= 0;
		IRWrite <= 1;

		#50;
		aluControl <= 2'b10;
		aluSrcB <= 2'b00;
		PCSource <= 0;
		ALUSrcA <= 1;
		RegWrite <= 1;
		RegDst <= 1;
		isInterrupted <= 0;
		isBranch <= 0;
		PCWrite <= 1;
		lorD <= 0;
		MemWrite <= 0;
		MemtoReg <= 0;
		IRWrite <= 1; // op = 00  funct = 100000

		#50;
		aluControl <= 0;
		aluSrcB <= 0;
		PCSource <= 0;
		ALUSrcA <= 0;
		RegWrite <= 0;
		RegDst <= 0;
		isInterrupted <= 0;
		isBranch <= 0;
		PCWrite <= 0;
		lorD <= 0;
		MemWrite <= 0;
		MemtoReg <= 0;
		IRWrite <= 0;

		#200; $stop;

		
	end
      
endmodule

