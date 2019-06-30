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
	reg clk;
	reg lorD;
	reg regDst;
	reg aluSrcA;
	reg pcWrite;
	reg IrWrite;
	reg pcSource;
	reg regWrite;
	reg isBranch;
	reg memWrite;
	reg memToReg;
	reg [1:0] aluSrcB;
	reg [1:0] aluOp;
	reg isInterrupted;
	reg [1:0] aluControl;

	// Outputs
	wire [5:0] op;
	wire [5:0] funct;

	// Instantiate the Unit Under Test (UUT)
	DataPath uut (
		.aluControl(aluControl),
		.aluSrcB(aluSrcB),
		.pcSource(pcSource), 
		.aluSrcA(aluSrcA),
		.regWrite(regWrite), 
		.regDst(regDst), 
		.isInterrupted(isInterrupted),
		.clk(clk),
		.isBranch(isBranch),
		.pcWrite(pcWrite),
		.lorD(lorD),
		.memWrite(memWrite), 
		.memToReg(memToReg), 
		.IrWrite(IrWrite), 
		.op(op),
		.funct(funct)
	);

	always #50 clk = ~clk;

	initial begin
	//	Initialize Inputs
		
		// preFetch
		aluOp <= 2'b00;
		aluSrcB <= 0;
		pcSource <= 0;
		aluSrcA <= 0;
		regWrite <= 0;
		regDst <= 0;
		isInterrupted <= 0;
		clk <= 0;
		isBranch <= 0;
		pcWrite <= 0;
		lorD <= 0;
		memWrite <= 0;
		memToReg <= 0;
		IrWrite <= 0;

		// fetch
		#50;
		aluOp <= 2'b00;
		aluSrcB <= 2'b01;
		pcSource <= 0;
		aluSrcA <= 0;
		regWrite <= 0;
		regDst <= 0;
		isInterrupted <= 0;
		isBranch <= 0;
		pcWrite <= 1;
		lorD <= 0;
		memWrite <= 0;
		memToReg <= 0;
		IrWrite <= 1;

		//decode
		#50;
		aluOp <= 2'b00;
		aluSrcB <= 2'b11;
		pcSource <= 0;
		aluSrcA <= 0;
		regWrite <= 0;
		regDst <= 0;
		isInterrupted <= 0;
		isBranch <= 0;
		pcWrite <= 0;
		lorD <= 0;
		memWrite <= 0;
		memToReg <= 0;
		IrWrite <= 0;
		
		// execute
		#50;
		aluOp <= 2'b10;
		aluSrcB <= 2'b00;
		pcSource <= 0;
		aluSrcA <= 1;
		regWrite <= 0;
		regDst <= 0;
		isInterrupted <= 0;
		isBranch <= 0;
		pcWrite <= 0;
		lorD <= 0;
		memWrite <= 0;
		memToReg <= 0;
		IrWrite <= 0;

		// alu writeback
		#50;
		aluOp <= 2'b10;
		aluSrcB <= 2'b00;
		pcSource <= 0;
		aluSrcA <= 1;
		regWrite <= 1;
		regDst <= 1;
		isInterrupted <= 0;
		isBranch <= 0;
		pcWrite <=0;
		lorD <= 0;
		memWrite <= 0;
		memToReg <= 0;
		IrWrite <= 0; // op = 00  funct = 100000

		#50;
		aluOp <= 0;
		aluSrcB <= 0;
		pcSource <= 0;
		aluSrcA <= 0;
		regWrite <= 0;
		regDst <= 0;
		isInterrupted <= 0;
		isBranch <= 0;
		pcWrite <= 0;
		lorD <= 0;
		memWrite <= 0;
		memToReg <= 0;
		IrWrite <= 0;

		#200; $stop;

		
	end
      
endmodule

