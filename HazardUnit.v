`timescale 1ns / 1ps

module HazardUnit #(parameter WIDTH=32)
   (
    input 	 clk,
    input [4:0]  RsD,
    input [4:0]  RtD,
    input [4:0]  RsE,
    input [4:0]  RtE,
    input [4:0]  WriteRegE,
    input 	 MemtoRegE,
    input 	 RegWriteE, 
    input [4:0]  WriteRegM,
    input 	 MemtoRegM,
    input 	 RegWriteM,
    input [4:0]  WriteRegW,
    input 	 RegWriteW,
    input 	 PCSrcD,
    output 	 StallF,
    output 	 StallD,
    output 	 ForwardAD,
    output 	 ForwardBD,
    output 	 FlushE,
    output [1:0] ForwardAE,
    output [1:0] ForwardBE
    );
	 
reg [1:0] countreg;

   // Yahan clock lao fir counter lagake 1 ya 2 cycle wait karo
   assign ForwardAD = (RsD==WriteRegM)?1:0;
   assign ForwardBD = (RtD==WriteRegM)?1:0;
   assign ForwardAE = (RsE==WriteRegM)?2'b10:(RsE==WriteRegW)?2'b01:2'b00;
   assign ForwardBE = (RtE==WriteRegM)?2'b10:(RtE==WriteRegW)?2'b01:2'b00;
   
assign StallF=((RsD==WriteRegE|RtD==WriteRegE)&MemtoRegE)?1'b1:(PCSrcD==1&(countreg==2'b00|countreg==2'b01))?1'b1:1'b0;
assign StallD=((RsD==WriteRegE|RtD==WriteRegE)&MemtoRegE)?1'b1:(PCSrcD==1&(countreg==2'b00|countreg==2'b01|countreg==2'b10))?1'b1:1'b0;
assign FlushE=((RsD==WriteRegE|RtD==WriteRegE)&MemtoRegE)?1'b1:(PCSrcD==1&(countreg==2'b00|countreg==2'b01|countreg==2'b10))?1'b1:1'b0;
   
initial
countreg=2'b00;
	
always @(posedge clk)
	begin
		case(countreg)
		2'b00:if(PCSrcD==1)countreg<=2'b01;
		2'b01:if(PCSrcD==1)countreg<=2'b10;
		2'b10:if(PCSrcD==1)countreg<=2'b11;
		2'b11:if(PCSrcD==1)countreg<=2'b00;
		endcase
	end
	
endmodule // HazardUnit
