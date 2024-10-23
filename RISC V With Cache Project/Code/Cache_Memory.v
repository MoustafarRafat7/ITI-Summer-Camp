module Cache_Memory
(
input clk,reset,
input CacheRead,CacheWrite,
input hit_miss,ready,
input [9:0]Word_Address,
input [127:0]Data_In,
output reg[31:0]Data_Out,
output [2:0]tag,
output valid
);

reg [128:0] Cache [0:31];
reg [1:0] counter=0;
integer i=0;
assign valid = Cache[Word_Address[6:2]][128];
assign tag = Word_Address[9:7];

always@(posedge clk , negedge reset)
begin
  if(!reset)
begin 
 for(i=0;i<32;i=i+1)
  begin
  Cache[i][128]<=0;
  end
counter<=0;  
end
  else 
begin
if(ready)
counter<=0;
  if(CacheWrite == 1 && hit_miss == 0 && CacheRead == 0)
  begin
  if(counter ==2'b11)
   counter <= 0;	
  else
   counter<=counter+1;
  end
   else if(CacheWrite == 1 && hit_miss == 1 && CacheRead == 0)
  begin
  case(Word_Address[1:0])
	2'b00:Cache[Word_Address[6:2]][31:0]<=Data_In[31:0];	
	2'b01:Cache[Word_Address[6:2]][63:32]<=Data_In[31:0];	
	2'b10:Cache[Word_Address[6:2]][95:64]<=Data_In[31:0];	
	2'b11:Cache[Word_Address[6:2]][127:96]<=Data_In[31:0];	
  endcase
  Cache[Word_Address[6:2]][128]<=1'b1;
  if(counter ==2'b11)
   counter <= 0;
  else
   counter<=counter+1;
  end

else if(CacheRead == 1 && hit_miss == 0 && CacheWrite == 0 && ready == 1'b1)
  begin
	Cache[Word_Address[6:2]][127:0]<=Data_In;	
  Cache[Word_Address[6:2]][128]<=1;
  if(counter ==2'b11)
   counter <= 0;
  else
   counter<=counter+1;
  end

end
end


always@(*)
begin
if(CacheRead == 1 && hit_miss == 1  && CacheWrite == 0)
  begin
  case(Word_Address[1:0])
	2'b00:Data_Out=Cache[Word_Address[6:2]][31:0];
	2'b01:Data_Out=Cache[Word_Address[6:2]][63:32];	
	2'b10:Data_Out=Cache[Word_Address[6:2]][95:64];	
	2'b11:Data_Out=Cache[Word_Address[6:2]][127:96];	
  endcase  
end  


end

endmodule


