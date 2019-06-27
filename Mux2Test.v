`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:38:11 06/27/2019
// Design Name:   Mux2
// Module Name:   Z:/Memari_Project/MemariProject/Mux2Test.v
// Project Name:  MemariProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Mux2
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Mux2Test;
	reg control;
	reg [31:0] A;
	reg [31:0] B;
	reg clk;
	wire [31:0]ou;

	// Instantiate the Unit Under Test (UUT)
	Mux2 uut (control,A,B,ou);

	initial begin
		// Initialize Inputs
		control = 0;
		A = 4'h0001;
		B = 4'h0002;
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

