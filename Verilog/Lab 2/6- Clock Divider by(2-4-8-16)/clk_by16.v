module Clk_by16
(
input clk,reset,D,
output clk_by2,clk_by4,clk_by8,clk_by16
);

Clk_2 clk_2(.reset(reset),.clk(clk),.clk_by2(clk_by2));
Clk_2 clk_4(.reset(reset),.clk(clk_by2),.clk_by2(clk_by4));
Clk_2 clk_8(.reset(reset),.clk(clk_by4),.clk_by2(clk_by8));
Clk_2 clk_16(.reset(reset),.clk(clk_by8),.clk_by2(clk_by16));
endmodule
