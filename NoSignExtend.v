`timescale 1ns / 1ps

module NoSignExtend #(parameter WIDTH1=16, WIDTH2=32)
   (
    input [WIDTH1-1:0]  in,
    output [WIDTH2-1:0] out
    );

   assign out={{WIDTH2-WIDTH1{1'b0}},in};

endmodule // NoSignExtend
