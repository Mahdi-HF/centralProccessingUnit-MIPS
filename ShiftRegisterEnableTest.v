`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:16:42 06/27/2019
// Design Name:   ShiftRegisterEnable
// Module Name:   Z:/Memari_Project/MemariProject/ShiftRegisterEnableTest.v
// Project Name:  MemariProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: ShiftRegisterEnable
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module ShiftRegisterEnableTest;

	// Inputs
	reg [31:0] dataIn;
	reg [31:0] CLK;
	reg [31:0] control;

	// Outputs
	wire [31:0] dataOut;

	// Instantiate the Unit Under Test (UUT)
	ShiftRegisterEnable uut (
		.dataIn(dataIn), 
		.CLK(CLK), 
		.control(control), 
		.dataOut(dataOut)
	);

	initial begin
		// Initialize Inputs
		dataIn = 0;
		CLK = 0;
		control = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

