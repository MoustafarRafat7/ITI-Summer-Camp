module Decoder3_8
(input En,
input [2:0]s,
output reg[0:7]D
);
wire [3:0]code;
assign code={s,En};
always@(*)
begin
D=0;
case(code)
4'b0000:D=0;
4'b0001:D[7]=1'b1;
4'b0011:D[6]=1'b1;
4'b0101:D[5]=1'b1;
4'b0111:D[4]=1'b1;
4'b1001:D[3]=1'b1;
4'b1011:D[2]=1'b1;
4'b1101:D[1]=1'b1;
4'b1111:D[0]=1'b1;
default:D=0;
endcase
end
endmodule
