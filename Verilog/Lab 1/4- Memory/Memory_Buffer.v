module Memory_Buffer
(
    input clk,reset,en_w,en_r,
    input [2:0] address,
    input [7:0]data_in,
    output reg Empty_Flag,Full_Flag,
    output reg[7:0]data_out
);

reg [7:0] RAM [0:7];
reg [2:0] write_pointer;
reg [7:0] check;
reg Check_full;
reg Check_empty;
integer i;

always@(posedge clk,posedge reset)

begin
if(reset)
begin
Empty_Flag<=1'b1;
Full_Flag<=1'b0;
data_out<=0;
write_pointer<=0;
check<=0;
for(i=0;i<8;i=i+1)
begin
RAM[i]<=0;
end
end

else if(en_w && !en_r && !Full_Flag)
begin
RAM[address]<=data_in;
write_pointer<=write_pointer+1;
Empty_Flag<=1'b0;
check[address]<=1'b1;
end

else if(!en_w && en_r && !Empty_Flag)
data_out<=RAM[address];

end
  

always@(*)
begin
Check_full=&check;
Check_empty=|check;
if(write_pointer == 0 && Check_full )
begin
Full_Flag=1'b1;
Empty_Flag=1'b0;
end

else if(write_pointer == 0  && !Check_empty)
begin
Full_Flag=1'b0;
Empty_Flag=1'b1;
end

else
begin
Full_Flag=0;
Empty_Flag=0;
end

end


endmodule
