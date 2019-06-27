`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    02:06:35 06/27/2019 
// Design Name: 
// Module Name:    Controller 
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
module Controller(
    input Clk, Reset, [5:0]Op,
    output reg PCWriteCond, PCWrite, lorD, MemWrite, MemtoReg, IRWrite,
    output reg [1:0]ALUOp, ALUSrcB, PCSource, ALUSrcA, RegWrite, RegDst);

    reg [4:0] state = 0, nextstate;

    parameter S0=0;
    parameter S1=1;
    parameter S2=2;
    parameter S3=3;
    parameter S4=4; 
    parameter S5=5; 
    parameter S6=6; 
    parameter S7=7; 
    parameter S8=8; 
    parameter S9=9; 
    parameter S10=10; 
    parameter S11=11;

    parameter sw = 6'b101011;
    parameter lw = 6'b100011;
    parameter beq = 6'b000100;
    parameter jump = 6'b000010;
    parameter rType = 6'b000000;
    parameter iType1 = 6'b001100;
    parameter iType2 = 6'b001101;
    parameter iType3 = 6'b001110;
    parameter iType4 = 6'b001111;

    always@(posedge Clk)
    begin
        state=nextstate;
    end

    always @(state, Op)
    begin
        case(state)
            S0: 
            begin
                ALUSrcA=1'b0;
                lorD= 1'b0; 
                IRWrite=1'b1; 
                ALUSrcB=2'b01;
                ALUOp= 2'b00; PCWrite=1'b1; 
                PCSource=2'b00; 
                nextstate=S1; 
                RegWrite = 1'b0; 
                MemWrite=1'b0; 
                PCWriteCond= 1'b0; 
                MemtoReg=1'b0;
            end

            S1: 
            begin
                IRWrite=1'b0;
                ALUSrcA=1'b0;
                ALUSrcB=2'b11;
                PCWrite=1'b0;
                ALUOp= 2'b00;

                if(Op==lw | Op==sw) 
                begin
                    nextstate=S2; 
                end

                if(Op==rType) 
                begin
                    nextstate=S6;
                end

                if(Op==beq) 
                begin
                    nextstate=S8;
                end

                if(Op==jump) 
                begin
                    nextstate=S9;
                end

                if( (Op==iType1)| (Op==iType2)| (Op==iType3)| (Op==iType4)) 
                begin
                    nextstate=S10;
                end
            end

            S2: 
            begin
                ALUSrcA = 1'b1;
                ALUSrcB= 2'b10;
                ALUOp = 2'b00;

                if(Op==lw) 
                begin
                    nextstate=S3;
                end

                if(Op==sw) 
                begin
                    nextstate=S5;
                end
            end

            S3: 
            begin
                lorD = 1'b1; 
                nextstate=S4;
            end

            S4: 
            begin
                RegDst = 1'b0;
                RegWrite = 1'b1; 
                MemtoReg= 1'b1; 
                nextstate=S0; 
            end

            S5: 
            begin
                MemWrite=1'b1;
                lorD= 1'b1;
                nextstate=S0;
            end

            S6: 
            begin
                ALUSrcA= 1'b1;
                ALUSrcB= 2'b00;
                ALUOp = 2'b10;
                nextstate = S7;
            end

            S7: 
            begin
                RegDst= 1'b1;
                RegWrite = 1'b1;
                MemtoReg = 1'b0;
                nextstate= S0;
            end

            S8: 
            begin
                ALUSrcA= 1'b1;
                ALUSrcB= 2'b00;
                ALUOp=2'b01;
                PCWriteCond= 1'b1;
                PCSource = 2'b01;
                nextstate= S0;
            end

            S9: 
            begin
                PCWrite= 1'b1;
                PCSource= 2'b10;
                nextstate= S0;
            end

            S10:
            begin
                ALUSrcA= 1'b1;
                ALUSrcB= 2'b10;
                ALUOp = 2'b10;
                nextstate = S11;
            end

            S11: 
            begin
                RegDst= 1'b1;
                RegWrite = 1'b1;
                MemtoReg = 1'b0;
                nextstate= S0;
            end
        endcase 
    end
endmodule
