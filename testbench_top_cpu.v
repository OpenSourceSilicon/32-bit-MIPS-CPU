`timescale 1ns / 1ps

module testbench_top_cpu;

	// Inputs
	reg clk;

	// Outputs
	wire PCSrcD;
	wire [31:0] PCPlus4F;
	wire [31:0] PCBranch;
	wire [31:0] PCBranchD;
	wire [31:0] PC_;
	wire [31:0] PCF;
	wire [31:0] InstrD;
	wire [31:0] PCPlus4D;
	wire RegWriteD;
	wire MemtoRegD;
	wire MemWriteD;
	wire [3:0] ALUControlD;
	wire ALUSrcD;
	wire ALUSrcNoExD;
	wire RegDstD;
	wire BranchED;
	wire BranchNED;
	wire Branch2RegD;
	wire Branch2ValueD;
	wire [31:0] RD1;
	wire [31:0] RD2;
	wire [31:0] RD1D;
	wire [31:0] RD2D;
	wire [31:0] SignImmD;
	wire [31:0] NoSignImmD;
	wire [31:0] SignImmLS2D;
	wire RegWriteE;
	wire MemtoRegE;
	wire MemWriteE;
	wire [3:0] ALUControlE;
	wire ALUSrcE;
	wire ALUSrcNoExE;
	wire RegDstE;
	wire [31:0] RD1E;
	wire [31:0] RD2E;
	wire [4:0] RsE;
	wire [4:0] RtE;
	wire [4:0] RdE;
	wire [31:0] SignImmE;
	wire [31:0] NoSignImmE;
	wire [31:0] SrcAE;
	wire [31:0] SrcBE;
	wire [31:0] WriteDataE;
	wire [4:0] WriteRegE;
	wire [31:0] ALUOutE;
	wire RegWriteM;
	wire MemtoRegM;
	wire MemWriteM;
	wire [31:0] ALUOutM;
	wire [31:0] WriteDataM;
	wire [4:0] WriteRegM;
	wire RegWriteW;
	wire MemtoRegW;
	wire [31:0] ReadDataW;
	wire [31:0] ALUOutW;
	wire [4:0] WriteRegW;
	wire [31:0] ResultW;
	wire StallF;
	wire StallD;
	wire ForwardAD;
	wire ForwardBD;
	wire ForwardADN1;
	wire ForwardBDN1;
	wire ForwardADN2;
	wire ForwardBDN2;
	wire FlushE;
	wire [1:0] ForwardAE;
	wire [1:0] ForwardBE;

	// Instantiate the Unit Under Test (UUT)
	top_cpu uut (
		.clk(clk), 
		.PCSrcD(PCSrcD), 
		.PCPlus4F(PCPlus4F),
		.PCBranch(PCBranch),
		.PCBranchD(PCBranchD), 
		.PC_(PC_), 
		.PCF(PCF), 
		.InstrD(InstrD), 
		.PCPlus4D(PCPlus4D), 
		.RegWriteD(RegWriteD), 
		.MemtoRegD(MemtoRegD), 
		.MemWriteD(MemWriteD), 
		.ALUControlD(ALUControlD), 
		.ALUSrcD(ALUSrcD), 
		.ALUSrcNoExD(ALUSrcNoExD), 
		.RegDstD(RegDstD), 
		.BranchED(BranchED), 
		.BranchNED(BranchNED), 
		.Branch2RegD(Branch2RegD),
		.Branch2ValueD(Branch2ValueD),
		.RD1(RD1), 
		.RD2(RD2), 
		.RD1D(RD1D), 
		.RD2D(RD2D), 
		.SignImmD(SignImmD), 
		.NoSignImmD(NoSignImmD), 
		.SignImmLS2D(SignImmLS2D), 
		.RegWriteE(RegWriteE), 
		.MemtoRegE(MemtoRegE), 
		.MemWriteE(MemWriteE), 
		.ALUControlE(ALUControlE), 
		.ALUSrcE(ALUSrcE), 
		.ALUSrcNoExE(ALUSrcNoExE), 
		.RegDstE(RegDstE), 
		.RD1E(RD1E), 
		.RD2E(RD2E), 
		.RsE(RsE), 
		.RtE(RtE), 
		.RdE(RdE), 
		.SignImmE(SignImmE), 
		.NoSignImmE(NoSignImmE), 
		.SrcAE(SrcAE), 
		.SrcBE(SrcBE), 
		.WriteDataE(WriteDataE), 
		.WriteRegE(WriteRegE), 
		.ALUOutE(ALUOutE), 
		.RegWriteM(RegWriteM), 
		.MemtoRegM(MemtoRegM), 
		.MemWriteM(MemWriteM), 
		.ALUOutM(ALUOutM), 
		.WriteDataM(WriteDataM), 
		.WriteRegM(WriteRegM), 
		.RegWriteW(RegWriteW), 
		.MemtoRegW(MemtoRegW), 
		.ReadDataW(ReadDataW), 
		.ALUOutW(ALUOutW), 
		.WriteRegW(WriteRegW), 
		.ResultW(ResultW), 
		.StallF(StallF), 
		.StallD(StallD), 
		.ForwardAD(ForwardAD), 
		.ForwardBD(ForwardBD), 
		.ForwardADN1(ForwardADN1),
		.ForwardBDN1(ForwardBDN1),
		.ForwardADN2(ForwardADN2),
		.ForwardBDN2(ForwardBDN2),
		.FlushE(FlushE), 
		.ForwardAE(ForwardAE), 
		.ForwardBE(ForwardBE)
	);

	initial begin
		// Initialize Inputs
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here...

	end
	
 always
	begin
		#10;
		clk=~clk;
	end
	
endmodule

 
