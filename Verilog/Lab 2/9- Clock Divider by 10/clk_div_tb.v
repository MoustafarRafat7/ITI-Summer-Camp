module clk_div_tb();
reg clk,rst_n;
wire Clk_out;

localparam T=20;
clk_div  clk_div(.clk(clk),.rst_n(rst_n),.Ck_out(Clk_out));

always
begin
clk=1'b1;
#(T/2);
clk=1'b0;
#(T/2);
end

initial 
begin
rst_n=0;
#T
rst_n=1;
#T;
end

endmodule 

