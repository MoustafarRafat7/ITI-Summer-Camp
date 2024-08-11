module clk_by3
(
input clk,reset,
output reg clk_out
);
reg [1:0]counter=0;
always@(clk,reset)
begin
if(!reset)
begin
clk_out<=0;
counter<=0;
end
else if(counter == 3)
begin
counter<=0;
clk_out<=~clk_out;
end
else
counter<=counter+1;
end
endmodule

