`timescale 1ns / 1ps

module Buffer2 #(parameter WIDTH=32)
   (
    input [WIDTH-1:0] 	       PCPlus4F,
    input 			       EN_,
    input                  clk,
    input 			       CLR, 
    output reg [WIDTH-1:0] 	       PCPlus4D
    );

   initial
     begin
	PCPlus4D=0;
     end
   
   always @(posedge clk)
	if(~EN_)
	  begin
	     if(CLR)
	     PCPlus4D<=0;
	     else
	     PCPlus4D<=PCPlus4F;
	  end
	
endmodule // Buffer2
