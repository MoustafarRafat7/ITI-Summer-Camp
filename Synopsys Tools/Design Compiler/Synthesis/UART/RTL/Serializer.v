`define Width  8
module Serializer 
(
input 	wire [`Width-1 :0]	P_DATA,
input 	wire 				CLK,
input 	wire 				RST,
input 	wire 				Ser_En,
input 	wire 				Data_Valid,
output	wire				Ser_Data, 
output	wire				Ser_Done
	);


reg [`Width-1 :0] Valid_Data;
reg [2 : 0] Ser_Counter;

always @(posedge CLK or negedge RST) begin
	if (!RST) begin
		// reset
		Valid_Data <= 'b0;
	end
	else if (Data_Valid) begin
		Valid_Data <= P_DATA;
	end
	else if (Ser_En) begin
		Valid_Data <= Valid_Data >> 1;
	end
end

always @(posedge CLK or negedge RST) begin
	if (!RST) begin
		// reset
		Ser_Counter <= 'b0;
	end
	else if (Ser_En) begin
		Ser_Counter <= Ser_Counter + 'b1;
	end
	else begin
		Ser_Counter <= 'b0;
	end
end

assign Ser_Done = (Ser_Counter == 'b111)? 1'b1 : 1'b0 ;
assign Ser_Data  = Valid_Data [0];

endmodule
