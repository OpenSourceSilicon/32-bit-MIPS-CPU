`timescale 1ns / 1ps

module MUXA1 #(parameter WIDTH=32)
   (
    input [WIDTH-1:0]  RD1E,
    input [WIDTH-1:0]  ResultW,
    input [WIDTH-1:0]  ALUOutM,
    input [1:0]	       ForwardAE,
    output [WIDTH-1:0] SrcAE
    );

   assign SrcAE=(ForwardAE==0)?RD1E:(ForwardAE==1)?ResultW:ALUOutM;
   
endmodule // MUXA1
