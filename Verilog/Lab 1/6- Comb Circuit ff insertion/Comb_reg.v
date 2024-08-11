module Comb_reg

( input A,B,C,
  input clk,reset,
  output reg D,F
);
reg w0,w1;
wire w2;
assign w2=A&~w0;

always@(posedge clk)

begin

if(reset)
begin
D<=1'b0;
F<=1'b0;
w0<=1'b0;
w1<=1'b0;
end
else
begin
w0<=C^B;
w1<=C&~B;
D<= A^w0;
F<= w1|w2;
end

end
endmodule
