`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:42:59 06/27/2019
// Design Name:   SignExtend
// Module Name:   Z:/Memari_Project/MemariProject/SignExtendTest.v
// Project Name:  MemariProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: SignExtend
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module SignExtendTest;

	// Inputs
	reg [15:0] in;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	SignExtend uut (in, out);

	initial begin
		in = 16'h1111;
		// Initialize Inputs
		#100; in = 16'h0001;
		#100; in = 16'h0010;
	end
      
endmodule

