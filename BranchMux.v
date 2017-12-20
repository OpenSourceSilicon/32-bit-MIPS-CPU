`timescale 1ns / 1ps

module BranchMux #(parameter WIDTH=32)
   (
    input [WIDTH-1:0]  PCBranch,
    input [WIDTH-1:0]  RD1D,
    input [25:0]       InstrD,
    input 	       BranchED,
    input 	       BranchNED,
    input 	       Branch2RegD,
    input 	       Branch2ValueD,

    output [WIDTH-1:0] PCBranchD
    );

   assign PCBranchD = (BranchED + BranchNED)?PCBranch:(Branch2RegD)?RD1D:(Branch2ValueD)?{{6{InstrD[25]}},InstrD}:0;
     
endmodule // BranchMux
