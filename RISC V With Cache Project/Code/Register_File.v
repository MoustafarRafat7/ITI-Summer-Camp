module Register_File
(
input [4:0]A1,A2,A3,
input clk,
input WE3,
input [31:0]WD3,
output [31:0]RD1,RD2
);

reg [31:0] Reg_File [0:31];
integer i;
initial
begin
for (i=0;i<32;i=i+1)
Reg_File[i]=32'b0;
end

always@(posedge clk)
begin
if(WE3)
Reg_File[A3]<=WD3;
else
Reg_File[A3]<=Reg_File[A3];
end

assign RD1=Reg_File[A1];
assign RD2=Reg_File[A2];

endmodule