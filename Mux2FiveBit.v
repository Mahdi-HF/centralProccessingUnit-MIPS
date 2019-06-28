`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:57:52 06/28/2019 
// Design Name: 
// Module Name:    Mux2FiveBit 
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
module Mux2FiveBit(
    input control, [4:0]A, [4:0]B,
    output reg [4:0] out );

    always @ (control, A, B) 
    begin
       if(control == 1'b0)
            out = A;
       else
            out = B;
    end

endmodule
