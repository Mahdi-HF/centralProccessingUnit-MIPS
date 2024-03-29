`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    04:41:52 06/27/2019 
// Design Name: 
// Module Name:    ShiftRegister 
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
module ShiftRegister(
    input [31:0] dataIn, input clk,
    output reg [31:0] dataOut );

    always @(posedge clk) 
    begin
        dataOut = dataIn;
    end

endmodule
