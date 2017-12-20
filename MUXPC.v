`timescale 1ns / 1ps

module MUXPC #(parameter WIDTH=32)
   (
    input [WIDTH-1:0]  PCPlus4F,
    input [WIDTH-1:0]  PCBranchD,
    input 	       PCSrcD, 
    output [WIDTH-1:0] PC_
    );

   assign PC_=(PCSrcD)?PCBranchD:PCPlus4F;
 
endmodule // MUXPC
