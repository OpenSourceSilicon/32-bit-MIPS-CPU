`timescale 1ns / 1ps

module MUXB3 #(parameter WIDTH=32)
   (
    input [WIDTH-1:0]  WriteDataE,
    input [WIDTH-1:0]  SignImmE,
    input 	       ALUSrcE,
    output [WIDTH-1:0] SrcBE
    );

   assign SrcBE=(ALUSrcE)?SignImmE:WriteDataE;
   
endmodule // MUXB3
