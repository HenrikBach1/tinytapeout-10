`timescale 1ns / 1ps

module and_gate_tb;
    reg clk = 0;
    reg rst_n = 0;
    reg ena = 1;
    reg [7:0] ui_in;      // 8-bit input
    wire [7:0] uo_out;    // 8-bit output
    wire [7:0] uio_inout; // 8-bit bidirectional (set to high-Z in module)

    // Instantiate module under test
    tt_um_and_gate uut (
        .clk(clk), 
        .rst_n(rst_n),
        .ena(ena), 
        .ui_in(ui_in), 
        .uo_out(uo_out),
        .uio_inout(uio_inout)
    );

    // Generate clock
    always #5 clk = ~clk;

    initial begin
        #10 rst_n = 1;  // Release reset after 10ns

        // Test AND logic
        ui_in = 8'b00000000; #10;
        ui_in = 8'b00000001; #10;
        ui_in = 8'b00000010; #10;
        ui_in = 8'b00000011; #10;  // AND gate should output 1 on bit 0

        $finish;
    end
endmodule
