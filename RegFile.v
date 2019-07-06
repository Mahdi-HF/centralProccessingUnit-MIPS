`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:07:53 06/27/2019 
// Design Name: 
// Module Name:    RegFile 
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
module RegFile(
    input [4:0] rA, rB, dR, [31:0] wData, input wEnable, input clk,
    output [31:0] aData, bData);

    reg [31:0] regData [31:0];
    reg [5:0] i;

    always @(posedge clk)
        if(wEnable) regData[dR] <= wData;
        
    assign aData = regData[rA];
    assign bData = regData[rB];

    // set initial values
    initial 
    begin
        for (i = 0; i < 32; i = i + 1)
            //regData[i] = i;
			regData[i] = 0;
    end
endmodule
