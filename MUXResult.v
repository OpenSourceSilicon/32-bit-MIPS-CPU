`timescale 1ns / 1ps

module MUXResult #(parameter WIDTH=32)
   (
    input [WIDTH-1:0]  ALUOutW,
    input [WIDTH-1:0]  ReadDataW,
    input 	       MemtoRegW,
    output [WIDTH-1:0] ResultW
    );

   assign ResultW=(MemtoRegW)?ReadDataW:ALUOutW;
   
endmodule // MUXResult
