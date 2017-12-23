`timescale 1ns / 1ps

// Read First Mode

module RegForwardD #(parameter WIDTH=32)
   (
    input ForwardAD,
    input ForwardBD,
	 input ForwardADN1,
	 input ForwardBDN1,
	 input ForwardADN2,
	 input ForwardBDN2,
    input [WIDTH-1:0]  ALUOutM,
	 input [WIDTH-1:0]  ALUOutE,
	 input [WIDTH-1:0]  ResultW,
    input [WIDTH-1:0]  RD1,
    input [WIDTH-1:0]  RD2,
    output [WIDTH-1:0] RD1D,
    output [WIDTH-1:0] RD2D
    );

   assign RD1D=(ForwardADN1)?ALUOutE:(ForwardADN2)?ResultW:(ForwardAD)?ALUOutM:RD1;
   assign RD2D=(ForwardBDN1)?ALUOutE:(ForwardBDN2)?ResultW:(ForwardBD)?ALUOutM:RD2;
   
endmodule // RegForwardD
