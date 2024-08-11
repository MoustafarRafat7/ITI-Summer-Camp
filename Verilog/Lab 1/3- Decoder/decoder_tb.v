module Decoder3_8_tb
(
);
reg En;
reg [2:0]s;
wire [0:7]D;
Decoder3_8 dec(.En(En),.s(s),.D(D));
initial 
begin
En=1'b0;
#3
En=1'b1;
s=3'b110;
#4
s=3'b101;
#4
s=3'b000;
#4
s=3'b010;
#4
s=3'b001;
En=1'b0;
#4;
end

endmodule


