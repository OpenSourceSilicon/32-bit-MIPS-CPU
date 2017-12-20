`timescale 1ns / 1ps

module ADD4PC #(parameter WIDTH=32)
   (
    input [WIDTH-1:0]  PCF,
    output [WIDTH-1:0] PCPlus4F
    );

   assign PCPlus4F=PCF+1;
   
endmodule // ADD4PC
