`timescale 1ns / 1ps

module ControlUnit
   (
    input [5:0]  Op,
    input [5:0]  Funct,

    output 	 RegWriteD,
    output 	 MemtoRegD,
    output 	 MemWriteD,
    output [3:0] ALUControlD,
    output 	 ALUSrcD,
    output 	 ALUSrcNoExD,
    output 	 RegDstD, 
    output 	 BranchED,
    output 	 BranchNED,
    output 	 Branch2RegD,
    output 	 Branch2ValueD
    );
   
   parameter ADD   = 6'h20;
   parameter AND   = 6'h24;
   parameter OR    = 6'h25;
   parameter SEQ   = 6'h28;
   parameter SLE   = 6'h2c;
   parameter SLL   = 6'h04;
   parameter SLT   = 6'h2a;
   parameter SNE   = 6'h29;
   parameter SRA   = 6'h07;
   parameter SRL   = 6'h06;
   parameter SUB   = 6'h22;
   parameter XOR   = 6'h26;
   
   parameter J     = 6'h02;
   parameter JAL   = 6'h03;
   
   parameter ADDI  = 6'h08;
   parameter ANDI  = 6'h0c;
   parameter BEQZ  = 6'h04;
   parameter BNEZ  = 6'h05;
   parameter JALR  = 6'h13;
   parameter JR    = 6'h12;
   parameter LHI   = 6'h0f;
   parameter LW    = 6'h23;
   parameter ORI   = 6'h0d;
   parameter SEQI  = 6'h18;
   parameter SLEI  = 6'h1c;
   parameter SLLI  = 6'h14;
   parameter SLTI  = 6'h1a;
   parameter SNEI  = 6'h19;
   parameter SRAI  = 6'h17;
   parameter SRLI  = 6'h16;
   parameter SUBI  = 6'h0a;
   parameter SW    = 6'h2b;
   parameter XORI  = 6'h0e;	

   
   assign  RegWriteD   = (Op==J)?   0:(Op==JAL)?   0:(Op==ADDI)?   1:(Op==ANDI)?   1:(Op==BEQZ)?   0:(Op==BNEZ)?   0:(Op==JALR)?   0:(Op==JR)?   0:(Op==LHI)?   1:(Op==LW)?   1:(Op==ORI)?   1:(Op==SEQI)?   1:(Op==SLEI)?   1:(Op==SLLI)?   1:(Op==SLTI)?   1:(Op==SNEI)?   1:(Op==SRAI)?   1:(Op==SRLI)?   1:(Op==SUBI)?   1:(Op==SW)?   0:(Op==XORI)?   1:(Op==6'h00)?((Funct==ADD)?   1:(Funct==AND)?   1:(Funct==OR)?   1:(Funct==SEQ)?   1:(Funct==SLE)?   1:(Funct==SLL)?   1:(Funct==SLT)?   1:(Funct==SNE)?   1:(Funct==SRA)?   1:(Funct==SRL)?   1:(Funct==SUB)?   1:(Funct==XOR)?   1:0):0;
   assign  MemtoRegD   = (Op==J)?   0:(Op==JAL)?   0:(Op==ADDI)?   0:(Op==ANDI)?   0:(Op==BEQZ)?   0:(Op==BNEZ)?   0:(Op==JALR)?   0:(Op==JR)?   0:(Op==LHI)?   0:(Op==LW)?   1:(Op==ORI)?   0:(Op==SEQI)?   0:(Op==SLEI)?   0:(Op==SLLI)?   0:(Op==SLTI)?   0:(Op==SNEI)?   0:(Op==SRAI)?   0:(Op==SRLI)?   0:(Op==SUBI)?   0:(Op==SW)?   0:(Op==XORI)?   0:(Op==6'h00)?((Funct==ADD)?   0:(Funct==AND)?   0:(Funct==OR)?   0:(Funct==SEQ)?   0:(Funct==SLE)?   0:(Funct==SLL)?   0:(Funct==SLT)?   0:(Funct==SNE)?   0:(Funct==SRA)?   0:(Funct==SRL)?   0:(Funct==SUB)?   0:(Funct==XOR)?   0:0):0;
   assign  MemWriteD   = (Op==J)?   0:(Op==JAL)?   0:(Op==ADDI)?   0:(Op==ANDI)?   0:(Op==BEQZ)?   0:(Op==BNEZ)?   0:(Op==JALR)?   0:(Op==JR)?   0:(Op==LHI)?   0:(Op==LW)?   0:(Op==ORI)?   0:(Op==SEQI)?   0:(Op==SLEI)?   0:(Op==SLLI)?   0:(Op==SLTI)?   0:(Op==SNEI)?   0:(Op==SRAI)?   0:(Op==SRLI)?   0:(Op==SUBI)?   0:(Op==SW)?   1:(Op==XORI)?   0:(Op==6'h00)?((Funct==ADD)?   0:(Funct==AND)?   0:(Funct==OR)?   0:(Funct==SEQ)?   0:(Funct==SLE)?   0:(Funct==SLL)?   0:(Funct==SLT)?   0:(Funct==SNE)?   0:(Funct==SRA)?   0:(Funct==SRL)?   0:(Funct==SUB)?   0:(Funct==XOR)?   0:0):0;
   assign  ALUControlD = (Op==J)?4'h0:(Op==JAL)?4'h0:(Op==ADDI)?4'h1:(Op==ANDI)?4'h2:(Op==BEQZ)?4'h0:(Op==BNEZ)?4'h0:(Op==JALR)?4'h0:(Op==JR)?4'h0:(Op==LHI)?4'hd:(Op==LW)?4'h1:(Op==ORI)?4'h3:(Op==SEQI)?4'h7:(Op==SLEI)?4'ha:(Op==SLLI)?4'h6:(Op==SLTI)?4'hb:(Op==SNEI)?4'h8:(Op==SRAI)?4'hc:(Op==SRLI)?4'h9:(Op==SUBI)?4'h4:(Op==SW)?4'h1:(Op==XORI)?4'h5:(Op==6'h00)?((Funct==ADD)?4'h1:(Funct==AND)?4'h2:(Funct==OR)?4'h3:(Funct==SEQ)?4'h7:(Funct==SLE)?4'ha:(Funct==SLL)?4'h6:(Funct==SLT)?4'hb:(Funct==SNE)?4'h8:(Funct==SRA)?4'hc:(Funct==SRL)?4'h9:(Funct==SUB)?4'h4:(Funct==XOR)?4'h5:0):0;
   assign  ALUSrcD     = (Op==J)?   0:(Op==JAL)?   0:(Op==ADDI)?   1:(Op==ANDI)?   1:(Op==BEQZ)?   1:(Op==BNEZ)?   1:(Op==JALR)?   0:(Op==JR)?   0:(Op==LHI)?   1:(Op==LW)?   1:(Op==ORI)?   1:(Op==SEQI)?   1:(Op==SLEI)?   1:(Op==SLLI)?   1:(Op==SLTI)?   1:(Op==SNEI)?   1:(Op==SRAI)?   1:(Op==SRLI)?   1:(Op==SUBI)?   1:(Op==SW)?   1:(Op==XORI)?   1:(Op==6'h00)?((Funct==ADD)?   0:(Funct==AND)?   0:(Funct==OR)?   0:(Funct==SEQ)?   0:(Funct==SLE)?   0:(Funct==SLL)?   0:(Funct==SLT)?   0:(Funct==SNE)?   0:(Funct==SRA)?   0:(Funct==SRL)?   0:(Funct==SUB)?   0:(Funct==XOR)?   0:0):0;
   assign  ALUSrcNoExD = (Op==J)?   0:(Op==JAL)?   0:(Op==ADDI)?   0:(Op==ANDI)?   1:(Op==BEQZ)?   0:(Op==BNEZ)?   0:(Op==JALR)?   0:(Op==JR)?   0:(Op==LHI)?   0:(Op==LW)?   0:(Op==ORI)?   1:(Op==SEQI)?   0:(Op==SLEI)?   0:(Op==SLLI)?   0:(Op==SLTI)?   0:(Op==SNEI)?   0:(Op==SRAI)?   0:(Op==SRLI)?   0:(Op==SUBI)?   0:(Op==SW)?   0:(Op==XORI)?   1:(Op==6'h00)?((Funct==ADD)?   0:(Funct==AND)?   0:(Funct==OR)?   0:(Funct==SEQ)?   0:(Funct==SLE)?   0:(Funct==SLL)?   0:(Funct==SLT)?   0:(Funct==SNE)?   0:(Funct==SRA)?   0:(Funct==SRL)?   0:(Funct==SUB)?   0:(Funct==XOR)?   0:0):0;
   assign  RegDstD     = (Op==J)?   0:(Op==JAL)?   0:(Op==ADDI)?   0:(Op==ANDI)?   0:(Op==BEQZ)?   0:(Op==BNEZ)?   0:(Op==JALR)?   0:(Op==JR)?   0:(Op==LHI)?   0:(Op==LW)?   0:(Op==ORI)?   0:(Op==SEQI)?   0:(Op==SLEI)?   0:(Op==SLLI)?   0:(Op==SLTI)?   0:(Op==SNEI)?   0:(Op==SRAI)?   0:(Op==SRLI)?   0:(Op==SUBI)?   0:(Op==SW)?   0:(Op==XORI)?   0:(Op==6'h00)?((Funct==ADD)?   1:(Funct==AND)?   1:(Funct==OR)?   1:(Funct==SEQ)?   1:(Funct==SLE)?   1:(Funct==SLL)?   1:(Funct==SLT)?   1:(Funct==SNE)?   1:(Funct==SRA)?   1:(Funct==SRL)?   1:(Funct==SUB)?   1:(Funct==XOR)?   1:0):0;
   assign  BranchED    = (Op==J)?   0:(Op==JAL)?   0:(Op==ADDI)?   0:(Op==ANDI)?   0:(Op==BEQZ)?   1:(Op==BNEZ)?   0:(Op==JALR)?   0:(Op==JR)?   0:(Op==LHI)?   0:(Op==LW)?   0:(Op==ORI)?   0:(Op==SEQI)?   0:(Op==SLEI)?   0:(Op==SLLI)?   0:(Op==SLTI)?   0:(Op==SNEI)?   0:(Op==SRAI)?   0:(Op==SRLI)?   0:(Op==SUBI)?   0:(Op==SW)?   0:(Op==XORI)?   0:(Op==6'h00)?((Funct==ADD)?   0:(Funct==AND)?   0:(Funct==OR)?   0:(Funct==SEQ)?   0:(Funct==SLE)?   0:(Funct==SLL)?   0:(Funct==SLT)?   0:(Funct==SNE)?   0:(Funct==SRA)?   0:(Funct==SRL)?   0:(Funct==SUB)?   0:(Funct==XOR)?   0:0):0;
   assign  BranchNED   = (Op==J)?   0:(Op==JAL)?   0:(Op==ADDI)?   0:(Op==ANDI)?   0:(Op==BEQZ)?   0:(Op==BNEZ)?   1:(Op==JALR)?   0:(Op==JR)?   0:(Op==LHI)?   0:(Op==LW)?   0:(Op==ORI)?   0:(Op==SEQI)?   0:(Op==SLEI)?   0:(Op==SLLI)?   0:(Op==SLTI)?   0:(Op==SNEI)?   0:(Op==SRAI)?   0:(Op==SRLI)?   0:(Op==SUBI)?   0:(Op==SW)?   0:(Op==XORI)?   0:(Op==6'h00)?((Funct==ADD)?   0:(Funct==AND)?   0:(Funct==OR)?   0:(Funct==SEQ)?   0:(Funct==SLE)?   0:(Funct==SLL)?   0:(Funct==SLT)?   0:(Funct==SNE)?   0:(Funct==SRA)?   0:(Funct==SRL)?   0:(Funct==SUB)?   0:(Funct==XOR)?   0:0):0;
   assign  Branch2RegD = (Op==J)?   0:(Op==JAL)?   0:(Op==ADDI)?   0:(Op==ANDI)?   0:(Op==BEQZ)?   0:(Op==BNEZ)?   0:(Op==JALR)?   1:(Op==JR)?   1:(Op==LHI)?   0:(Op==LW)?   0:(Op==ORI)?   0:(Op==SEQI)?   0:(Op==SLEI)?   0:(Op==SLLI)?   0:(Op==SLTI)?   0:(Op==SNEI)?   0:(Op==SRAI)?   0:(Op==SRLI)?   0:(Op==SUBI)?   0:(Op==SW)?   0:(Op==XORI)?   0:(Op==6'h00)?((Funct==ADD)?   0:(Funct==AND)?   0:(Funct==OR)?   0:(Funct==SEQ)?   0:(Funct==SLE)?   0:(Funct==SLL)?   0:(Funct==SLT)?   0:(Funct==SNE)?   0:(Funct==SRA)?   0:(Funct==SRL)?   0:(Funct==SUB)?   0:(Funct==XOR)?   0:0):0;
   assign  Branch2ValueD=(Op==J)?   1:(Op==JAL)?   1:(Op==ADDI)?   0:(Op==ANDI)?   0:(Op==BEQZ)?   0:(Op==BNEZ)?   0:(Op==JALR)?   0:(Op==JR)?   0:(Op==LHI)?   0:(Op==LW)?   0:(Op==ORI)?   0:(Op==SEQI)?   0:(Op==SLEI)?   0:(Op==SLLI)?   0:(Op==SLTI)?   0:(Op==SNEI)?   0:(Op==SRAI)?   0:(Op==SRLI)?   0:(Op==SUBI)?   0:(Op==SW)?   0:(Op==XORI)?   0:(Op==6'h00)?((Funct==ADD)?   0:(Funct==AND)?   0:(Funct==OR)?   0:(Funct==SEQ)?   0:(Funct==SLE)?   0:(Funct==SLL)?   0:(Funct==SLT)?   0:(Funct==SNE)?   0:(Funct==SRA)?   0:(Funct==SRL)?   0:(Funct==SUB)?   0:(Funct==XOR)?   0:0):0;

endmodule // ControlUnit
