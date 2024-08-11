`timescale 1ns/1ps
module Counter_tb
#(parameter n=8)
();
reg clk;
reg reset;
reg mode;
wire [n-1:0]q;
Counter #(.n(n))counter(.clk(clk),.mode(mode),.reset(reset),.q(q));
localparam T=10;
always
begin
clk=1'b1;
#(T/2)
clk=1'b0;
#(T/2);
end

initial
begin
reset=1'b1;
#2
reset=1'b0;
mode=1'b1;
#100
mode=1'b0;
#100;
end
endmodule
