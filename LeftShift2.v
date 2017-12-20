`timescale 1ns / 1ps

module LeftShift2 #(parameter WIDTH=32)
   (
    input [WIDTH-1:0] SignImmD,
    output [WIDTH-1:0] SignImmLS2D
    );

   assign SignImmLS2D=SignImmD;
   
endmodule // LeftShift2
