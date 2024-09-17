module Lint_Module (clk,check,Data_in1,Data_in2,Data_in3,Data_out1,Data_out2,Data_Out2,Data_out3,Data_out3_1,Data_out3_2,Data_Out1,Data_Out2_1,Data_Out1_1,Data_Out1_2,reset);

//--------------- Design Inputs ---------------
input wire clk;
input wire check ;
input wire [1:0] Data_in1;
input wire [2:0] Data_in2;
input wire [3:0] Data_in3;
input wire reset; //in rtl enhanced  asynchronous reset should added to overcome this problem 


//--------------- Design Outputs ---------------
output reg  [1:0] Data_out1;
output reg  [1:0] Data_Out1_1; //multiple assign
output reg  [1:0] Data_Out1_2;
output wire [2:0] Data_out2;
//output wire [1:0] Data1;
//output wire [2:0] Data2;
//output wire [3:0] Data3;
output reg  [2:0] Data_Out2;
output reg  [2:0] Data_Out2_1; //multiple assign
output reg  [3:0] Data_out3;
output reg  [1:0] Data_Out1; // Data_Out1 is added to line 84 
output reg  [3:0] Data_out3_1 ; //multi driven output
output reg  [3:0] Data_out3_2 ; //multi driven output


//------------- Internal Wires -----------
wire [1:0] Inernal_wire1 ;
wire [2:0] Inernal_wire2 ;
wire [3:0] Inernal_wire3 ; 

//------------- Internal Reg -----------
reg [1:0] Inernal_reg1 ;
reg [2:0] Inernal_reg2 ;
reg [3:0] Inernal_reg3 ; 


always @(posedge clk , negedge reset)
begin 
if(!reset)
begin
Inernal_reg1 <= 0       ;
Inernal_reg2 <= 0       ;
Inernal_reg3 <= 0       ;
end 
else
begin
Inernal_reg1 <= Data_in1;
Inernal_reg2 <= Data_in2;
Inernal_reg3 <= Data_in3; 
end

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

always @( posedge clk, negedge reset)
begin 
if(!reset)
begin
Data_out3_1 <= 0 ; 
Data_Out2_1 <= 0 ;
end
else
begin
Data_out3_1 <= Data_in3 & Data_out3 ; 
Data_Out2_1 <= Data_Out2 & Data_in2 ;
end 
end
 


//--------------- Inferred Latches -------------------- //
always @( posedge clk , negedge reset)
begin 
if(!reset)
begin
Data_out1<=0;
end
else if (check)
begin 
Data_out1 <= Data_in1 & Inernal_reg1;
end
else
 Data_out1<=0;
end


always @(*)
begin 
case(Data_in1) 
2'b00: Data_out3 = Data_in3 & Inernal_reg3 ;
2'b01: Data_out3 = Inernal_reg3 ;
default:Data_out3=4'b0;  //  default added to solve inferred latch
endcase  
end 


//--------------- Multi-Driven Signals -------------------- //
always @(posedge clk , negedge reset)
begin 
if(!reset)
begin
Data_Out1_1 <= 0;
Data_Out1 <= 0;
Data_Out2 <=0;
end
else
begin
Data_Out1_1 <= Data_in1 & Inernal_reg1; 
Data_Out1 <= Data_in1 | Inernal_reg1; //Data_Out1 to get rid of Multi-Driven Signals
Data_Out2 <= Data_in2 | Inernal_reg2; //Data_Out2 to get rid of Multi-Driven Signals
end 
end

assign Data_out2 = Data_in2 & Inernal_reg2;



//--------------- Width Mismatches -------------------- //

assign Inernal_wire1 = Data_in1 ;
assign Inernal_wire2 = Data_in2 ;
assign Inernal_wire3 = Data_in3 ;
 
//assign Data1=Data_in1 ;
//assign Data2=Data_in2 ;
//assign Data3 =Data_in3 ;
 
//--------------- Blocking -NonBlocking -------------------- //
always @(posedge clk  , negedge reset)
begin 
if(!reset)
begin
Data_Out1_2 <= 0;
Data_out3_2 <=0;
end
else
begin
Data_Out1_2 <= Data_in1 | Inernal_reg1;
Data_out3_2 <= Data_in3 |  Inernal_reg3; // sequential circuit so we use non-blocking assignment
end 
end

endmodule
