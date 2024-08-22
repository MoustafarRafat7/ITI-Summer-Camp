module FIFO_Control
#(parameter Address=3)
    (
    input clk,
    input reset,
    input Write,
    input Read,
    output [Address-1:0] Write_Address,
    output [Address-1:0] Read_Address,
    output reg Full,
    output reg Empty
    );
reg [Address-1:0]Write_ptr,Write_ptr_next;    
reg [Address-1:0]Read_ptr,Read_ptr_next;
reg Full_next,Empty_next;
always@(posedge clk , negedge reset)
begin

if(!reset)
begin
Full<=1'b0;
Empty<=1'b1;
Write_ptr<=0;
Read_ptr<=0;
end
else
begin
Write_ptr<=Write_ptr_next;
Read_ptr<=Read_ptr_next;
Full<=Full_next;
Empty<=Empty_next;
end

end

always@(*)
begin
// default 
Full_next=Full;
Empty_next=Empty;
Write_ptr_next=Write_ptr;
Read_ptr_next=Read_ptr;
case({Write,Read})
2'b10://Write
    begin
    if(!Full)
     Write_ptr_next=Write_ptr+1;
     Empty_next=1'b0;
     if(Write_ptr_next == Read_ptr)
        begin
            Full_next=1'b1;
        end
    end
2'b01://Read
        begin
        if(!Empty)
         Read_ptr_next=Read_ptr+1;
         Full_next=1'b0;
         if(Read_ptr_next == Write_ptr)
            begin
                Empty_next=1'b1;
            end
        end

2'b11://Read & Write
        begin
        if(Empty)
        begin
            Read_ptr_next=Read_ptr;
            Write_ptr_next=Write_ptr;
        end 
         else
         begin
            Write_ptr_next=Write_ptr+1;
            Read_ptr_next=Read_ptr+1;
         end
        
        end
default:
begin
        Full_next=Full;
        Empty_next=Empty;
        Write_ptr_next=Write_ptr;
        Read_ptr_next=Read_ptr;        
end
endcase
end
assign Write_Address=Write_ptr;
assign Read_Address=Read_ptr;
endmodule
