`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:40:52 06/27/2019
// Design Name:   Shifter2
// Module Name:   Z:/Memari_Project/MemariProject/shifter2Test.v
// Project Name:  MemariProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Shifter2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module shifter2Test;

	// Inputs
	reg [31:0] in;

	// Outputs
	wire [31:0] out;

	// Instantiate the Unit Under Test (UUT)
	Shifter2 uut (
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		// Add stimulus here
		
		#100; in = 32'h0002;
		#100; in = 32'h0010;
		#100; in = 32'hFFFF;
		#100; in = 32'h0000;
		#100; in = 32'hF0F0;
		#100; in = 32'h1234;
      #100; $stop;
		
		
	end
      
endmodule

