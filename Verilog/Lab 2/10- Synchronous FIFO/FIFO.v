module FIFO
#(parameter Width=32 ,Address=3) 
    (
    input clk,
    input Wr_en,
    input [Width-1:0]Write_Data,
    input [Address-1:0] Write_Address,
    input [Address-1:0] Read_Address,
    output reg[Width-1:0]Read_Data
    );
    
reg [Width-1:0]Mem[0:2**Address-1];

always@(posedge clk)
begin
if(Wr_en)
begin
Mem[Write_Address]<=Write_Data;
end
Read_Data<=Mem[Read_Address];
end   
endmodule
