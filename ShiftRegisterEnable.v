`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:41:37 06/27/2019 
// Design Name: 
// Module Name:    ShiftRegisterEnable 
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
module ShiftRegisterEnable(
    input [31:0] dataIn, CLK, control,
    output reg [31:0] dataOut );

    always @(posedge CLK) 
    begin
        if(control==1'b1)
            dataOut <= dataIn;
    end

endmodule
