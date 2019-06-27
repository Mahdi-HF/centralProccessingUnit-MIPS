`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:43:02 06/27/2019 
// Design Name: 
// Module Name:    Shifter2 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module Shifter2(input [31:0]in,
    output reg [31:0]out);

    always @*
    begin
      out = in<<2;
    end

endmodule