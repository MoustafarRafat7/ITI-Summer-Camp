module Sequence_Detector
(
input x,
input clk,
input reset,
output reg out
);

reg[3:0] next_state ,state_reg;

localparam [2:0] A=3'b000;
localparam [2:0] B=3'b001;
localparam [2:0] C=3'b010;
localparam [2:0] D=3'b011;
localparam [2:0] E=3'b100;
localparam [2:0] F=3'b101;
localparam [2:0] G=3'b110;
localparam [2:0] H=3'b111;

always@(posedge clk,posedge reset)
begin
state_reg<=state_reg;
if(reset)
state_reg<=3'b000;
else
state_reg<=next_state;
end

always@(*)
begin
case(state_reg)
A:
begin
if(x)
next_state=B;
else
next_state=A;
end

B:
begin
if(x)
next_state=B;
else
next_state=C;
end

C:
begin
if(x)
next_state=D;
else
next_state=A;
end

D:
begin
if(x)
next_state=E;
else
next_state=C;
end

E:
begin
if(x)
next_state=B;
else
next_state=F;
end

F:
begin
if(x)
next_state=G;
else
next_state=A;
end

G:
begin

if(x)
next_state=E;
else
next_state=H;

end
H:
begin
if(x)
next_state=D;
else
next_state=A;
end
default:next_state=A;

endcase
end

always@(*)
begin
case(state_reg)
A:out=1'b0;
B:out=1'b0;
C:out=1'b0;
D:out=1'b0;
E:out=1'b0;
F:out=1'b0;
G:out=1'b0;
H:
begin
if(x)
out=1'b1;
else
out=1'b0;
end

default:out=1'b0;
endcase

end
endmodule
