`timescale 1ns / 1ps

module Buffer5 #(parameter WIDTH=32)
   (
    input 		   RegWriteM,
    input 		   MemtoRegM,
    input [WIDTH-1:0] 	   ALUOutM,
    input [4:0] 	   WriteRegM,
    input 		   clk,

    output reg 		   RegWriteW,
    output reg 		   MemtoRegW,
    output reg [WIDTH-1:0] ALUOutW,
    output reg [4:0] 	   WriteRegW			
    );

   initial
     begin
	RegWriteW=0;
	MemtoRegW=0;
	ALUOutW=0;
	WriteRegW=0;
     end
   
   always @(posedge clk)
     begin
	RegWriteW<=RegWriteM;
	MemtoRegW<=MemtoRegM;
	ALUOutW<=ALUOutM;
	WriteRegW<=WriteRegM;
     end
	
endmodule // Buffer5
