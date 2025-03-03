`timescale 1ns/1ps

module tt_um_and_gate (
    input wire clk,          // Clock signal
    input wire rst_n,        // Active-low reset
    input wire ena,          // Enable signal
    input wire [7:0] ui_in,  // 8-bit user input
    input wire [7:0] uio_in, // User input signal
    output wire [7:0] uo_out,// 8-bit user output
    output wire [7:0] uio_oe,   // Output Enable for bus (8 bits)
    output wire [7:0] uio_out   // Output signal for user output (8 bits)
);

    assign uo_out[0] = (rst_n && ena) ? (ui_in[0] & ui_in[1]) : 0;  // AND gate logic
    assign uo_out[7:1] = 7'b0000000;  // Unused bits set to 0
    assign uio_oe = 8'b00000000;       // Set all output enable signals to 0 (8-bit wide)
    assign uio_out = 8'b00000000;      // Set uio_out to 0 (8-bit wide)

endmodule
