module Control_Unit
(
input [6:0]Opcode,
input [2:0]funct3,
input funct7,
input zero,
output [2:0]ALUControl,
output [1:0]ImmSrc,
output  RegWrite,
output  ALUSrc,
output  MemWrite,
output MemRead,
output  [1:0]ResultSrc,
output Branch,
output Jump,
output PCSrc
);
wire [1:0]ALUOp;

ALU_Decoder decoder (.funct3(funct3),.funct7(funct7),.op5(Opcode[5]),.ALUControl(ALUControl),.ALUOp(ALUOp));

Main_Decoder dec(.Opcode(Opcode),.ALUOp(ALUOp),.ImmSrc(ImmSrc),.RegWrite(RegWrite),.ALUSrc(ALUSrc),.MemWrite(MemWrite)
 		,.MemRead(MemRead),.ResultSrc(ResultSrc),.Branch(Branch),.Jump(Jump));
assign PCSrc = Jump | ( Branch&zero) ;
endmodule
