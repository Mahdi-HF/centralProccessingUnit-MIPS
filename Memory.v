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

    reg [31:0] data [4095:0];

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
        data[2] <= 32'd20;
        data[3] <= 32'd3;
        data[4] <= 32'd4;
        data[5] <= 32'd5;
        data[6] <= 32'd6;
        data[7] <= 32'd7;
        data[8] <= 32'd8;
        data[9] <= 32'd9;

        data[128] <= 32'b00000000001000100001100000100000; //add r3 r1 r2

        data[132] <= 32'b00000000001000100010000000100010; //sub r4 r1 r2

        data[136] <= 32'b10001100000000010000000000000010; //LW : addr2 -> r2

        //data[140] <= 32'b00010000011000000000000000000100; //beq r3==r0 ? addr : nop
		data[140] <= 32'b00110000000000000000000000000100; //Itype 1 : addI



        data[144] <= 32'b00000000100001010010000000100000; //rtype : add r4 r4 r5

        data[148] <= 32'b10101100000001000000000000000110; //sw r4 6(r0)

        data[152] <= 32'b00000000011000010001100000100000; //rtype : add r3 r3 r1

        data[160] <= 32'b00001100000000000000000010000000; //jal : 128

        data[164] <= 32'b00000000100000001111100000001001; //jalr : r4 31

        data[168] <= 32'b10101100000001000000000000001110; //sw r4 14(r0)

        data[4088] <= 32'b00000000001000100001100000100110; //XOR r3 r1 r2

        data[4092] <= 32'b00000011111000000000000000001000; //jr : 31
        
    end 
endmodule