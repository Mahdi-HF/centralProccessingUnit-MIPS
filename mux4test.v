`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   09:10:59 06/27/2019
// Design Name:   Mux4
// Module Name:   Z:/Memari_Project/MemariProject/mux4test.v
// Project Name:  MemariProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Mux4
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module mux4test;
	// Inputs
	reg clk;
	reg [31:0] A;
	reg [31:0] B;
	reg [31:0] C;
	reg [31:0] D;
	reg [1:0] control;
	
	wire [31:0]ou;

	// Instantiate the Unit Under Test (UUT)
	Mux4 uut (control,A,B,C,D,ou);

	initial begin
		// Initialize Inputs
		clk = 0;
		control = 0;
		A = 32'h00000001;
		B = 32'h00000002;
		C = 32'h00000003;
		D = 32'h00000004;
	end
	
	always #100 clk = ~clk;
        
		// Add stimulus here
		always @(posedge clk)
		begin
		#100; control = 2'b00;
		#100; control = 2'b01;
		#100; control = 2'b10;
		#100; control = 2'b11;
		#100; $stop;
		end
endmodule 