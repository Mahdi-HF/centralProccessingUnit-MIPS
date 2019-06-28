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
    input [5:0]Op, funct,
    input Clk, INT, NMI, INTD,
    output reg isBranch, PCWrite, lorD, MemWrite, MemtoReg, IRWrite, INA,
    output reg [1:0]aluControl, ALUSrcB, output reg PCSource, ALUSrcA, RegWrite, RegDst, isInterrupted);

    reg [4:0] state = 0, nextstate;
    reg [1:0] ALUOp;
    reg INTFlag = 0;
    reg NMIFlag = 0;

    parameter fetch=0;
    parameter decode=1;
    parameter memAddr=2;
    parameter memRead=3;
    parameter memWriteBack=4;
    parameter memWrite=5;
    parameter execute=6;
    parameter aluWriteBack=7;
    parameter branch=8;
    parameter jump=9;
    parameter addIExecute=10;
    parameter addIwriteBack=11;
    parameter preFetch=12;
    parameter interrupt=13;

    parameter sw = 6'b101011;
    parameter lw = 6'b100011;
    parameter beq = 6'b000100;
    parameter jumps = 6'b000010;
    parameter rType = 6'b000000;
    parameter iType1 = 6'b001100;
    parameter iType2 = 6'b001101;
    parameter iType3 = 6'b001110;
    parameter iType4 = 6'b001111;

    always@(INT,NMI) 
    begin
        if(INT == 1) INTFlag = 1; 
        if(NMI == 1) NMIFlag = 1; 
    end

    always@(posedge Clk)
    begin
        state=nextstate;
    end

    always @(state, Op)
    begin
        case(state)
            preFetch:
            begin
                if(INTD == 1)
                begin
                    if(NMIFlag == 0)    // do nothing
                    begin
                        isInterrupted = 1'b0;
                        nextstate = fetch;
                    end

                    else    // NMI should be taken
                    begin
                        isInterrupted = 1'b1;
                        INA = 0;  
                        nextstate = interrupt;
                    end 
                end

                else 
                begin
                    if (INTFlag == 0 & NMIFlag == 0 )   // do nothing
                    begin
                        isInterrupted = 1'b0;
                        nextstate = fetch;
                    end

                    else if (INTFlag == 1 & NMIFlag == 0 )   // INT should be taken
                    begin
                        isInterrupted = 1'b1;
                        INA = 1;
                        nextstate = interrupt;
                    end

                    else if (INTFlag == 1 & NMIFlag == 1 )  // NMI should be taken 
                    begin
                        isInterrupted = 1'b1;
                        INA = 0;
                        nextstate = interrupt;
                    end

                    else if (INTFlag == 0 & NMIFlag == 1 )  // NMI should be taken 
                    begin
                        isInterrupted = 1'b1;
                        INA = 0;
                        nextstate = interrupt;
                    end
                end
            end

            fetch:
            begin
                ALUSrcA=1'b0;
                lorD= 1'b0;
                IRWrite=1'b1;
                ALUSrcB=2'b01;
                ALUOp= 2'b00;
                PCWrite=1'b1;
                PCSource=2'b00;
                RegWrite = 1'b0;
                MemWrite=1'b0;
                isBranch= 1'b0;
                MemtoReg=1'b0;
                nextstate=decode;
            end

            decode:
            begin
                IRWrite=1'b0;
                ALUSrcA=1'b0;
                ALUSrcB=2'b11;
                PCWrite=1'b0;
                ALUOp= 2'b00;

                if(Op==lw | Op==sw)
                begin
                    nextstate=memAddr;
                end

                if(Op==rType)
                begin
                    nextstate=execute;
                end

                if(Op==beq)
                begin
                    nextstate=branch;
                end

                if(Op==jumps)
                begin
                    nextstate=jump;
                end

                if( (Op==iType1)| (Op==iType2)| (Op==iType3)| (Op==iType4))
                begin
                    nextstate=addIExecute;
                end
            end

            memAddr:
            begin
                ALUSrcA = 1'b1;
                ALUSrcB= 2'b10;
                ALUOp = 2'b00;

                if(Op==lw)
                begin
                    nextstate=memRead;
                end

                if(Op==sw)
                begin
                    nextstate=memWrite;
                end
            end

            memRead:
            begin
                lorD = 1'b1;
                nextstate=memWriteBack;
            end

            memWriteBack:
            begin
                RegDst = 1'b0;
                RegWrite = 1'b1;
                MemtoReg= 1'b1;
                nextstate=preFetch;
            end

            memWrite:
            begin
                MemWrite=1'b1;
                lorD= 1'b1;
                nextstate=preFetch;
            end

            execute:
            begin
                ALUSrcA= 1'b1;
                ALUSrcB= 2'b00;
                ALUOp = 2'b10;
                nextstate = aluWriteBack;
            end

            aluWriteBack:
            begin
                RegDst= 1'b1;
                RegWrite = 1'b1;
                MemtoReg = 1'b0;
                nextstate= preFetch;
            end

            branch:
            begin
                ALUSrcA= 1'b1;
                ALUSrcB= 2'b00;
                ALUOp=2'b01;
                isBranch= 1'b1;
                PCSource = 2'b01;
                nextstate= preFetch;
            end

            jump:
            begin
                PCWrite= 1'b1;
                PCSource= 2'b10;
                nextstate= preFetch;
            end

            addIExecute:
            begin
                ALUSrcA= 1'b1;
                ALUSrcB= 2'b10;
                ALUOp = 2'b10;
                nextstate = addIwriteBack;
            end

            addIwriteBack:
            begin
                RegDst= 1'b1;
                RegWrite = 1'b1;
                MemtoReg = 1'b0;
                nextstate= preFetch;
            end
        endcase
    end


    always @(ALUOp)
    begin
        if(ALUOp == 2'b10) //delegate it ...
        begin
            case(funct)
                6'b100000: //ADD
                begin
                    aluControl = 2'b10;
                end

                6'b100100: //AND
                begin
                    aluControl = 2'b00;
                end

                6'b100110: //XOR
                begin
                    aluControl = 2'b01;
                end

                6'b100010: //SUB
                begin
                    aluControl = 2'b11;
                end
                default : aluControl = 2'bz;
			endcase
        end

        else if(ALUOp == 2'b00)
        begin
            aluControl = 2'b10; //ADD
        end

        else if(ALUOp == 2'b01) 
        begin
            aluControl = 2'b11; //SUB
        end

        else
        begin
            aluControl = 2'bz; //impossible !
        end   
    end
endmodule