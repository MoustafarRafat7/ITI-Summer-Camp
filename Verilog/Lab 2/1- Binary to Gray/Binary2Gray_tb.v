module Binary2Gray_tb();
wire [2:0]G;
reg  [2:0]B;

Binary2Gray DUT(.G(G),.B(B));
initial
begin
B=3'b000;
#5
B=3'b001;
#5
B=3'b010;
#5
B=3'b011;
#5
B=3'b100;
#5
B=3'b101;
#5
B=3'b110;
#5
B=3'b111;
#5;
end

endmodule
