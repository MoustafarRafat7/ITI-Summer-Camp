//fpga4student.com: FPga projects, Verilog projects, VHDL projects
// Verilog project: Verilog code for 16-bit MIPS Processor
// Submodule: Data memory in Verilog 
 module data_memory  
 (  
      input                         clk,  
      // address input, shared by read and write port  
      input     [15:0]               mem_access_addr,  
      // write port  
      input     [15:0]               mem_write_data,  
      input                         mem_write_en,  
      input mem_read,  
      input reset,
      // read port  
      output     [15:0]               mem_read_data  
 );  
  // integer i; 
      wire signed  i;   
      reg [15:0] ram [255:0];  
      wire [7 : 0] ram_addr = mem_access_addr[9 : 2];  
     
   /* initial begin  
          for(i=0;i<256;i=i+1)  
                ram[i] <= 16'd0;  
      end
       */
      always @(posedge clk , posedge reset) begin  
      if (reset)
      ram[ram_addr]<=0;
          else if (mem_write_en)  
                ram[ram_addr] <= mem_write_data;  
		else
		ram[ram_addr]<=ram[ram_addr];
		
      end  
      assign mem_read_data = (mem_read==1'b1) ? ram[ram_addr]: 16'd0;   
 endmodule   
