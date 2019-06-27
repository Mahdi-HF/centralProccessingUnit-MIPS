`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:11:14 06/27/2019 
// Design Name: 
// Module Name:    Mux4 
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
module Mux4(
    input [1:0] control, [31:0] A, B, C, D,
    output reg [31:0] out );

    always @ (control, A, B, C, D) 
    begin
       if(control == 2'b00)
            out = A;
       else if(control == 2'b01)
            out = B;
       else if(control == 2'b10)
            out = C;
       else
            out = D;
    end

endmodule
