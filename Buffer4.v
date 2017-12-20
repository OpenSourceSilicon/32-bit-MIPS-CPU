`timescale 1ns / 1ps

module Buffer4 #(parameter WIDTH=32)
   (
    input 		   RegWriteE,
    input 		   MemtoRegE,
    input 		   MemWriteE,
    input [WIDTH-1:0] 	   ALUOutE,
    input [WIDTH-1:0] 	   WriteDataE,
    input [4:0] 	   WriteRegE,
    input 		   clk,

    output reg 		   RegWriteM,
    output reg 		   MemtoRegM,
    output reg 		   MemWriteM,
    output reg [WIDTH-1:0] ALUOutM,
    output reg [WIDTH-1:0] WriteDataM,
    output reg [4:0] 	   WriteRegM			
    );

   initial
     begin
	RegWriteM<=0;
	MemtoRegM<=0;
       	MemWriteM<=0;
	ALUOutM<=0;
	WriteDataM<=0;
	WriteRegM<=0;	
     end
   
   always @(posedge clk)
     begin
	RegWriteM<=RegWriteE;
	MemtoRegM<=MemtoRegE;
       	MemWriteM<=MemWriteE;
	ALUOutM<=ALUOutE;
	WriteDataM<=WriteDataE;
	WriteRegM<=WriteRegE;
     end
	
endmodule // Buffer4
