`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   03:06:54 06/28/2019
// Design Name:   Mux2FiveBit
// Module Name:   Z:/Memari_Project/MemariProject/Mux2FiveBitTest.v
// Project Name:  MemariProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Mux2FiveBit
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Mux2FiveBitTest;
reg control;
	reg [4:0] A;
	reg [4:0] B;
	reg clk;
	wire [4:0]ou;

	// Instantiate the Unit Under Test (UUT)
	Mux2FiveBit uut (control,A,B,ou);

	initial begin
		// Initialize Inputs
		control = 0;
		A = 4'h1;
		B = 4'h2;
		clk = 0;
	end
	
	always #100 clk= ~clk;
        
		// Add stimulus here
		always @(posedge clk)
		begin
		#100; control = 1'b0;
		#100; control = 1'b1;
		#100; $stop;
		end
      
      
endmodule

