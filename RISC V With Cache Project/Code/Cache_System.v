module Cache_System
(
input clk,reset,
input MemWrite,MemRead,
input [9:0]Word_Address,
input [31:0]Data_In,
output [31:0]Data_Out,
output stall
);
wire hit_miss;
wire  MemoryWrite,MemoryRead;
wire CacheRead,CacheWrite;
wire [127:0]Memory_Data;
wire [127:0]Data_to_Cache;
wire ready;
wire [2:0]tag;
wire valid;



Main_Memory Data_Memory(.clk(clk),.Data_In(Data_In),.Word_Address(Word_Address),.MemWrite(MemoryWrite)
	       ,.MemRead(MemoryRead),.Read_Data(Memory_Data),.ready(ready) );

Cache_Memory Cache_memory(.clk(clk),.reset(reset),.CacheRead(CacheRead),.CacheWrite(CacheWrite),.hit_miss(hit_miss)
			 ,.Word_Address(Word_Address),.Data_In(Data_to_Cache )
			 ,.Data_Out(Data_Out),.tag(tag),.valid(valid),.ready(ready));

Cache_Controller cache_controller(.clk(clk),.reset(reset),.Word_Address(Word_Address),.MemWrite(MemWrite),.MemRead(MemRead)
		,.valid(valid),.tag(tag),.ready(ready),.CacheRead(CacheRead),.CacheWrite(CacheWrite)
		,.MemoryWrite(MemoryWrite),.MemoryRead(MemoryRead),.stall(stall),.hit_miss(hit_miss));

Mux #(.n(128)) mux(.input2({96'b0,Data_In}),.input1(Memory_Data),.selector(hit_miss),.out(Data_to_Cache));

endmodule
