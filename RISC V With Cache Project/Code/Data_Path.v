module Data_Path 
(
input clk, 
input reset, 
input [31:0] Instruction, 
input [31:0] Read_Data , 
input RegWrite, 
input [1:0] ImmSrc, 
input ALUSrc, 
input [2:0] ALUControl, 
input [1:0] ResultSrc, 
input PCSrc, 
input stall,
output  [31:0] PC, 
output  [31:0] ALUResult, 
output  [31:0] WriteData, 
output  Zero
); 

wire [31:0]PCNext,PCTarget,PCPlus4;
wire [31:0]Result;
wire [31:0]ImmExt ;
wire [31:0]SrcA,SrcB;

Mux Mux_Alu_SrcB(.input1(WriteData),.input2(ImmExt),.selector(ALUSrc),.out(SrcB));
Mux Mux_PC(.input1(PCPlus4),.input2(PCTarget),.selector(PCSrc),.out(PCNext));
Mux4_1 Mux_Result(.input1(ALUResult),.input2(Read_Data),.input3(PCPlus4),.selector(ResultSrc),.out(Result));

Program_Counter program_counter(.PCNext(PCNext),.enable(~stall),.clk(clk),.reset(reset),.PC(PC));
Register_File Reg_File(.A1(Instruction[19:15]),.A2((Instruction[24:20])),.A3(Instruction[11:7]),.clk(clk),.WE3(RegWrite),.WD3(Result),.RD1(SrcA),.RD2(WriteData));
Sign_Extend Sign_Extension(.instruction(Instruction[31:7]),.ImmSrc(ImmSrc),.ImmExt(ImmExt));
ALU  alu(.SrcA(SrcA),.SrcB(SrcB),.ALUControl(ALUControl),.ALUResult(ALUResult),.Zero(Zero)); 
Adder adder_PC_Target(.input1(PC),.input2(ImmExt),.out(PCTarget));
Adder adder_PC_Plus4(.input1(PC),.input2(32'd4),.out(PCPlus4));


endmodule