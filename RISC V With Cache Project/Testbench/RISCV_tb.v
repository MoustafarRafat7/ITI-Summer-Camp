module RISCV_tb
();

reg clk;
reg reset;
localparam T =2;

RISCV_Integratedwith_Cache RiscV(.clk(clk),.reset(reset));

always
begin
clk=1'b1;
#(T/2);
clk=1'b0;
#(T/2);
end

initial 
begin
reset=0;
#1
reset=1;
#10;

end
endmodule

