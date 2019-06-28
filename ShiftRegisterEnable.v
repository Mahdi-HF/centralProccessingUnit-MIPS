`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:14:56 06/27/2019 
// Design Name: 
// Module Name:    ShiftRegisterEnable 
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
module ShiftRegisterEnable( 
    input [31:0] dataIn, input CLK, control, 
    output reg [31:0] dataOut ); 

    initial begin
      dataOut = 32'bz;
    end
    
    always @(posedge CLK)  
    begin 
        if(control==1'b1) 
            dataOut <= dataIn; 
    end 
 
endmodule