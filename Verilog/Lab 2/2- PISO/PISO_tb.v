module PISO_tb
();
reg clk,reset;
reg [3:0]Data;
reg Load_Shift;
wire 	Q;

localparam T=10;

PISO piso(.clk(clk),.reset(reset),.Data(Data),.Load_Shift(Load_Shift),.Q(Q));


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
Data=4'b1011;
Load_Shift=1;
#(T)
Load_Shift=0;
#(5*T)
Data=4'b1100;
Load_Shift=1;
#(T)
Load_Shift=0;
#(5*T)
Data=4'b1111;
Load_Shift=1;
#(T)
Load_Shift=0;
#(5*T);
end
endmodule
