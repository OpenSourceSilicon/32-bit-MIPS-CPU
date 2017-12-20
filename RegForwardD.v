`timescale 1ns / 1ps

// Read First Mode

module RegForwardD #(parameter WIDTH=32)
   (
    input ForwardAD,
    input ForwardBD,
    input [WIDTH-1:0]  ALUOutM,
    input [WIDTH-1:0]  RD1,
    input [WIDTH-1:0]  RD2,
    output [WIDTH-1:0] RD1D,
    output [WIDTH-1:0] RD2D
    );

   assign RD1D=(ForwardAD)?ALUOutM:RD1;
   assign RD2D=(ForwardBD)?ALUOutM:RD2;
   
endmodule // RegForwardD
