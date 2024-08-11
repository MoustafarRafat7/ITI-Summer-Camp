module Comb
( input A,B,C,
  output D,F
);
wire w0,w1,w2;
assign w0=C^B;
assign w1=C&~B;
assign w2=A&~w0;
assign D= A^w0;
assign F= w1|w2;
endmodule
