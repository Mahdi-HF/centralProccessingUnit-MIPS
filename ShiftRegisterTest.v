`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:52:34 06/27/2019
// Design Name:   ShiftRegister
// Module Name:   Z:/Memari_Project/MemariProject/ShiftRegisterTest.v
// Project Name:  MemariProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ShiftRegister
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ShiftRegisterTest;
	// Inputs
	reg [31:0] dataIn;
	reg CLK;

	// Outputs
	wire [31:0] dataOut;

	// Instantiate the Unit Under Test (UUT)
	ShiftRegister uut (dataIn,CLK,dataOut);

	always #50 CLK = ~CLK;
	
	initial begin
		// Initialize Inputs
		dataIn = 32'h0;
		CLK = 0;
		
		// Wait 100 ns for global reset to finish
		dataIn = 32'h00000001;
		#100; dataIn = 32'hFFFFFFFF;
		#100; dataIn = 32'h0000FFFF;
		#100; $stop;
	end
      
endmodule

