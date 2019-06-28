`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:01:17 06/27/2019 
// Design Name: 
// Module Name:    DataPath 
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
module DataPath(input [1:0] aluControl, aluSrcB,
    input PCSource, ALUSrcA, RegWrite, RegDst, isInterrupted, clk,
    input isBranch, PCWrite, lorD, MemWrite, MemtoReg, IRWrite, INA,
    output reg [5:0] op, funct);

    reg zeroFlag;
    reg [31:0]Adr;
    reg [31:0]pcIn;
    reg [31:0]Data;
    reg [31:0]srcA;
    reg [31:0]srcB;
    reg [31:0]Instr;
    reg [31:0]aData;
    reg [31:0]bData;
    reg [31:0]pcOut;
    reg [31:0]pcOut2;
    reg [31:0]dstAdr; //TODO
    reg [31:0]ALUOut;
    reg [31:0]memData;
    reg [31:0]signImm;
    reg [31:0]aluResult;
    reg [31:0]writeData;
    reg [31:0]writeRegData;
    reg [31:0]four = 32'h00000004;
    reg [31:0]interruptAddress = 32'hFFFFFFFF;

    
	 always @* 
    begin
        assign op = Instr[31:26];
    end
	 
    always @* 
    begin
        assign funct = Instr[5:0];
    end
    
    assign pcEnable = (isBranch & zeroFlag) | PCWrite;

    ShiftRegisterEnable pcReg(pcIn, clk, pcEnable, pcOut);

    Mux2 interruptMux(isInterrupted, pcOut, interruptAddress, pcOut2);
    Mux2 memoryAddressMux(lorD, pcOut2, ALUOut, Adr);

    Memory InstrDataMemory(Adr, writeData, clk, MemWrite, memData);

    ShiftRegisterEnable instructionReg(memData, clk, IRWrite, Instr);
    ShiftRegister dataReg(memData, clk, Data);

    Mux2FiveBit dstMux(RegDst, Instr[20:16], Instr[15:11], dstAdr); //TODO
    Mux2 writeDataMux(MemtoReg, ALUOut, Data, writeRegData);

    SignExtend signExtender(Instr[15:0], signImm);
    Shifter2 shifter(signImm, shiftedsignImm);

    RegFile regFile(Instr[25:21], Instr[20:16], dstAdr, writeRegData, RegWrite, clk, aData, bData);

    ShiftRegister aDataReg(aData, clk, aData2);
    ShiftRegister bDataReg(bData, clk, writeData);

    Mux2 ALUPcMux(aluSrcA, pcOut2, aData2, srcA);

    Mux4 SrcBMux(aluSrcB, writeData, four, signImm, shiftedsignImm, srcB);

    ALU mainALU(srcA, srcB, aluControl, aluResult, zeroFlag);

    ShiftRegister ALUOutReg(aluResult, clk, ALUOut);

    Mux2 pcBrachMux(PCSource, aluResult, ALUOut, pcIn);

endmodule