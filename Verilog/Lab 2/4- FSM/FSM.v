module FSM
(
input taken,
input clk,
input reset,
output reg predict
);

reg[1:0] next_state ,state_reg;


always@(posedge clk,posedge reset)
begin
if(reset)
state_reg<=2'b00;
else
state_reg<=next_state;
end


always@(*)
begin
case(state_reg)
2'b00:predict=1'b1;
2'b01:predict=1'b1;
2'b10:predict=1'b0;
2'b11:predict=1'b0;
default:predict=1'b0;
endcase
end

always@(*)
begin
case(state_reg)
2'b00:

begin
if(taken)
next_state=2'b00;
else
next_state=2'b01;
end

2'b01:

begin
if(taken)
next_state=2'b00;
else
next_state=2'b10;
end

2'b10:

begin
if(taken)
next_state=2'b11;
else
next_state=2'b10;
end

2'b11:

begin
if(taken)
next_state=2'b00;
else
next_state=2'b10;
end

default:next_state=2'b00;
endcase

end
endmodule
