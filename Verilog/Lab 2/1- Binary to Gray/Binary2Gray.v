module  Binary2Gray
(
  input [2:0]B,
  output [2:0]G
);

assign G[2]=B[2];
assign G[1]=B[1]^B[2];
assign G[0]=B[1]^B[0];

endmodule
