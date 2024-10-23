module Main_Decoder
(
  input [6:0]Opcode,
  output reg [1:0]ALUOp,
  output reg [1:0]ImmSrc,
  output reg RegWrite,
  output reg ALUSrc,
  output reg MemWrite,
  output reg MemRead,
  output reg [1:0]ResultSrc,
  output reg Branch,
  output reg Jump
);

always@(Opcode)
begin
case(Opcode)
7'b0000011:begin
RegWrite=1'b1;
ImmSrc=2'b00;
ALUSrc=1'b1;
MemWrite=1'b0;
MemRead=1'b1;
ResultSrc=2'b01;
Branch=0;
ALUOp=2'b00;
Jump=1'b0;
end
7'b0100011:
begin
RegWrite=1'b0;
ImmSrc=2'b01;
ALUSrc=1'b1;
MemWrite=1'b1;
MemRead=1'b0;	
ResultSrc=2'b00;
Branch=0;
ALUOp=2'b00;
Jump=1'b0;
end

7'b0110011:
begin
RegWrite=1'b1;
ImmSrc=2'b00;
ALUSrc=1'b0;
MemWrite=1'b0;	
MemRead=1'b0;	
ResultSrc=2'b00;
Branch=0;
ALUOp=2'b10;
Jump=1'b0;
end

7'b1100011:
begin
RegWrite=1'b0;
ImmSrc=2'b10;
ALUSrc=1'b0;
MemWrite=1'b0;	
MemRead=1'b0;	
ResultSrc=2'b00;
Branch=1'b1;
ALUOp=2'b01;
Jump=1'b0;
end

7'b0010011:
begin
RegWrite=1'b1;
ImmSrc=2'b00;
ALUSrc=1'b1;
MemWrite=1'b0;	
MemRead=1'b0;	
ResultSrc=2'b00;
Branch=1'b0;
ALUOp=2'b10;
Jump=1'b0;
end

7'b1101111:
begin
RegWrite=1'b1;
ImmSrc=2'b11;
ALUSrc=1'b0;
MemWrite=1'b0;	
MemRead=1'b0;	
ResultSrc=2'b10;
Branch=1'b0;
ALUOp=2'b00;
Jump=1'b1;
end

default:
begin
RegWrite=1'b0;
ImmSrc=2'b00;
ALUSrc=1'b0;
MemWrite=1'b0;	
MemRead=1'b0;	
ResultSrc=2'b00;
Branch=1'b0;
ALUOp=2'b00;
Jump=1'b0;
end
endcase

end
endmodule