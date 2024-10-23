module Cache_Controller
(
input clk,reset,
input [9:0]Word_Address,
input MemWrite,MemRead,
input [2:0]tag,
input valid,
input ready,

output reg CacheRead,CacheWrite,
output reg MemoryWrite,MemoryRead,
output reg stall,
output hit_miss
);

localparam IDLE=2'b00;
localparam Write=2'b01;
localparam Read=2'b10;

reg [1:0] Current_State,Next_State;

assign hit_miss= ( Word_Address[9:7] == tag) & (valid ==1'b1);

always@(negedge clk,negedge reset)
begin
if(!reset)
begin
Current_State<=IDLE;
Next_State<=IDLE;
stall<=0;
end
else
begin
Current_State <= Next_State;
end
end

always@(*)
begin
case(Current_State)
IDLE:
    begin
     if(MemWrite == 1 && MemRead == 0)	
	Next_State=Write; 
     else if(MemWrite == 0 && MemRead == 1)	
	Next_State=Read;
     else
        Next_State=IDLE; 
    end
Write:
    begin
     if(MemWrite == 1 && MemRead == 0)	
	Next_State=Write; 
     else if(MemWrite == 0 && MemRead == 1)	
	Next_State=Read;
     else
        Next_State=IDLE; 
    end

Read:
    begin
     if(MemWrite == 1 && MemRead == 0)	
	Next_State=Write; 
     else if(MemWrite == 0 && MemRead == 1)	
	Next_State=Read;
     else
        Next_State=IDLE; 
    end

endcase

end

always@(*)
begin
case(Current_State)
IDLE:
	begin
	 CacheRead=0;
	MemoryRead=0;
	CacheWrite =0;
	MemoryWrite=0;
	end
Write:
	begin
	CacheRead=0;
	MemoryRead=0;
	CacheWrite =1;
	MemoryWrite=1;
	end
 
Read:
	begin
	 if(hit_miss == 1 )
 	      begin
		CacheWrite =0;
		MemoryWrite=0;
		CacheRead=1;
		MemoryRead=0;
	      end
	else
	      begin
		CacheWrite =0;
		MemoryWrite=0;
		CacheRead=1;
		MemoryRead=1;
	      end
       
 	end


endcase

end

always@(negedge clk)
begin
case(Current_State)
IDLE:
	begin
	 stall<=0;
	end
Write:
	begin
		stall<=1;
		if(ready ==1)
		stall<=0;
	
	end
 
Read:
	begin
	 if(hit_miss == 1 )
 	      begin
		stall<=0;
	      end
	else
	      begin
		
		stall<=1;

		if(ready ==1)
		stall<=0;
	      end
       
 	end


endcase
end


endmodule
