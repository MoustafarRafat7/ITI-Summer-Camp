`include "Parity_Calc.v"
`include "Serializer.v"
`include "UART_FSM.v"
`include "UART_MUX.v"
`define Width 8
module UART_TX_TOP 
(
input 	wire  [`Width-1 :0]	P_DATA,
input	wire				CLK,
input	wire				RST,
input	wire				Par_En,
input	wire				Par_Type,
input	wire				Data_Valid,
output	wire				TX_Out,
output	wire				Busy
	);

wire Ser_Data, Ser_En, Ser_Done, Parity;
wire [1:0] Mux_Sel;

// Serializer instantiation 
Serializer U0 (
	.P_DATA(P_DATA),
	.CLK(CLK),
	.RST(RST),
	.Data_Valid(Data_Valid),
	.Ser_Data(Ser_Data),
	.Ser_En(Ser_En),
	.Ser_Done(Ser_Done)
	);

// Parity Calculator instantiation 
Parity_Calc U1 (
	.P_DATA(P_DATA),
	.CLK(CLK),
	.RST(RST),
	.Data_Valid(Data_Valid),
	.Par_En(Par_En),
	.Par_Type(Par_Type),
	.Parity(Parity)
	);

// FSM instantiation 
UART_FSM U2 (
	.CLK(CLK),
	.RST(RST),
	.Data_Valid(Data_Valid),
	.Par_En(Par_En),
	.Busy(Busy),
	.Mux_Sel(Mux_Sel),
	.Ser_En(Ser_En),
	.Ser_Done(Ser_Done)
	);

// Mux instantiation 
UART_MUX U3 (
	.CLK(CLK),
	.RST(RST),
	.TX_Out(TX_Out),
	.Mux_Sel(Mux_Sel),
	.Parity(Parity),
	.Ser_Data(Ser_Data)
	);

endmodule
