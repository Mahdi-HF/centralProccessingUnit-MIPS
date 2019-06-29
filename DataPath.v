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
    input pcSource, aluSrcA, regWrite, regDst, isInterrupted, clk,
    input isBranch, pcWrite, lorD, memWrite, memToReg, IrWrite,
    output reg [5:0]op, funct);

    wire zeroFlag;
    wire pcEnable;
    wire [31:0]Adr;
    wire [31:0]pcIn;
    wire [31:0]data;
    wire [31:0]srcA;
    wire [31:0]srcB;
    wire [4:0]dstAdr;
    wire [31:0]instr;
    wire [31:0]aData;
    wire [31:0]bData;
    wire [31:0]aData2;
    wire [27:0]pcJump;
    wire [31:0]pcOut2;
    wire [31:0]aluOut;
    wire [31:0]memData;
    wire [31:0]signImm;
    wire [31:0]pcOut100;
    wire [31:0]aluResult;
    wire [31:0]writeData;
    wire [31:0]zero = 32'h0;
    wire [31:0]writeRegData;
    wire [31:0]shiftedSignImm;
    reg  [31:0]pcOut = 32'd128;
    wire [31:0]four = 32'h00000004;
    wire [31:0]interruptAddress = 32'hFFFFFFFF;


	always @(aluControl, aluSrcB, pcSource, aluSrcA, regWrite, regDst,
    isInterrupted, clk, isBranch, pcWrite, lorD, memWrite, memToReg, IrWrite)
    begin
		op = instr[31:26];
        funct = instr[5:0];
    end

    assign pcEnable = (isBranch & zeroFlag) | pcWrite;

    //ShiftRegisterEnable pcReg(pcIn, clk, pcEnable, pcOut);
    always @(posedge clk)  
    begin 
        if(pcEnable==1'b1)
        begin
          pcOut <= pcIn;
        end
    end

    Mux2 interruptMux(isInterrupted, pcOut, interruptAddress, pcOut2);
    Mux2 memoryAddressMux(lorD, pcOut2, aluOut, Adr);

    Memory instrDataMemory(Adr, writeData, clk, memWrite, memData);

    ShiftRegisterEnable instructionReg(memData, clk, IrWrite, instr);
	//always @(posedge clk)  
    //begin 
     //   if(IrWrite==1'b1 && memData != 32'bZ) 
       //     instr <= memData; 
    //end
	
    ShiftRegister dataReg(memData, clk, data);

    Mux2FiveBit dstMux(regDst, instr[20:16], instr[15:11], dstAdr);
    Mux2 writeDataMux(memToReg, aluOut, data, writeRegData);

    SignExtend signExtender(instr[15:0], signImm);
    Shifter2 shifter(signImm, shiftedSignImm);

    RegFile regFile(instr[25:21], instr[20:16], dstAdr, writeRegData, regWrite, clk, aData, bData);

    ShiftRegister aDataReg(aData, clk, aData2);
    ShiftRegister bDataReg(bData, clk, writeData);

    Mux2 aluPcMux(aluSrcA, pcOut2, aData2, srcA);

    Mux4 srcBMux(aluSrcB, writeData, four, signImm, shiftedSignImm, srcB);

    ALU mainAlu(srcA, srcB, aluControl, aluResult, zeroFlag);

    ShiftRegister aluOutReg(aluResult, clk, aluOut);

    Shifte2New addrShifter(instr[25:0], pcJump);
    Mux4 pcBrachMux(pcSource, aluResult, aluOut, {pcOut2[31:28],pcJump}, zero, pcIn);

endmodule