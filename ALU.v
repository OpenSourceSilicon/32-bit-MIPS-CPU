`timescale 1ns / 1ps

module ALU #(parameter WIDTH=32)
   (
    input [WIDTH-1:0]  SrcAE,
    input [WIDTH-1:0]  SrcBE,
    input [3:0]        ALUControlE,
    output [WIDTH-1:0] ALUOutE
    );

   
    assign ALUOutE =(ALUControlE==4'h1)? SrcAE+SrcBE:
                    (ALUControlE==4'h2)? SrcAE&SrcBE:
                    (ALUControlE==4'h3)? SrcAE|SrcBE:
                    (ALUControlE==4'h4)? SrcAE-SrcBE:
                    (ALUControlE==4'h5)? SrcAE^SrcBE:
                    (ALUControlE==4'h6)? SrcAE<<(SrcBE%8):
                    (ALUControlE==4'h7)? SrcAE==SrcBE:
                    (ALUControlE==4'h8)? SrcAE!=SrcBE:
                    (ALUControlE==4'h9)? SrcAE>>(SrcBE%8):
                    (ALUControlE==4'ha)? SrcAE<=SrcBE:
                    (ALUControlE==4'hb)? SrcAE<SrcBE:
                    (ALUControlE==4'hc)? {{32{SrcAE[31]}},SrcAE[31:0]}>>>SrcBE:
						  (ALUControlE==4'hd)? SrcBE<<16:
		    0;
  
endmodule // ALU
