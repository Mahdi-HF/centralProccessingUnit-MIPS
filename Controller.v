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
    input [5:0]op, funct,
    input clk, INT, NMI, INTD,
    output reg isBranch, pcWrite, lorD, MemWrite, MemtoReg, IRWrite, INA,
    output reg [1:0]aluControl, aluSrcB, PCSource, output reg aluSrcA, RegWrite, RegDst, isInterrupted);

    reg [4:0] state = 5'b01100, nextstate; //state will stat at 12
    reg [1:0] aluOp;
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
	
	initial 
	begin
		INA=0;
        isBranch=0;
        pcWrite=0;
        lorD=0;
        MemWrite=0;
        MemtoReg=0;
        IRWrite=0;
        aluControl=0;
        aluSrcB=0;
        PCSource=0;
        aluSrcA=0;
        RegWrite=0
        RegDst=0;
        isInterrupted=0;
	end
	
    always@(posedge clk)
    begin
        state=nextstate;
    end

    always @(state, op)
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
                aluSrcA=1'b0;
                lorD= 1'b0;
                IRWrite=1'b1;
                aluSrcB=2'b01;
                aluOp= 2'b00;
                pcWrite=1'b1;
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
                aluSrcA=1'b0;
                aluSrcB=2'b11;
                pcWrite=1'b0;
                aluOp= 2'b00;

                if(op==lw | op==sw)
                begin
                    nextstate=memAddr;
                end

                if(op==rType)
                begin
                    nextstate=execute;
                end

                if(op==beq)
                begin
                    nextstate=branch;
                end

                if(op==jumps)
                begin
                    nextstate=jump;
                end

                if( (op==iType1)| (op==iType2)| (op==iType3)| (op==iType4) )
                begin
                    nextstate=addIExecute;
                end
            end

            memAddr:
            begin
                aluSrcA = 1'b1;
                aluSrcB= 2'b10;
                aluOp = 2'b00;

                if(op==lw)
                begin
                    nextstate=memRead;
                end

                if(op==sw)
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
                aluSrcA= 1'b1;
                aluSrcB= 2'b00;
                aluOp = 2'b10;
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
                aluSrcA= 1'b1;
                aluSrcB= 2'b00;
                aluOp=2'b01;
                isBranch= 1'b1;
                PCSource = 2'b01;
                nextstate= preFetch;
            end

            jump:
            begin
                pcWrite= 1'b1;
                PCSource= 2'b10;
                nextstate= preFetch;
            end

            addIExecute:
            begin
                aluSrcA= 1'b1;
                aluSrcB= 2'b10;
                aluOp = 2'b10;
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


    always @(aluOp)
    begin
        if(aluOp == 2'b10) //delegate it ...
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

        else if(aluOp == 2'b00)
        begin
            aluControl = 2'b10; //ADD
        end

        else if(aluOp == 2'b01) 
        begin
            aluControl = 2'b11; //SUB
        end

        else
        begin
            aluControl = 2'bz; //impossible !
        end   
    end
endmodule