module Mux4_1
(
input [31:0]input1,input2,input3,
input [1:0]selector,
output reg [31:0]out
);
always@(input1,input2,input3,selector)
begin
case(selector)
2'b00:out=input1;
2'b01:out=input2;
2'b10:out=input3;
default:out=32'b0;
endcase

end

endmodule