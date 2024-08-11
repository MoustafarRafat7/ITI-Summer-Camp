module Clk_2
(
input clk,reset,

output clk_by2
);
reg q;
always@(posedge clk , negedge reset)
begin
if(!reset)
q<=0;
else
q<=~q;
end
assign clk_by2=q;
endmodule