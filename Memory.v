`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:06:14 06/27/2019 
// Design Name: 
// Module Name:    Memory 
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
module Memory(
    input [31:0] Address, writeData, input Clk, input writeEnable,
    output reg [31:0]MemData );

    reg [31:0] data [1023:0];

    always @(posedge Clk)
    begin
        if(writeEnable==1'b1)
        begin
            data[Address] <= writeData;
        end
    end
	
    always @* 
    begin
        MemData = data[Address];
    end
    
    initial
    begin //load in data and instructions of program data[0] <= 32'd8;
        data[1] <= 32'd1; 
        data[2] <= 32'd1;

        data[128] <= 32'h8c030000;
        data[132] <= 32'h8c040001;
        data[136] <= 32'h8c050002;
        data[140] <= 32'h8c010002;
        data[144] <= 32'h10600004;
        data[148] <= 32'h00852020;
        data[152] <= 32'h00852822;
        data[156] <= 32'h00611820;
        data[160] <= 32'h1000fffb;
        data[164] <= 32'hac040006;
    end 
endmodule