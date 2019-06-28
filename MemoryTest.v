`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:09:16 06/27/2019
// Design Name:   Memory
// Module Name:   Z:/Memari_Project/MemariProject/MemoryTest.v
// Project Name:  MemariProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Memory
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MemoryTest;

	// Inputs
	reg [31:0] Address;
	reg [31:0] writeData;
	reg Clk;
	reg writeEnable;

	// Outputs
	wire [31:0] MemData;

	// Instantiate the Unit Under Test (UUT)
	Memory uut (
		.Address(Address), 
		.writeData(writeData), 
		.Clk(Clk), 
		.writeEnable(writeEnable), 
		.MemData(MemData)
	);

	initial begin
		// Initialize Inputs
		Address = 0;
		writeData = 0;
		Clk = 0;
		writeEnable = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

