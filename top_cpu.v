`timescale 1ns / 1ps

module top_cpu #(parameter WIDTH=32)
   (
  input 	     clk,
  output 	     PCSrcD,
  output [WIDTH-1:0] PCPlus4F,
  output [WIDTH-1:0] PCBranchD,
  output [WIDTH-1:0] PC_,
  output [WIDTH-1:0] PCF,
  output [WIDTH-1:0] InstrD,
  output [WIDTH-1:0] PCPlus4D,
  output 	     RegWriteD,
  output 	     MemtoRegD,
  output 	     MemWriteD,
  output [3:0] 	     ALUControlD,
  output 	     ALUSrcD,
  output 	     ALUSrcNoExD,
  output 	     RegDstD,
  output 	     BranchED,
  output 	     BranchNED,
  output [WIDTH-1:0] RD1,
  output [WIDTH-1:0] RD2,
  output [WIDTH-1:0] RD1D,
  output [WIDTH-1:0] RD2D,
  output [WIDTH-1:0] SignImmD,
  output [WIDTH-1:0] NoSignImmD,
  output [WIDTH-1:0] SignImmLS2D,
  output 	     RegWriteE,
  output 	     MemtoRegE,
  output 	     MemWriteE,
  output [3:0] 	     ALUControlE,
  output 	     ALUSrcE,
  output 	     ALUSrcNoExE,
  output 	     RegDstE,
  output [WIDTH-1:0] RD1E,
  output [WIDTH-1:0] RD2E,
  output [4:0] 	     RsE,
  output [4:0] 	     RtE,
  output [4:0] 	     RdE,
  output [WIDTH-1:0] SignImmE,
  output [WIDTH-1:0] NoSignImmE,
  output [WIDTH-1:0] SrcAE,
  output [WIDTH-1:0] SrcBE,
  output [WIDTH-1:0] WriteDataE,
  output [4:0] 	     WriteRegE,
  output [WIDTH-1:0] ALUOutE,
  output 	     RegWriteM,
  output 	     MemtoRegM,
  output 	     MemWriteM,
  output [WIDTH-1:0] ALUOutM,
  output [WIDTH-1:0] WriteDataM,
  output [4:0] 	     WriteRegM,
  output 	     RegWriteW,
  output 	     MemtoRegW,
  output [WIDTH-1:0] ReadDataW,
  output [WIDTH-1:0] ALUOutW,
  output [4:0] 	     WriteRegW,
  output [WIDTH-1:0] ResultW,

  output 	     StallF,
  output 	     StallD,
  output 	     ForwardAD,
  output 	     ForwardBD,
  output 	     FlushE,
  output [1:0] 	     ForwardAE,
  output [1:0] 	     ForwardBE,
  output 	     Branch2RegD,
  output 	     Branch2ValueD,
  output [WIDTH-1:0] PCBranch	  
  );
   /*AUTOWIRE*/
   
   MUXPC MUXPC( /*AUTOINST*/
	       // Outputs
	       .PC_			(PC_[WIDTH-1:0]),
	       // Inputs
	       .PCPlus4F		(PCPlus4F[WIDTH-1:0]),
	       .PCBranchD		(PCBranchD[WIDTH-1:0]),
	       .PCSrcD			(PCSrcD));
   
   Buffer1 Buffer1(.EN_			(StallF),
		   /*AUTOINST*/
		   // Outputs
		   .PCF			(PCF[WIDTH-1:0]),
		   // Inputs
		   .PC_			(PC_[WIDTH-1:0]),
		   .clk			(clk));
		   
   
   InstructionMemoryRAM InstructionMemoryRAM(.en_		(StallD),
     					     .CLR		(PCSrcD),
     					     .addr		(PCF[7:0]),
					     /*AUTOINST*/
					     // Outputs
					     .InstrD		(InstrD[WIDTH-1:0]),
					     // Inputs
					     .clk		(clk));
   
   ADD4PC ADD4PC(/*AUTOINST*/
		 // Outputs
		 .PCPlus4F		(PCPlus4F[WIDTH-1:0]),
		 // Inputs
		 .PCF			(PCF[WIDTH-1:0]));
   
   Buffer2 Buffer2(.CLR			(PCSrcD),
   		   .EN_			(StallD),
		   /*AUTOINST*/
		   // Outputs
		   .PCPlus4D		(PCPlus4D[WIDTH-1:0]),
		   // Inputs
		   .PCPlus4F		(PCPlus4F[WIDTH-1:0]),
		   .clk			(clk));
   
   ControlUnit ControlUnit( .Op			(InstrD[31:26]),
			   .Funct		(InstrD[5:0]),
			   /*AUTOINST*/
			   // Outputs
			   .RegWriteD		(RegWriteD),
			   .MemtoRegD		(MemtoRegD),
			   .MemWriteD		(MemWriteD),
			   .ALUControlD		(ALUControlD[3:0]),
			   .ALUSrcD		(ALUSrcD),
			   .ALUSrcNoExD		(ALUSrcNoExD),
			   .RegDstD		(RegDstD),
			   .BranchED		(BranchED),
			   .BranchNED		(BranchNED),
			   .Branch2RegD		(Branch2RegD),
			   .Branch2ValueD	(Branch2ValueD));
   
   Brancher Brancher(/*AUTOINST*/
		     // Outputs
		     .PCSrcD		(PCSrcD),
		     // Inputs
		     .BranchED		(BranchED),
		     .BranchNED		(BranchNED),
		     .Branch2RegD	(Branch2RegD),
		     .Branch2ValueD	(Branch2ValueD),
		     .RD1D		(RD1D[WIDTH-1:0]),
		     .RD2D		(RD2D[WIDTH-1:0]));
   
   RegForwardD RegForwardD(/*AUTOINST*/
			   // Outputs
			   .RD1D		(RD1D[WIDTH-1:0]),
			   .RD2D		(RD2D[WIDTH-1:0]),
			   // Inputs
			   .ForwardAD		(ForwardAD),
			   .ForwardBD		(ForwardBD),
			   .ALUOutM		(ALUOutM[WIDTH-1:0]),
			   .RD1			(RD1[WIDTH-1:0]),
			   .RD2			(RD2[WIDTH-1:0]));
   
   RegisterFile RegisterFile(.WE3		(RegWriteW),
			     .A1		(InstrD[25:21]),
			     .A2		(InstrD[20:16]),
			     .A3		(WriteRegW[4:0]),
     			     .WD3		(ResultW[WIDTH-1:0]),
			     /*AUTOINST*/
			     // Outputs
			     .RD1		(RD1[WIDTH-1:0]),
			     .RD2		(RD2[WIDTH-1:0]),
			     // Inputs
			     .clk		(clk));
			    
   
   SignExtend SignExtend(.out			(SignImmD[WIDTH-1:0]),
			 .in			(InstrD[15:0]));
   
   NoSignExtend NoSignExtend(.out		(NoSignImmD[WIDTH-1:0]),
		       	     .in		(InstrD[15:0]));
   
   LeftShift2 LeftShift2(/*AUTOINST*/
			 // Outputs
			 .SignImmLS2D		(SignImmLS2D[WIDTH-1:0]),
			 // Inputs
			 .SignImmD		(SignImmD[WIDTH-1:0]));
   
   AdderPCOffset AdderPCOffset(/*AUTOINST*/
			       // Outputs
			       .PCBranch	(PCBranch[WIDTH-1:0]),
			       // Inputs
			       .SignImmLS2D	(SignImmLS2D[WIDTH-1:0]),
			       .PCPlus4D	(PCPlus4D[WIDTH-1:0]));

   BranchMux BranchMux(/*AUTOINST*/
		       // Outputs
		       .PCBranchD	(PCBranchD[WIDTH-1:0]),
		       // Inputs
		       .PCBranch	(PCBranch[WIDTH-1:0]),
		       .RD1D		(RD1D[WIDTH-1:0]),
		       .InstrD		(InstrD[25:0]),
		       .BranchED	(BranchED),
		       .BranchNED	(BranchNED),
		       .Branch2RegD	(Branch2RegD),
		       .Branch2ValueD	(Branch2ValueD));
   
   Buffer3 Buffer3(.CLR			(FlushE),
		   .RsD			(InstrD[25:21]),
		   .RtD			(InstrD[20:16]),
		   .RdD			(InstrD[15:11]),
		   /*AUTOINST*/
		   // Outputs
		   .RegWriteE		(RegWriteE),
		   .MemtoRegE		(MemtoRegE),
		   .MemWriteE		(MemWriteE),
		   .ALUSrcE		(ALUSrcE),
		   .ALUSrcNoExE		(ALUSrcNoExE),
		   .RegDstE		(RegDstE),
		   .ALUControlE		(ALUControlE[3:0]),
		   .RD1E		(RD1E[WIDTH-1:0]),
		   .RD2E		(RD2E[WIDTH-1:0]),
		   .RsE			(RsE[4:0]),
		   .RtE			(RtE[4:0]),
		   .RdE			(RdE[4:0]),
		   .SignImmE		(SignImmE[WIDTH-1:0]),
		   .NoSignImmE		(NoSignImmE[WIDTH-1:0]),
		   // Inputs
		   .RegWriteD		(RegWriteD),
		   .MemtoRegD		(MemtoRegD),
		   .MemWriteD		(MemWriteD),
		   .ALUSrcD		(ALUSrcD),
		   .ALUSrcNoExD		(ALUSrcNoExD),
		   .RegDstD		(RegDstD),
		   .ALUControlD		(ALUControlD[3:0]),
		   .RD1D		(RD1D[WIDTH-1:0]),
		   .RD2D		(RD2D[WIDTH-1:0]),
		   .SignImmD		(SignImmD[WIDTH-1:0]),
		   .NoSignImmD		(NoSignImmD[WIDTH-1:0]),
		   .clk			(clk));
   
   MUXDst MuxDst(/*AUTOINST*/
		 // Outputs
		 .WriteRegE		(WriteRegE[4:0]),
		 // Inputs
		 .RtE			(RtE[4:0]),
		 .RdE			(RdE[4:0]),
		 .RegDstE		(RegDstE));
   
   MUXA1 MuxA1(/*AUTOINST*/
	       // Outputs
	       .SrcAE			(SrcAE[WIDTH-1:0]),
	       // Inputs
	       .RD1E			(RD1E[WIDTH-1:0]),
	       .ResultW			(ResultW[WIDTH-1:0]),
	       .ALUOutM			(ALUOutM[WIDTH-1:0]),
	       .ForwardAE		(ForwardAE[1:0]));
   
   MUXB1 MuxB1(/*AUTOINST*/
	       // Outputs
	       .WriteDataE		(WriteDataE[WIDTH-1:0]),
	       // Inputs
	       .RD2E			(RD2E[WIDTH-1:0]),
	       .ResultW			(ResultW[WIDTH-1:0]),
	       .ALUOutM			(ALUOutM[WIDTH-1:0]),
	       .ForwardBE		(ForwardBE[1:0]));
   
   MUXB2 MuxB2(/*AUTOINST*/
	       // Outputs
	       .SrcBE			(SrcBE[WIDTH-1:0]),
	       // Inputs
	       .WriteDataE		(WriteDataE[WIDTH-1:0]),
	       .SignImmE		(SignImmE[WIDTH-1:0]),
	       .NoSignImmE		(NoSignImmE[WIDTH-1:0]),
	       .ALUSrcE			(ALUSrcE),
	       .ALUSrcNoExE		(ALUSrcNoExE));
   
   ALU ALU(/*AUTOINST*/
	   // Outputs
	   .ALUOutE			(ALUOutE[WIDTH-1:0]),
	   // Inputs
	   .SrcAE			(SrcAE[WIDTH-1:0]),
	   .SrcBE			(SrcBE[WIDTH-1:0]),
	   .ALUControlE			(ALUControlE[3:0]));
   
   Buffer4 Buffer4(/*AUTOINST*/
		   // Outputs
		   .RegWriteM		(RegWriteM),
		   .MemtoRegM		(MemtoRegM),
		   .MemWriteM		(MemWriteM),
		   .ALUOutM		(ALUOutM[WIDTH-1:0]),
		   .WriteDataM		(WriteDataM[WIDTH-1:0]),
		   .WriteRegM		(WriteRegM[4:0]),
		   // Inputs
		   .RegWriteE		(RegWriteE),
		   .MemtoRegE		(MemtoRegE),
		   .MemWriteE		(MemWriteE),
		   .ALUOutE		(ALUOutE[WIDTH-1:0]),
		   .WriteDataE		(WriteDataE[WIDTH-1:0]),
		   .WriteRegE		(WriteRegE[4:0]),
		   .clk			(clk));
   
   DataMemoryRAM DataMemoryRAM(.RD		(ReadDataW[WIDTH-1:0]),
			       .clk		(clk),
			       .en		(1'b1),
			       .WE		(MemWriteM),
			       .addr		(ALUOutM[7:0]),
			       .writedata	(WriteDataM[WIDTH-1:0]));
   
   Buffer5 Buffer5(/*AUTOINST*/
		   // Outputs
		   .RegWriteW		(RegWriteW),
		   .MemtoRegW		(MemtoRegW),
		   .ALUOutW		(ALUOutW[WIDTH-1:0]),
		   .WriteRegW		(WriteRegW[4:0]),
		   // Inputs
		   .RegWriteM		(RegWriteM),
		   .MemtoRegM		(MemtoRegM),
		   .ALUOutM		(ALUOutM[WIDTH-1:0]),
		   .WriteRegM		(WriteRegM[4:0]),
		   .clk			(clk));
   
   MUXResult MUXResult(/*AUTOINST*/
		       // Outputs
		       .ResultW		(ResultW[WIDTH-1:0]),
		       // Inputs
		       .ALUOutW		(ALUOutW[WIDTH-1:0]),
		       .ReadDataW	(ReadDataW[WIDTH-1:0]),
		       .MemtoRegW	(MemtoRegW));
   
   HazardUnit HazardUnit( .RsD			(InstrD[25:21]),
			  .RtD			(InstrD[20:16]),
			 /*AUTOINST*/
			 // Outputs
			 .StallF		(StallF),
			 .StallD		(StallD),
			 .ForwardAD		(ForwardAD),
			 .ForwardBD		(ForwardBD),
			 .FlushE		(FlushE),
			 .ForwardAE		(ForwardAE[1:0]),
			 .ForwardBE		(ForwardBE[1:0]),
			 // Inputs
			 .clk			(clk),
			 .RsE			(RsE[4:0]),
			 .RtE			(RtE[4:0]),
			 .WriteRegE		(WriteRegE[4:0]),
			 .MemtoRegE		(MemtoRegE),
			 .RegWriteE		(RegWriteE),
			 .WriteRegM		(WriteRegM[4:0]),
			 .MemtoRegM		(MemtoRegM),
			 .RegWriteM		(RegWriteM),
			 .WriteRegW		(WriteRegW[4:0]),
			 .RegWriteW		(RegWriteW),
			 .PCSrcD		(PCSrcD));
endmodule // top_cpu
