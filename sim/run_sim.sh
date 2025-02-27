#!/bin/bash
# Run Verilog simulation for the AND gate

set -e  # Stop on error

# Use relative paths from the `sim/` directory
echo "Compiling AND gate testbench..."
iverilog -o sim/and_gate_tb src/and_gate.v src/and_gate_tb.v

echo "Running simulation..."
vvp sim/and_gate_tb
