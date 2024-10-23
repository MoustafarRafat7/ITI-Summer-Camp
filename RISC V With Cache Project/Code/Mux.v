module Mux 
#(parameter n=32)
(
input [n-1:0] input1, 
input [n-1:0] input2, 
input selector,
output reg [n-1:0] out
); 

always@(*)
begin
case(selector)
1'b0:out=input1;
1'b1:out=input2;
default:out=32'b0;
endcase
end
endmodule