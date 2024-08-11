// clock divider by 10
module clk_div(
input clk,rst_n,
output reg Ck_out 
);

reg [2:0] count ;
always@(posedge clk or negedge rst_n)
begin 
if(!rst_n) begin 
Ck_out <= 1'b0;
count <=0;
end 
else 
begin 
if(count == 4)
begin 
Ck_out <=~Ck_out;
count <= 0;
end
else 
count <= count+1;

end 

end 

endmodule
