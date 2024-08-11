module SIPO_tb();
reg clk,reset;
reg Data;
reg Load_Shift;
wire [3:0]Q;

localparam T=10;

SIPO sipo(.clk(clk),.reset(reset),.Data(Data),.Load_Shift(Load_Shift),.Q(Q));


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
#T
reset=1;
Data=1'b1;
Load_Shift=1;
#(T)
Load_Shift=0;
#(4*T)
Data=1'b0;
Load_Shift=1;
#(T)
Load_Shift=0;
#(4*T)
Data=1'b1;
Load_Shift=1;
#(T)
Load_Shift=0;
#(5*T);
end
endmodule