`timescale 1ns / 1ps

module MUXB2 #(parameter WIDTH=32)
   (
    input [WIDTH-1:0]  WriteDataE,
    input [WIDTH-1:0]  SignImmE,
    input [WIDTH-1:0]  NoSignImmE,
    input 	       ALUSrcE,
    input 	       ALUSrcNoExE,
    output [WIDTH-1:0] SrcBE
    );
   
   assign SrcBE = (ALUSrcNoExE)?NoSignImmE:(ALUSrcE)?SignImmE:WriteDataE;
   
endmodule // MUXB2
