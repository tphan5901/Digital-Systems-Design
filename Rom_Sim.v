
module sim_rom
    reg [3:0] address; // rom drive addresses
    wire [7:0] data;   // view rom addresses

    rom DUT(.address(address), .data(data));

    integer i;
    initial begin
        for(i = 0; i < 16; i = i + 1) begin
            address = i;
            #2; // 2 tick pause
        end
        $finish;
    end

endmodule