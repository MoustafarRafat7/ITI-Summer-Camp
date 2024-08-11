module Sequence_Detector_tb();

reg x,clk,reset;
wire out;

localparam T=10;
Sequence_Detector SD(.clk(clk),.x(x),.reset(reset),.out(out));

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
x=1;
#10
x=0;
#10
x=1;
#10
x=1;
#10
x=0;
#10
x=1;
#10
x=0;
#10
x=1;
#10;
end

endmodule