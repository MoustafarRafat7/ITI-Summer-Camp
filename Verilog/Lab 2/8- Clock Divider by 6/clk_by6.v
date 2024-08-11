module ff(
input clk,reset,D,
output reg Q
);
always@(posedge clk ,negedge reset)
begin
if(!reset)
Q<=0;
else
Q<=D;
end
endmodule


module clk_by6(
input clk,reset,D,
output clk_by6
);
wire [2:0]Q;

ff ff0(.clk(clk),.reset(reset),.D(~Q[2]),.Q(Q[0]));
ff ff1(.clk(clk),.reset(reset),.D(Q[0]),.Q(Q[1]));
ff ff2(.clk(clk),.reset(reset),.D(Q[1]),.Q(Q[2]));
assign 	clk_by6=Q[2];
endmodule