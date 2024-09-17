`define Width 8
module Parity_Calc 
(
input 	wire [`Width-1 :0]	P_DATA,
input 	wire 				CLK,
input 	wire 				RST,
input 	wire 				Par_En,
input 	wire				Par_Type,
input 	wire 				Data_Valid,
output	reg					Parity
	);

reg [`Width-1 :0] Valid_Data;

always @(posedge CLK or negedge RST) begin
	if (!RST) begin
		// reset
		Valid_Data <= 'b0;
	end
	else if (Data_Valid) begin
		Valid_Data <= P_DATA;
	end
end

always @(posedge CLK or negedge RST) begin
	if (!RST) begin
		// reset
		Parity <= 'b0;
	end
	else if (Par_En) begin
		case (Par_Type) 
			1'b0: begin 
				Parity <= ^Valid_Data ; 
				end
			1'b1: begin 
				Parity <= ~^Valid_Data;
				end
		endcase
	end
end


endmodule
