module ALU(
	input [15:0] A,
	input [15:0] B,
	input [3:0] ALU_FUN,
	input 		clk,
	output reg [15:0] ALU_OUT,
	output reg Arith_Flag,
	output reg Logic_Flag,
	output reg CMP_Flag,
	output reg Shift_Flag
	);

wire a = ALU_FUN [0];
wire b = ALU_FUN [1];
wire c = ALU_FUN [2];
wire d = ALU_FUN [3];



always @(posedge clk) begin
	case (ALU_FUN)
		4'b0000: begin
			ALU_OUT <= A + B; 
		end
		4'b0001: begin
			ALU_OUT <= A - B;
		end
		4'b0010: begin
			ALU_OUT <= A * B;
		end
		/*4'b0011: begin
			ALU_OUT <= A / B;
		end*/
		4'b0100: begin
			ALU_OUT <= A & B;
		end
		4'b0101: begin
			ALU_OUT <= A | B;
		end
		4'b0110: begin
			ALU_OUT <= ~(A & B);
		end
		4'b0111: begin
			ALU_OUT <= ~(A | B);
		end
		4'b1000: begin
			ALU_OUT <= A ^ B;
		end
		4'b1001: begin
			ALU_OUT <= (A ~^ B);
		end
		4'b1010: begin
			if (A == B) begin
				ALU_OUT <= 1;
			end 
			else begin
				ALU_OUT <= ALU_OUT;
			end
		end
		4'b1011: begin
			if (A > B) begin
				ALU_OUT <= 2;
			end 
			else begin
				ALU_OUT <= ALU_OUT;
			end
		end
		4'b1100: begin
			if (A < B) begin
				ALU_OUT <= 3;
			end 
			else begin
				ALU_OUT <= ALU_OUT;
			end
		end
		4'b1101: begin
			ALU_OUT <= A >> 1;
		end
		4'b1110: begin
			ALU_OUT <= A << 1;
		end
		default: begin 
			ALU_OUT <= 16'b0;
		end
	endcase 
end

always @(*) begin

	Arith_Flag = (~a & ~b);
 	Logic_Flag = (~a & b) | (a & ~b & ~c);
	CMP_Flag = (a & ~b & c) | (a & b & ~c & ~d);
	Shift_Flag = (a & b & d) | (a & b & c);	

	
end


endmodule