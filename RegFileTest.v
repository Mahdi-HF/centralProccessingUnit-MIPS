`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:54:49 06/27/2019
// Design Name:   RegFile
// Module Name:   Z:/Memari_Project/MemariProject/RegFileTest.v
// Project Name:  MemariProject
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RegFile
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module RegFileTest;

	// Inputs
	reg [4:0] rA;
	reg [4:0] rB;
	reg [4:0] dR;
	reg [31:0] wData;
	reg clk = 0;
	reg wEnable;
	
	wire [31:0] aData;
	wire [31:0] bData;

	// Instantiate the Unit Under Test (UUT)
	RegFile uut (rA,rB,dR,wData,wEnable,clk,aData,bData);

	always #100 clk = ~clk;

	initial begin
		wData=0;dR=0;
		rA=4'b0001;rB=4'b0001;wEnable=0;
        #100;dR=4'b0100;wData=32'hFFFFFFFF;wEnable=1;
		#100;rA=4'b0100;rB=4'b0001;wEnable=0;
		#100;$stop;

	end
      
endmodule

