module Program_Counter
(
input [31:0]PCNext,
input clk,
input enable,
input reset,
output reg [31:0]PC
);

always@(posedge clk, negedge reset)
begin
if(!reset)
PC<=32'b0;
else if(enable)
PC<=PCNext;
else if (!enable)
PC<=PC;
end
endmodule