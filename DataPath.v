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
    input PCSource, aluSrcA, RegWrite, RegDst, isInterrupted, clk,
    input isBranch, PCWrite, lorD, MemWrite, MemtoReg, IRWrite,
    output reg [5:0] op, funct);

    wire zeroFlag;
    wire pcEnable;
    wire [31:0]Adr;
    wire [31:0]pcIn;
    wire [31:0]Data;
    wire [31:0]srcA;
    wire [31:0]srcB;
    wire [4:0]dstAdr;
    wire [31:0]Instr;
    wire [31:0]aData;
    wire [31:0]bData;
    wire [27:0]pcJump;
    wire [31:0]pcOut2;
    wire [31:0]aluOut;
    wire [31:0]memData;
    wire [31:0]signImm;
    wire [31:0]aluResult;
    wire [31:0]writeData;
    wire [31:0]writeRegData;
    reg  [31:0]pcOut = 32'd128;
	wire [31:0]pcOut100;
    wire [31:0]zero = 32'h0;
    wire [31:0]four = 32'h00000004;
    wire [31:0]interruptAddress = 32'hFFFFFFFF;

	
	always @(aluControl, aluSrcB, PCSource, aluSrcA, RegWrite, RegDst, isInterrupted, clk, isBranch, PCWrite, lorD, MemWrite, MemtoReg, IRWrite)
    begin
		op = Instr[31:26];
        funct = Instr[5:0];
    end

    assign pcEnable = (isBranch & zeroFlag) | PCWrite;

    //ShiftRegisterEnable pcReg(pcIn, clk, pcEnable, pcOut);
    always @(posedge clk)  
    begin 
        if(pcEnable==1'b1) 
            pcOut <= pcIn; 
    end
	
	// initial
	// 	pcOut100 = pcOut;

    Mux2 interruptMux(isInterrupted, pcOut, interruptAddress, pcOut2);
    Mux2 memoryAddressMux(lorD, pcOut2, aluOut, Adr);

    Memory InstrDataMemory(Adr, writeData, clk, MemWrite, memData);

    ShiftRegisterEnable instructionReg(memData, clk, IRWrite, Instr);
	//always @(posedge clk)  
    //begin 
     //   if(IRWrite==1'b1 && memData != 32'bZ) 
       //     Instr <= memData; 
    //end
	
	
    ShiftRegister dataReg(memData, clk, Data);

    Mux2FiveBit dstMux(RegDst, Instr[20:16], Instr[15:11], dstAdr);
    Mux2 writeDataMux(MemtoReg, aluOut, Data, writeRegData);

    SignExtend signExtender(Instr[15:0], signImm);
    Shifter2 shifter(signImm, shiftedsignImm);

    RegFile regFile(Instr[25:21], Instr[20:16], dstAdr, writeRegData, RegWrite, clk, aData, bData);

    ShiftRegister aDataReg(aData, clk, aData2);
    ShiftRegister bDataReg(bData, clk, writeData);

    Mux2 aluPcMux(aluSrcA, pcOut2, aData2, srcA);

    Mux4 srcBMux(aluSrcB, writeData, four, signImm, shiftedsignImm, srcB);

    ALU mainAlu(srcA, srcB, aluControl, aluResult, zeroFlag);

    ShiftRegister aluOutReg(aluResult, clk, aluOut);

    Shifte2New addrShifter(Instr[25:0], pcJump);
    Mux4 pcBrachMux(PCSource, aluResult, aluOut, {pcOut2[31:28],pcJump}, zero, pcIn);

endmodule