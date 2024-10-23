module Main_Memory
(
input clk,
input [31:0]Data_In,
input [9:0]Word_Address,
input MemWrite,MemRead,
output [127:0]Read_Data,
output reg ready
);

reg [31:0] Memory[0:1023];
reg [2:0]counter=0;
always@(posedge clk)
begin
ready<=1'b0;
	if(MemWrite == 1 && MemRead == 0 )
	  begin
	     Memory[Word_Address]<=Data_In;	  
	 if(counter == 3'b100)
	    begin
	     counter<=0;
	     ready<=1'b1;
	    end
	  else
	   counter <= counter +1;	
	end
	else if (MemWrite == 0 && MemRead == 1)
	  begin
	   if(counter == 3'b100)
	    begin
	     counter<=0;
	     ready<=1'b1;
            end
	  else
	  counter <= counter +1;
 	end	
end

	assign Read_Data[31:0]=Memory[{Word_Address[9:2],2'b00}];
	assign Read_Data[63:32]=Memory[{Word_Address[9:2],2'b01}];
	assign Read_Data[95:64]=Memory[{Word_Address[9:2],2'b10}];
	assign Read_Data[127:96]=Memory[{Word_Address[9:2],2'b11}];


endmodule


