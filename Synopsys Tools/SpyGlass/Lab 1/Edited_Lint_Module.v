
module Lint_Module (clk,check,Data_in1,Data_in2,Data_in3,Data_out1,Data_out2,Data_out3,Data_Out1);

//--------------- Design Inputs ---------------
input wire clk;
input wire check ;
input wire [1:0] Data_in1;
input wire [2:0] Data_in2;
input wire [3:0] Data_in3;


//--------------- Design Outputs ---------------
output reg  [1:0] Data_out1;
output wire [2:0] Data_out2;
output reg [2:0] Data_Out2;
output reg  [3:0] Data_out3;
output reg  [1:0] Data_Out1; // Data_Out1 is added to line 84 


//------------- Internal Wires -----------
wire [1:0] Inernal_wire1 ;
wire [2:0] Inernal_wire2 ;
wire [3:0] Inernal_wire3 ; 

//------------- Internal Reg -----------
reg [1:0] Inernal_reg1 ;
reg [2:0] Inernal_reg2 ;
reg [3:0] Inernal_reg3 ; 


always @(posedge clk)
begin 
Inernal_reg1 <= Data_in1;
Inernal_reg2 <= Data_in2;
Inernal_reg3 <= Data_in3;
end 
//--------------- Design Implementation ---------------

/*
	always @(posedge clk,negedge rst_n) begin
		if(!rst_n) begin

			//---- Reset Condition ----

		end
		else begin

			//---- Non-reset Condition ----

		end

	end
*/ 

//--------------- Combinational Loops ------------------ //

always @( posedge clk )
begin 
Data_out3 <= Data_in3 & Data_out3 ; 
Data_Out2 <= Data_Out2 & Data_in2 ;
end 
 


//--------------- Inferred Latches -------------------- //
always @( posedge clk )
begin 
if (check)
begin 
Data_out1 <= Data_in1 & Inernal_reg1;
end 
end

always @(*)
begin 
case(Data_in1) 
2'b00: Data_out3 = Data_in3 & Inernal_reg3 ;
2'b01: Data_out3 = Inernal_reg3 ;
default:Data_out3=4'b0;  // to solve inferred latch
endcase  
end 


//--------------- Multi-Driven Signals -------------------- //
always @(posedge clk)
begin 
Data_out1 <= Data_in1 & Inernal_reg1; 
Data_Out1 <= Data_in1 | Inernal_reg1; //Data_Out1 to get rid of Multi-Driven Signals
end 

assign Data_out2 = Data_in2 & Inernal_reg2;
assign Data_out2 = Data_in2 | Inernal_reg2;


//--------------- Width Mismatches -------------------- //

assign Inernal_wire1 = Data_in2  ;
assign Inernal_wire2 = Data_in3 ;
assign Inernal_wire3 = Data_in1 ;
 
 
//--------------- Blocking -NonBlocking -------------------- //
always @(posedge clk )
begin 
Data_out1 <= Data_in1 | Inernal_reg1;
Data_out3 <= Data_in3 |  Inernal_reg3; // sequential circuit so we use non-blocking assignment
end 

endmodule
