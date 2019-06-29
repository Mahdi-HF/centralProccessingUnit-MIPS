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
    input [31:0] Address, writeData, input clk, writeEnable,
    output reg [31:0]MemData );

    reg [31:0] data [1023:0];

	// reg [10:0] i;
	 
    always @(posedge clk)
    begin
        if(writeEnable==1'b1)
        begin
            data[Address] <= writeData;
        end
    end
	
    always @*
    begin
		//#1;
		$display("Address is :");
		$display(Address);
        MemData = data[Address];
    end
    
    initial
    begin
		  //for (i = 0; i < 32; i = i + 1)
            //data[i] = 32'dz;
				
        data[1] <= 32'd1; 
        data[2] <= 32'd2;
        data[3] <= 32'd3;
        data[4] <= 32'd4;
        data[5] <= 32'd5;
        data[6] <= 32'd6;
        data[7] <= 32'd7;
        data[8] <= 32'd8;
        data[9] <= 32'd9;
        data[10] <= 32'd10;

        data[128] <= 32'b00000000001000100001100000100000; //add 3 1 2
		data[129] <= 32'b00000000001000100001100000100000; //add 3 1 2
		data[130] <= 32'b00000000001000100001100000100000; //add 3 1 2
        data[131] <= 32'b00000000001000100001100000100000; //add 3 1 2

        data[132] <= 32'b00000000001000100010000000100010; //sub 3 1 2
        // data[136] <= 32'b001100 00000000000000000000000100 ; //Itype 1 : jump abs
        // data[140] <= 32'b001100 00011 00100 ; //Itype 1

        data[136] <= 32'h8c010002;
        data[140] <= 32'h8c010002;
        data[144] <= 32'h10600004;
        data[148] <= 32'h00852020;
        data[152] <= 32'h00852822;
        data[156] <= 32'h00611820;
        data[160] <= 32'h1000fffb;
        data[164] <= 32'hac040006;
    end 
endmodule