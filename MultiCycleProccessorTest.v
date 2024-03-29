`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   03:49:14 06/29/2019
// Design Name:   MultiCycleProccessor
// Module Name:   Z:/Memari_Project/MemariProject/MultiCycleProccessorTest.v
// Project Name:  MemariProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MultiCycleProccessor
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MultiCycleProccessorTest;

	// Inputs
	reg clk;
	reg INT;
	reg NMI;
	reg INTD;

	// Outputs
	wire INA;

	// Instantiate the Unit Under Test (UUT)
	MultiCycleProccessor uut (
		.clk(clk), 
		.INT(INT), 
		.NMI(NMI), 
		.INTD(INTD), 
		.INA(INA)
	);

	always #50 clk = ~clk;

	initial begin
		// Initialize Inputs
		clk = 1;
		INT = 0;
		NMI = 0;
		INTD = 0;

		// Wait 100 ns for global reset to finish
		#200
		INT = 1;
		NMI = 0;
		INTD = 0;
		
		#10
		INT = 0;
		NMI = 0;
		INTD = 0;
		
		#2000
		INT = 0;
		NMI = 1;
		INTD = 0;
		
		#10
		INT = 0;
		NMI = 0;
		INTD = 0;
		
		#2000
		INT = 1;
		NMI = 0;
		INTD = 1;
		
		#10
		INT = 0;
		NMI = 0;
		INTD = 0;
		
		#10000; $stop;
        
		// Add stimulus here
		



	end
      
endmodule
