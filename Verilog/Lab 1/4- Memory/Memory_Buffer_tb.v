module Memory_Buffer_tb
();
reg[7:0]data_in;
reg clk,reset,en_w,en_r;
wire[7:0]data_out;
reg [2:0]address;
wire Empty_Flag,Full_Flag;

Memory_Buffer memory(.data_in(data_in),.address(address),.clk(clk),.reset(reset),.en_w(en_w),.en_r(en_r)
        ,.data_out(data_out),.Empty_Flag(Empty_Flag),.Full_Flag(Full_Flag));
localparam T=10;
integer i;
always
begin
clk=1'b1;
#(T/2);
clk=1'b0;
#(T/2);
end

initial

begin
reset=1;
en_r=0;
en_w=0;
#10
en_w=1;
reset=0;
for(i=0;i<8;i=i+1)
begin
data_in=i+1;
address=i;
#10;
end
en_r=1;
en_w=0;
address=3;
#10
address=7;
#10
address=2;
#10
reset=1'b1;
#10
en_r=0;
en_w=1;
reset=0;
for(i=0;i<8;i=i+1)
begin
data_in=i+1;
address=0;
#10;
end
end
endmodule
