`timescale 1ns / 1ps

module Brancher #(parameter WIDTH=32)
   (
    input 	      BranchED,
    input 	      BranchNED,
    input 	      Branch2RegD,
    input 	      Branch2ValueD,
    input [WIDTH-1:0] RD1D,
    input [WIDTH-1:0] RD2D,
    output 	      PCSrcD
    );

   wire 	      Equal;

   assign Equal  = (RD1D==RD2D)?1'b1:1'b0;
   assign PCSrcD = (Equal&BranchED)|(BranchNED&(~Equal))|Branch2RegD|Branch2ValueD;
   
endmodule // Brancher
