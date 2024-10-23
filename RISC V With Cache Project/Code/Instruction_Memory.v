module Instruction_Memory
(
input [7:0] Instruction_address,
output [31:0]RD
);
integer i;
reg[31:0]ROM[0:255];
/*initial 
begin
		       //# RISC-V Assembly      Description 	      Address
ROM[0] = 32'h00500113; // main: addi x2, x0, 5  # x2 = 5     		 0
ROM[1] = 32'h00c00193; // addi x3, x0, 12 	# x3 = 12    		 4
ROM[2] = 32'hff718393; // addi x7, x3, -9 	# x7 = (12 - 9) = 3	 8
ROM[3] = 32'h0023e233; // or x4, x7, x2 	# x4 = (3 OR 5) = 7      C
ROM[4] = 32'h0041f2b3; // and x5, x3, x4 	# x5 = (12 AND 7) = 4    10
ROM[5] = 32'h004282b3; // add x5, x5, x4 	# x5 = 4 + 7 = 11 	 14
ROM[6] = 32'h02728863; // beq x5, x7, end 	# shouldn't be taken 	 18
ROM[7] = 32'h0041a233; // slt x4, x3, x4	# x4 = (12 < 7) = 0 	 1C
ROM[8] = 32'h00020463; // beq x4, x0, around	# should be taken  	 20
ROM[9] = 32'h00000293; // addi x5, x0, 0 	# shouldn't execute  	 24
ROM[10] = 32'h0023a233;//around: slt x4, x7, x2 # x4 = (3 < 5) = 1 	 28
ROM[11] = 32'h005203b3; // add x7, x4, x5 	# x7 = (1 + 11) = 12 	 2C
ROM[12] = 32'h402383b3 ;//sub x7, x7, x2 	# x7 = (12 - 5) = 7      30
ROM[13] = 32'h0471aa23; //sw x7, 84(x3) 	# [96] = 7 		 34
ROM[14] = 32'h06002103; //lw x2, 96(x0) 	# x2 = [96] = 7  	 38      
ROM[15] = 32'h005104b3; //add x9, x2, x5 	# x9 = (7 + 11) = 18 	 3C        
ROM[16] = 32'h008001ef; //jal x3, end 		# jump to end, x3 = 0x44 40
ROM[17] = 32'h00100113; //addi x2, x0, 1 	# shouldn't execute 	 44
ROM[18] = 32'h00910133; //end: add x2, x2, x9   # x2 = (7 + 18) = 25     48
ROM[19] = 32'h0221a023; //sw x2, 0x20(x3) 	# [100] = 25 		 4C
ROM[20] = 32'h00210063; //done: beq x2, x2, done# infinite loop 	 50
for(i=21;i<256;i=i+1)
begin
ROM[i]=32'b0;
end
end*/
 // Initialize ROM with values
   initial begin
        ROM[0]  = 32'b00000000101000000000000010010011;  // addi x1, x0, 10
        ROM[1]  = 32'b00000001010000000000000100010011;  // addi x2, x0, 20
        ROM[2]  = 32'b00000010100000000000000110010011;  // addi x3, x0, 40
        ROM[3]  = 32'b00000101000000000000001000010011;  // addi x4, x0, 80
        ROM[4]  = 32'b00001010000000000000001010010011;  // addi x5, x0, 160
        ROM[5]  = 32'b00000000000100000010000000100011;  // sw x1, 0(x0)
        ROM[6]  = 32'b00000000001000000010001000100011;  // sw x2, 4(x0)
        ROM[7]  = 32'b00000000001100000010010000100011;  // sw x3, 8(x0)
        ROM[8]  = 32'b00000000010000000010011000100011;  // sw x4, 12(x0)
        ROM[9]  = 32'b00000000010100000010011000100011;  // sw x5, 12(x0)
        ROM[10] = 32'b00000000000000000010010100000011;  // lw x10, 0(x0)
        ROM[11] = 32'b00000000010000000010010110000011;  // lw x11, 4(x0)
        ROM[12] = 32'b00000000100000000010011000000011;  // lw x12, 8(x0)
        ROM[13] = 32'b00000000110000000010011010000011;  // lw x13, 12(x0)
        ROM[14] = 32'b00000000010000000010010110000011;  // lw x11, 4(x0)
for(i=15;i<256;i=i+1)
begin
ROM[i]=32'b0;
end

end


assign RD = ROM[Instruction_address];
endmodule