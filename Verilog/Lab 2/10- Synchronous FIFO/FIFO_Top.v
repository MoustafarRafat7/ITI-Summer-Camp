//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/20/2024 12:39:04 PM
// Design Name: 
// Module Name: FIFO_Top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FIFO_Top
#(parameter Width=32,Address=3)
    (
    input clk,
    input reset,
    input Write,
    input Read,
    input [Width-1:0] Write_Data,
    output [Width-1:0] Read_Data,
    output Full,
    output Empty
    );
wire [Address-1:0]Write_Address,Read_Address;

FIFO #(.Width(Width),.Address(Address)) Fifo(.clk(clk),.Wr_en(Write & ~Full),.Write_Data(Write_Data)
                                   ,.Write_Address(Write_Address),.Read_Address(Read_Address)
                                   ,.Read_Data(Read_Data));
                
FIFO_Control #(.Address(Address))  Controller (.clk(clk),.reset(reset),.Write(Write),.Read(Read)
                                               ,.Write_Address(Write_Address),.Read_Address(Read_Address)
                                              ,.Full(Full),.Empty(Empty));

endmodule
