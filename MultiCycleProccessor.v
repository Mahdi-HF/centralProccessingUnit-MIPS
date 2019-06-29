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
    
    wire [5:0]Op, funct;
    wire [1:0]aluControl, aluSrcB;
    wire PCSource, aluSrc, RegWrite, RegDst, isInterrupted;
    wire isBranch, PCWrite, lorD, MemWrite, MemtoReg, IRWrite;

    Controller controller(Op, funct, clk, INT, NMI, INTD,
    isBranch, PCWrite, lorD, MemWrite, MemtoReg, IRWrite, INA,
    aluControl, aluSrcB, PCSource, aluSrcA, RegWrite, RegDst, isInterrupted);

    DataPath dataPath(aluControl, aluSrcB, PCSource, aluSrcA, RegWrite, RegDst,
    isInterrupted, clk, isBranch, PCWrite, lorD, MemWrite, MemtoReg, IRWrite, Op, funct);

endmodule