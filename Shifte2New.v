`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    05:08:17 06/29/2019 
// Design Name: 
// Module Name:    Shifte2New 
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
module Shifte2New(input [25:0]in,
    output reg [27:0]out);

    always @*
    begin
      out = {in,2'b00};
    end

endmodule
