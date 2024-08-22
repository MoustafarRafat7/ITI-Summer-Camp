module FIFO_tb();
    
    
    localparam DATA_WIDTH = 32;
    localparam ADDR_WIDTH = 3;
    localparam T = 10; 
    
    reg clk, reset;
    reg wr, rd;
    reg [DATA_WIDTH -1: 0] w_data;
    wire [DATA_WIDTH -1: 0] r_data;
    wire full, empty;
    
    
    FIFO_Top #(.Width(DATA_WIDTH), .Address(ADDR_WIDTH)) uut(.clk(clk),.reset(reset),.Write(wr),.Read(rd)
                                               ,.Write_Data(w_data),.Read_Data(r_data)
                                              ,.Full(full),.Empty(empty));
    

    always
    begin
        clk = 1'b1;
        #(T / 2);
        clk = 1'b0;
        #(T / 2);
    end
    
    initial
    begin
        reset = 1'b0;
        rd = 1'b0;
        wr = 1'b0;
        @(negedge clk);
        reset = 1'b1;
    end
    
    initial
    begin
        
        @(negedge clk);
        w_data = 8'd5;
        wr = 1'b1;     
        @(negedge clk);
        wr = 1'b0;
        
        
        @(negedge clk);
        w_data = 8'd8;
        wr = 1'b1;
        @(negedge clk)
        wr = 1'b0;
        
        
        @(negedge clk);
        w_data = 8'd2;
        wr = 1'b1;
        @(negedge clk)
        wr = 1'b0;        
        
     
        @(negedge clk);
        rd = 1'b1;
        @(negedge clk)
        rd = 1'b0;        
        
        
        @(negedge clk);
        w_data = 8'd0;
        wr = 1'b1;
        @(negedge clk)
        wr = 1'b0;        
        
        
        @(negedge clk);
        w_data = 8'd9;
        wr = 1'b1;
        @(negedge clk)
        wr = 1'b0;        
       

        @(negedge clk);
        w_data = 8'd3;
        wr = 1'b1;
        @(negedge clk)
        wr = 1'b0;        
        
        
        @(negedge clk);
        w_data = 8'd6;
        wr = 1'b1;
        @(negedge clk)
        wr = 1'b0;        
        
      
        @(negedge clk);
        w_data = 8'd1;
        wr = 1'b1;
        @(negedge clk)
        wr = 1'b0;        
        
       
        @(negedge clk);
        w_data = 8'd3;
        wr = 1'b1;
        @(negedge clk)
        wr = 1'b0;        
        
        
        @(negedge clk);
        rd = 1'b1;
        @(negedge clk)
        rd = 1'b0;
        
        
        @(negedge clk);
        rd = 1'b1;
        @(negedge clk)
        rd = 1'b0;
        
        
        @(negedge clk);
        rd = 1'b1;
        @(negedge clk)
        rd = 1'b0;
        
        
        @(negedge clk);
        rd = 1'b1;
        @(negedge clk)
        rd = 1'b0;
        
        
        @(negedge clk);
        rd = 1'b1;
        @(negedge clk)
        rd = 1'b0;
        
        
        @(negedge clk);
        rd = 1'b1;
        @(negedge clk)
        rd = 1'b0;
        
      
        @(negedge clk);
        rd = 1'b1;
        @(negedge clk)
        rd = 1'b0;
        
       
        @(negedge clk);
        rd = 1'b1;
        @(negedge clk)
        rd = 1'b0;
        
       
        @(negedge clk);
        w_data = 8'd7;
        wr = 1'b1;
        rd = 1'b1;
        @(negedge clk)
        wr = 1'b0;
        rd = 1'b0;
        
        @(negedge clk);
        rd = 1'b1;
        @(negedge clk)
        rd = 1'b0;

        
        @(negedge clk);
        w_data = 8'd4;
        wr = 1'b1;
        @(negedge clk)
        wr = 1'b0;
        
        @(negedge clk);
        w_data = 8'd5;
        wr = 1'b1;
        @(negedge clk)
        wr = 1'b0;
        
        @(negedge clk);
        w_data = 8'd6;
        wr = 1'b1;
        @(negedge clk)
        wr = 1'b0;
        
        @(negedge clk);
        w_data = 8'd7;
        wr = 1'b1;
        rd = 1'b1;
        @(negedge clk)
        wr = 1'b0;
        rd = 1'b0;
        #T;
                
        
    end
    
endmodule    
    