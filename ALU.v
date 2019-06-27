`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    01:51:57 06/27/2019 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
    input [4:0]a, [4:0]b, [1:0]control,
    output reg [9:0]result, zFlag);

    always @(a,b,control) 
    begin
        result = 10'b0;
        zFlag = 1'b0;
        case (control)
            2'b00 : result = a & b;
            2'b01 : result = a ^ b;
            2'b10 : result = a + b;
            2'b11 : result = a - b;
            default: result = 10'bz;
        endcase
    end

    always @(a,b,control)
    begin
        if (a==b) begin
            zFlag = 1'b1;
        end
    end

endmodule
