module PISO
(
input clk,reset,
input [0:3]Data,
input Load_Shift,
output 	Q
);
reg [0:3]Data_reg;

always@(posedge clk , negedge reset)
begin
if(!reset)
Data_reg<=4'b0000;
else if (Load_Shift ==1)
Data_reg<=Data;
else if (Load_Shift == 0)
begin
 Data_reg[3]<=Data_reg[2];
 Data_reg[2]<=Data_reg[1];
 Data_reg[1]<=Data_reg[0];
 Data_reg[0]<=1'b0;
end
end
assign Q=Data_reg[3];

endmodule