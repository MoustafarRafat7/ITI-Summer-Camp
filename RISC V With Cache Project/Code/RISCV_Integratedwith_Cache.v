module RISCV_Integratedwith_Cache
(
input clk,reset
);
wire [31:0]PC;
wire [31:0] Instruction;
wire [31:0] Read_Data;
wire [31:0]ALUResult;
wire [31:0] WriteData;
wire Zero;
wire [2:0]ALUControl;
wire [1:0]ImmSrc;
wire  RegWrite;
wire  ALUSrc;
wire  MemWrite;
wire MemRead;
wire [1:0]ResultSrc;
wire Branch;
wire Jump;
wire PCSrc;
wire stall;

Control_Unit CU(.Opcode( Instruction[6:0] ),.funct3( Instruction[14:12] ),.funct7( Instruction[30] ),.zero(Zero),.ALUControl(ALUControl),
		.ImmSrc(ImmSrc),.RegWrite(RegWrite),.ALUSrc(ALUSrc),.MemWrite(MemWrite),.MemRead(MemRead)
	       ,.ResultSrc(ResultSrc),.Branch(Branch),.Jump(Jump),.PCSrc(PCSrc));

Data_Path DP(.clk(clk),.reset(reset),.Instruction(Instruction),.Read_Data(Read_Data),.RegWrite(RegWrite)
	    ,.ImmSrc(ImmSrc),.ALUSrc(ALUSrc),.ALUControl(ALUControl),.ResultSrc(ResultSrc),.PCSrc(PCSrc)
	    ,.PC(PC),.ALUResult(ALUResult),.WriteData(WriteData),.Zero(Zero),.stall(stall));

Instruction_Memory istruction_memory(.Instruction_address(PC[9:2]),.RD(Instruction));


Cache_System cache_system (.clk(clk),.reset(reset),.MemWrite(MemWrite),.MemRead(MemRead),.Word_Address(ALUResult[9:0])
			  ,.Data_In(WriteData),.Data_Out(Read_Data),.stall(stall));


endmodule
