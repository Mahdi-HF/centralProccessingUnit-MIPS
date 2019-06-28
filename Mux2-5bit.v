`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:55:50 06/28/2019 
// Design Name: 
// Module Name:    Mux2-5bit 
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
module Mux2-5bit(
   input control, [5:0]A, [5:0]B,
    output reg [5:0] out );

    always @ (control, A, B) 
    begin
       if(control == 1'b0)
            out = A;
       else
            out = B;
    end


endmodule
