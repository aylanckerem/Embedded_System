module led (

    input sys_clk, 
    input sys_rst_n, 
    output reg [2:0] led // 110 Green, 101 Red, 011 Blue

);

reg [63:0] counter;

always @(posedge sys_clk or negedge sys_rst_n) begin

    if (!sys_rst_n)
        counter <= 64'd0;

    else if (counter< 64'd3200_0000) // 1 s delay
        counter <= counter+ 1;

    else
        counter <= 64'de;
end

always @(posedge sys_clk or negedge sys_rst_n) begin

    if (!sys_rst_n)
        led <= 3'b110;

    else if (count == 64'd3200_0000 && led == 3'b101) 
        led[2:0] < (led[1:0], led[2]);
    
    else if (count == 64'd6400_0000 && led == 3'b011)
        led[2:0] < (led[1:0], led[2]);
       
    else 
        led <= led;
end

endmodule
