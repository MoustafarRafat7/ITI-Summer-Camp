module Comb_reg_tb
( 
);
reg A,B,C;
wire D,F;
reg clk,reset; 
localparam T=10;
Comb_reg dut(.A(A),.B(B),.C(C),.D(D),.F(F),.reset(reset),.clk(clk));

always
begin
clk=1'b1;
#(T/2);
clk=1'b0;
#(T/2);
end

initial
begin
reset=1'b1;
#10
reset=1'b0;
A=1;
B=1;
C=0;
#10
A=1;
B=1;
C=1;
#10
A=1;
B=0;
C=1;
#10;
end

endmodule
