`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:09:35 06/27/2019
// Design Name:   ALU
// Module Name:   Z:/Memari_Project/MemariProject/ALUTest.v
// Project Name:  MemariProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ALU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ALUTest;

	// Inputs
	reg [31:0] a;
	reg [31:0] b;
	reg [1:0]control;

	wire [31:0] result;
	wire zFlag;

	// Instantiate the Unit Under Test (UUT)
	ALU uut (a,b,control,result,zFlag);

	initial begin
		a = 32'h00000001;b = 32'h00000001;control = 2'b00;
		#100;a = 32'h00000001;b = 32'h00000001;control = 2'b01;
		#100;a = 32'h00000001;b = 32'h00000003;control = 2'b10;
		#100;a = 32'h00000003;b = 32'h00000001;control = 2'b11;
		#100;a = 32'h00000001;b = 32'h00000001;control = 2'b11;
		#100;$stop;
	end
      
endmodule

