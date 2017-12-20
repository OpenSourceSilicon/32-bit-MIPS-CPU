`timescale 1ns / 1ps

module Buffer1 #(parameter WIDTH=32)
   (
    input [WIDTH-1:0]  PC_,
    input 	       clk,
    input 	       EN_, 
    output reg [WIDTH-1:0] PCF
    );

   initial
     PCF=0;
   
   always @(posedge clk)
	if(~EN_)
	  PCF<=PC_;
	
endmodule // Buffer1
