module UART_MUX(
input 	wire 		CLK,
input 	wire 		RST,
input 	wire [1:0]	Mux_Sel,
input 	wire		Ser_Data,
input   wire		Parity,
output	reg 		TX_Out
	);

parameter Start_bit = 1'b0;
parameter Stop_bit  = 1'b1;
reg Mux_Out;

always @(*) begin
	case (Mux_Sel)
		2'b00: begin
			Mux_Out = Start_bit;
		end
		2'b01: begin
			Mux_Out = Stop_bit;
		end
		2'b10: begin
			Mux_Out = Ser_Data;
		end
		2'b11: begin
			Mux_Out = Parity;
		end
	endcase
end

always @(posedge CLK or negedge RST) begin
	if (!RST) begin
		// reset
		TX_Out <= 1'b1;
	end
	else begin
		TX_Out <= Mux_Out;
	end
end

endmodule
