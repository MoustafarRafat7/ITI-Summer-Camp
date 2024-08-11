module Five_tb
(
);
reg [3:0]Seq1,Seq2,Seq3;

wire [7:0]out;
Five prob(.Seq1(Seq1),.Seq2(Seq2),.Seq3(Seq3),.out(out));
initial 
begin

Seq1=4'b1011;
Seq2=4'b0011;
Seq3=4'b1010;
#4;
end

endmodule


