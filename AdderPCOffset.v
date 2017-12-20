`timescale 1ns / 1ps

module AdderPCOffset #(parameter WIDTH=32)
   (
    input [WIDTH-1:0]  SignImmLS2D,
    input [WIDTH-1:0]  PCPlus4D,
    output [WIDTH-1:0] PCBranch
    );

   assign PCBranch=SignImmLS2D+PCPlus4D;
   
endmodule // AdderPCOffset
