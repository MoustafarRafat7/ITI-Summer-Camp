module ALU_tb
();
reg clk;
reg [3:0]Opcode;
reg [3:0]OperandA,OperandB;
wire [5:0]Result;

ALU alu(.clk(clk),.Opcode(Opcode),.OperandA(OperandA),.OperandB(OperandB),.Result(Result));

localparam T=10;

always
begin
clk=1'b1;
#(T/2)
clk=1'b0;
#(T/2);
end

initial
begin
OperandA=3'b101;
OperandB=3'b001;
Opcode=4'b0000;
#5
Opcode=4'b0100;
#5
Opcode=4'b1000;
#5
Opcode=4'b1100;
#5
Opcode=4'b0001;
#5
Opcode=4'b0010;
#5;
end

endmodule
