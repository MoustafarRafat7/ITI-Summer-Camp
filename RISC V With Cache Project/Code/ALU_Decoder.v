module ALU_Decoder
(
   input wire [1:0]ALUOp,
   input wire [2:0]funct3,
   input wire funct7,
   input wire op5,
   output reg [2:0]ALUControl
);
wire [1:0]signal ={op5,funct7};

always@(*)
begin
case(ALUOp)
2'b00:ALUControl=3'b000;
2'b01:ALUControl=3'b001;
2'b10:
begin
      case(funct3)
      3'b000:begin 
 		case(signal)
		2'b11:ALUControl=3'b001;
		default:ALUControl=3'b000;
		endcase
	     end
      3'b010:ALUControl=3'b101;
      3'b110:ALUControl=3'b011;
      3'b111:ALUControl=3'b010;
      default:ALUControl=3'b000;
      endcase
end
default:ALUControl=3'b000;
endcase
end
endmodule
