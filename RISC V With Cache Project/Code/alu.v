module ALU 
(
input [31:0] SrcA, 
input [31:0] SrcB, 
input [2:0] ALUControl, 
output reg [31:0] ALUResult, 
output wire Zero
); 

always@(*)

begin

case (ALUControl)
3'b000:ALUResult = SrcA + SrcB;
3'b001:ALUResult = SrcA - SrcB;
3'b010:ALUResult = SrcA & SrcB;
3'b011:ALUResult = SrcA | SrcB;
3'b101:ALUResult =(SrcA < SrcB);
default:ALUResult=32'b0;

endcase

end

assign Zero = (ALUResult == 0);

endmodule