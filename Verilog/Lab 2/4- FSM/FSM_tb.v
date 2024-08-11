module FSM_tb();

wire predict;
reg  taken,clk,reset;

localparam T=10;
FSM fsm(.reset(reset),.clk(clk),.predict(predict),.taken(taken));

always
begin
clk=1'b0;
#(T/2);
clk=1'b1;
#(T/2);
end

initial
begin
reset=1'b1;
#3
reset=1'b0;
taken=1'b0;
#5
taken=1'b0;
#10
taken=1'b1;
#10
taken=1'b1;
#10
reset=1'b1;
#2
taken=1'b1;
#10;
end
endmodule