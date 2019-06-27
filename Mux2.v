`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:11:37 06/27/2019 
// Design Name: 
// Module Name:    Mux2 
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
module Mux2(
    input control, [31:0]A, [31:0]B,
    output reg [31:0] out );

    always @ (control, A, B) 
    begin
       if(control == 1'b0)
            out = A;
       else
            out = B;
    end
endmodule
