module ALU
(
input [2:0]OperandA,OperandB,
input clk,
input [3:0]Opcode,
output reg [5:0]Result
);
always@(posedge clk)
begin
case(Opcode)
4'b0000:Result<=OperandA+OperandB;
4'b0001:Result<=OperandA-OperandB;
4'b0010:Result<=OperandA*OperandB;
4'b0011:Result<=OperandA&OperandB;
4'b0100:Result<=OperandA|OperandB;
4'b0101:Result<=OperandA^OperandB;
4'b0110:Result<=OperandA &~ OperandB;
4'b0111:Result<=OperandA |~ OperandB;
4'b1000:Result<=OperandA ~^ OperandB;
4'b1001:Result<=OperandA << OperandB;
4'b1010:Result<=OperandA >> OperandB;
4'b1011:Result<={OperandA,OperandB};
4'b1100:Result<=OperandA ~^ OperandB;
default:Result<=0;
endcase

end

endmodule

