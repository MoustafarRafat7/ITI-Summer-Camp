module UART_FSM (
input 	wire 				CLK,
input 	wire 				RST,
input	wire				Ser_Done,
input 	wire 				Data_Valid,
input	wire				Par_En,
output	reg		[1:0]		Mux_Sel,
output 	reg	 				Ser_En,
output  reg					Busy
	);

parameter [2:0] Idle   = 3'b000;
parameter [2:0] Start  = 3'b001;
parameter [2:0] Data   = 3'b010;
parameter [2:0] Parity = 3'b011;
parameter [2:0] Stop   = 3'b100;

reg [2:0] Current_State, Next_State;
reg Busy_Comp;

//Next State Logic
always @(*) begin
	case (Current_State)
		Idle: begin
				if (Data_Valid)
						Next_State = Start;
					else 
						Next_State = Idle;
			end
		Start: begin
						Next_State = Data;
			end		
		Data: begin
				if (Ser_Done) begin
					if (Par_En)
						Next_State = Parity;
						else 
						Next_State = Stop;
					end
					else begin 
						Next_State = Data;
				end
			end
		Parity: begin
						Next_State = Stop;
			end
		Stop: begin
						Next_State = Idle;
			end
		default: begin
						Next_State = Idle;
		end
	endcase
end


//Outpue Logic
always @(*) begin
	case (Current_State)
		Idle: begin
				Mux_Sel = 2'b01;
				Ser_En  = 1'b0;
				Busy_Comp = 1'b0;
			end
		Start: begin
				Mux_Sel = 2'b00;
				Ser_En  = 1'b0;
				Busy_Comp = 1'b1;
			end		
		Data: begin
				Mux_Sel = 2'b10;
				Busy_Comp = 1'b1;
				if (Ser_Done) begin
					Ser_En = 1'b0;
				end
				else begin
					Ser_En = 1'b1;
				end
		end
		Parity: begin
				Ser_En  = 1'b0;
				Mux_Sel = 2'b11;
				Busy_Comp = 1'b1;
		end
		Stop: begin
				Ser_En  = 1'b0;
				Mux_Sel = 2'b01;
				Busy_Comp = 1'b1;
		end
		default: begin
				Mux_Sel = 2'b01;
				Ser_En  = 1'b0;
				Busy_Comp = 1'b0;
		end
	endcase
end

always @ (posedge CLK or negedge RST) begin
	if (!RST) begin
		Busy <= 1'b0;
		Current_State <= Idle;
	end
	else begin
	    Busy <= Busy_Comp;
	    Current_State <= Next_State;
	end
end
  
endmodule
