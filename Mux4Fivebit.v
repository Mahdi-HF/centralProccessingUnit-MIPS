`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:00:24 06/30/2019 
// Design Name: 
// Module Name:    Mux4Fivebit 
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
module Mux4Fivebit(
    input [1:0] control, [4:0]A, [4:0]B, [4:0]C, [4:0]D,
    output reg [4:0] out );

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
