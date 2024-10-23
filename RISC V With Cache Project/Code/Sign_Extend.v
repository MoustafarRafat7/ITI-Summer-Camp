module Sign_Extend
(
input [31:7]instruction,
input [1:0] ImmSrc,
output reg [31:0]ImmExt 
);

always@(instruction,ImmSrc)
begin
case(ImmSrc)
2'b00:ImmExt={{20{instruction[31]}}, instruction[31:20]};
2'b01:ImmExt={{20{instruction[31]}}, instruction[31:25], instruction[11:7]};
2'b10:ImmExt={{20{instruction[31]}}, instruction[7], instruction[30:25], instruction[11:8], 1'b0};
2'b11:ImmExt={{12{instruction[31]}}, instruction[19:12], instruction[20], instruction[30:21], 1'b0};
default:ImmExt=32'b0;
endcase
end
endmodule
