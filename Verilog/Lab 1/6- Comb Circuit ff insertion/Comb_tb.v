module Comb_tb
( 
);
reg A,B,C;
wire D,F;

Comb dut(.A(A),.B(B),.C(C),.D(D),.F(F));
initial
begin
A=1;
B=1;
C=0;
#5
A=1;
B=1;
C=1;
#5
A=1;
B=0;
C=1;
#5;
end

endmodule
