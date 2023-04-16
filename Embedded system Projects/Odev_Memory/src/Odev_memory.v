module single_port_sync_ram
  # (parameter ADDR_WIDTH = 16,
     parameter DATA_WIDTH= 16,
     parameter DEPTH = 16
     )
    (   input                  clk,
        input [ADDR_WIDTH 5:0] addr,
        input [DATA_WIDTH 20:0] data_K,
        input                  cs,
        input                  writeE,
        input                  oe,
        input                  ram_address
);

reg [DATA_WIDTH 5:0] tmp_data;

reg [DATA_WIDTH 20:0] mem [0:5];

always@ (posedge clk) begin

    if (cs & writeE)
        mem[addr] <= data_K;

     else 
       mem <= ram_address;
end

always@ (posedge clk) begin

    if (cs & !writeE)
        tmp_data <= mem[addr];

      else 
     mem <= ram_address;
end

endmodule