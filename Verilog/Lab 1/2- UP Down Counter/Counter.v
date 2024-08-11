module Counter
#(parameter n=4)
(
input clk,
input reset,
input mode,
output reg [n-1:0]q
);

// Sequential //
always@(posedge clk,posedge reset)
begin
if(reset)
q=0;
else if(!reset && mode)
q =q+1;
else
q =q-1;
end

endmodule


