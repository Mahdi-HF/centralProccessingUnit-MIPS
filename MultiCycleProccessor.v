`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:33:50 06/27/2019 
// Design Name: 
// Module Name:    MultiCycleProccessor 
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
module MultiCycleProccessor(input clk, INT, NMI, INTD,
    output INA);
    
    reg [5:0]Op, funct;
    reg [1:0]aluControl, ALUSrcB;
    reg PCSource, ALUSrcA, RegWrite, RegDst, isInterrupted;
    reg isBranch, PCWrite, lorD, MemWrite, MemtoReg, IRWrite, INA;

    Controller controller(Op, funct, clk, INT, NMI, INTD,
    aluControl, ALUSrcB, PCSource, ALUSrcA, RegWrite, RegDst, isInterrupted);

    DataPath dataPath(aluControl, aluSrcB, PCSource, ALUSrcA, RegWrite, RegDst,
    isInterrupted, clk, isBranch, PCWrite, lorD, MemWrite, MemtoReg, IRWrite, INA,Op, funct);

endmodule
