`timescale 1ns / 1ps

module MUXB1 #(parameter WIDTH=32)
   (
    input [WIDTH-1:0]  RD2E,
    input [WIDTH-1:0]  ResultW,
    input [WIDTH-1:0]  ALUOutM,
    input [1:0]	       ForwardBE,
    output [WIDTH-1:0] WriteDataE
    );

   assign WriteDataE=(ForwardBE==0)?RD2E:(ForwardBE==1)?ResultW:ALUOutM;
   
endmodule // MUXB1
