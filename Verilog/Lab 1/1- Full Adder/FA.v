module FA
(
input x,y,cin,
output s,cout
);

wire s1,c1,c2;
HA HA0(.x(x),.y(y),.s(s1),.c(c1));
HA HA1(.x(cin),.y(s1),.s(s),.c(c2));

assign cout = c1 | c2;
endmodule