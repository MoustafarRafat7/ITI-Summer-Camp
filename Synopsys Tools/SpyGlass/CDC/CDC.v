module CDC_Module (clkA,clkB,rstA,rstB,Data_in1,Data_out1);

//--------------- Design Inputs ---------------
input wire clkA,clkB;
input wire rstA,rstB;
input wire  Data_in1;

//--------------- Design Outputs ---------------
output reg  Data_out1;

//--------------- Internal Reg ---------------
reg  Internal_Reg;
reg  internal_reg1;
reg  internal_reg2;



//--------------- Design Implementation ---------------

	always@(posedge clkA , posedge rstA) begin
		if(rstA) begin

			//---- Reset Condition ----
			Internal_Reg <=1'b0;
		end
		else begin

			//---- Non-reset Condition ----
			Internal_Reg <=Data_in1;
		end

	end


	always@(posedge clkB ,posedge rstB) begin
		if(rstB) begin

			//---- Reset Condition ----
			internal_reg1 <=1'b0;
		end
		else begin

			//---- Non-reset Condition ----
			internal_reg1 <=Internal_Reg;

			
		end
	end
	
	always@(posedge clkB ,posedge rstB) begin
		if(rstB) begin

			//---- Reset Condition ----
			internal_reg2 <=1'b0;
		end
		else begin

			//---- Non-reset Condition ----
			internal_reg2 <=internal_reg1;
		end
	

	end
	always@(posedge clkB ,posedge rstB) begin
		if(rstB) begin

			//---- Reset Condition ----
			Data_out1 <=1'b0;
		end
		else begin

			//---- Non-reset Condition ----
			Data_out1 <=internal_reg2;
		end

	end
endmodule
