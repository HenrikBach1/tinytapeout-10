`timescale 1ns / 1ps

module and_gate_tb;
    reg A, B;
    wire Y;

    // Instantiate the module under test
    and_gate uut (
        .A(A),
        .B(B),
        .Y(Y)
    );

    initial begin
        // Apply test vectors
        A = 0; B = 0; #10;
        A = 0; B = 1; #10;
        A = 1; B = 0; #10;
        A = 1; B = 1; #10;
        
        // End simulation
        $finish;
    end

    initial begin
        $monitor("Time = %0t | A = %b, B = %b, Y = %b", $time, A, B, Y);
    end
endmodule
