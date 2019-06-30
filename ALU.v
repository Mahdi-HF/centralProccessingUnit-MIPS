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
    input [31:0]a, [31:0]b, [1:0]control,
    output reg [31:0]result, output reg zFlag);
	
	initial
	begin
		result = 32'b0;
	end

    always @(a,b,control) 
    begin
        result = 32'b0;
        case (control)
            2'b00 : result = a & b; //AND
            2'b01 : result = a ^ b; //XOR
            2'b10 : result = a + b; //ADD
            2'b11 : result = a - b; //SUB
            default: result = 32'bz;
        endcase
    end

    always @(a,b,control)
    begin
        if (a==b)
        begin
            zFlag = 1'b1;
        end
        
		else
        begin
			zFlag = 1'b0;
		end
    end

endmodule
