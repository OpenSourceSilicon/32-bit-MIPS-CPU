`timescale 1ns / 1ps

module Buffer3 #(parameter WIDTH=32)
   (
    input 		   RegWriteD,
    input 		   MemtoRegD,
    input 		   MemWriteD,
    input 		   ALUSrcD,
    input 		   ALUSrcNoExD,
    input 		   RegDstD,
    input [3:0] 	   ALUControlD,
    input [WIDTH-1:0] 	   RD1D, 
    input [WIDTH-1:0] 	   RD2D,
    input [4:0] 	   RsD,
    input [4:0] 	   RtD,
    input [4:0] 	   RdD, 
    input [WIDTH-1:0] 	   SignImmD,
    input [WIDTH-1:0] 	   NoSignImmD,
    input 		   CLR, 
    input 		   clk,

    output reg 		   RegWriteE, 
    output reg 		   MemtoRegE,
    output reg 		   MemWriteE,
    output reg 		   ALUSrcE,
    output reg 		   ALUSrcNoExE,
    output reg 		   RegDstE,
    output reg [3:0] 	   ALUControlE,
    output reg [WIDTH-1:0] RD1E, 
    output reg [WIDTH-1:0] RD2E, 
    output reg [4:0] 	   RsE, 
    output reg [4:0] 	   RtE, 
    output reg [4:0] 	   RdE,
    output reg [WIDTH-1:0] SignImmE,
    output reg [WIDTH-1:0] NoSignImmE
    );

   initial
     begin
	RegWriteE<=0;
	MemtoRegE<=0;
	MemWriteE<=0;
	ALUSrcE<=0;
	ALUSrcNoExE<=0;
	RegDstE<=0;
	ALUControlE<=0;
	RD1E<=0;
	RD2E<=0;
	RsE<=0;
	RtE<=0;
	RdE<=0;
	SignImmE<=0;
	NoSignImmE<=0;
     end // initial begin
   
   always @(posedge clk)
     begin
	if(CLR)
	  begin
	     RegWriteE<=0;
	     MemtoRegE<=0;
	     MemWriteE<=0;
	     ALUSrcE<=0;
	     ALUSrcNoExE<=0;
	     RegDstE<=0;
	     ALUControlE<=0;
	     RD1E<=0;
	     RD2E<=0;
	     RsE<=0;
	     RtE<=0;
	     RdE<=0;
	     SignImmE<=0;
	     NoSignImmE<=0;
	  end // if (CLR)
	else
	  begin
	     RegWriteE<=RegWriteD;
	     MemtoRegE<=MemtoRegD;
	     MemWriteE<=MemWriteD;
	     ALUSrcE<=ALUSrcD;
	     ALUSrcNoExE<=ALUSrcNoExD;
	     RegDstE<=RegDstD;
	     ALUControlE<=ALUControlD;
	     RD1E<=RD1D;
	     RD2E<=RD2D;
	     RsE<=RsD;
	     RtE<=RtD;
	     RdE<=RdD;
	     SignImmE<=SignImmD; 
	     NoSignImmE<=NoSignImmD;
	  end // else: !if(CLR)
     end
	
endmodule // Buffer3
