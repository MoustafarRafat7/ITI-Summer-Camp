module CDC_Module (clkA,clkB,rstA,rstB,Data_in1,Data_out1);

//--------------- Design Inputs ---------------
input wire clkA,clkB;
input wire rstA,rstB;
input wire [1:0] Data_in1;

//--------------- Design Outputs ---------------
output reg [1:0] Data_out1;

//--------------- Internal Reg ---------------
reg [1:0] Internal_Reg;



//--------------- Design Implementation ---------------

	always@(posedge clkA ,negedge reset ) begin
		if(!rstA) begin

			//---- Reset Condition ----
			Internal_Reg <=2'b0;
		end
		else begin

			//---- Non-reset Condition ----
			Internal_Reg <=Data_in1;
		end

	end


	always@(posedge clkB ,negedge reset ) begin
		if(!rstB) begin

			//---- Reset Condition ----
			Data_out1 <=2'b00;
		end
		else begin

			//---- Non-reset Condition ----
			Data_out1 <=Internal_Reg;
		end

	end
endmodule