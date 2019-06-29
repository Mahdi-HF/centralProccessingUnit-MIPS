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
	reg clk;
	reg control;
	reg [31:0] dataIn;

	// Outputs
	wire [31:0] dataOut;

	// Instantiate the Unit Under Test (UUT)
	ShiftRegisterEnable uut (
		.dataIn(dataIn), 
		.clk(clk), 
		.control(control), 
		.dataOut(dataOut)
	);

	always #50 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 0;
		dataIn = 0;
		control = 0;

		// Add stimulus here
		#100 
		control = 1;
		dataIn = 32'h00000001;

		#100 
		control = 0;
		dataIn = 32'hFFFFFFFF;

		#100 
		control = 0;
		dataIn = 32'h00000000;

		#100 
		control = 0;
		dataIn = 32'hFF0000FF;

		#100; $stop;
	end
endmodule

