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
    
    // wire [5:0]Op, funct;
    // wire [1:0]aluControl2, ALUSrcB2;
    // wire PCSource, ALUSrc, RegWrite, RegDst, isInterrupted;
    // wire isBranch, PCWrite, lorD, MemWrite, MemtoReg, IRWrite;

    Controller controller(Op, funct, clk, INT, NMI, INTD,
    isBranch, PCWrite, lorD, MemWrite, MemtoReg, IRWrite, INA,
    aluControl, ALUSrcB, PCSource, ALUSrcA, RegWrite, RegDst, isInterrupted);

    DataPath dataPath(aluControl, ALUSrcB, PCSource, ALUSrcA, RegWrite, RegDst,
    isInterrupted, clk, isBranch, PCWrite, lorD, MemWrite, MemtoReg, IRWrite, Op, funct);

endmodule
 











    // wire PCSource2, ALUSrcA2, RegWrite2, RegDst2, isInterrupted2;
    // wire isBranch2, PCWrite2, lorD2, MemWrite2, MemtoReg2, IRWrite2;


    // assign aluControl2 = aluControl;
    // assign ALUSrcB2 = ALUSrcB;
    // assign PCSource2 = PCSource;
    // assign ALUSrcA2 = ALUSrcA;
    // assign RegWrite2 = RegWrite;
    // assign RegDst2 = RegDst;
    // assign isInterrupted2 = isInterrupted;
    // assign isBranch2 = isBranch;
    // assign PCWrite2 = PCWrite;
    // assign lorD2 = lorD;
    // assign MemWrite2 = MemWrite;
    // assign MemtoReg2 = MemtoReg;
    // assign IRWrite2 = IRWrite;

    // always @* begin
    //     INA2 = INA;
    // end
    // DataPath dataPath(aluControl2, ALUSrcB2, PCSource2, ALUSrcA2, RegWrite2, RegDst2,
    // isInterrupted2, clk, isBranch, PCWrite2, lorD2, MemWrite2, MemtoReg2, IRWrite2, Op, funct);

    // assign INA3 = INA2;