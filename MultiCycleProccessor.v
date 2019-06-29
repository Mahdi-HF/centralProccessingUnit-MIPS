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
    output reg INA);
    
    wire [5:0]op, funct;
    wire [1:0]aluControl, aluSrcB;
    wire pcSource, aluSrc, regWrite, regDst, isInterrupted, aluSrcA ;
    wire isBranch, pcWrite, lorD, memWrite, memToReg, irWrite;

    Controller controller(op, funct, clk, INT, NMI, INTD,
    isBranch, pcWrite, lorD, memWrite, memToReg, irWrite, INA,
    aluControl, aluSrcB, pcSource, aluSrcA, regWrite, regDst, isInterrupted);

    DataPath dataPath(aluControl, aluSrcB, pcSource, aluSrcA, regWrite, regDst,
    isInterrupted, clk, isBranch, pcWrite, lorD, memWrite, memToReg, irWrite, op, funct);

endmodule