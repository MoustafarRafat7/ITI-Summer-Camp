module Five
(input [3:0]Seq1,Seq2,Seq3,
output [7:0]out
);

wire [1:0]AND_out;
wire [5:0] conc_out;
assign AND_out=Seq1[3:2]&Seq2[1:0];
assign conc_out={AND_out,Seq3};
assign out = {  {2{conc_out[5]}} ,conc_out};


endmodule