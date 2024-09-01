`timescale 1ns/1ns

module binarydivisiontb();

// Inputs
reg clk;
reg rst;
reg [3:0] dividend;
reg [3:0] divisor;

// Outputs
wire [3:0] quotient;
wire [3:0] remainder;

// Instantiate the module
// binarydivision dut ( clk, rst, dividend, divisor, quotient, remainder);
binarydivision dut(
    .clk(clk),
    .rst(rst),
    .dividend(dividend),
    .divisor(divisor),
    .quotient(quotient),
    .remainder(remainder)
);

// Clock Generation
always #5 clk = ~clk;

// Stimulus
initial begin
    clk = 0;
    rst = 1;
    dividend = 4'b1010; // Modify as needed
    divisor = 4'b1010;  // Modify as needed

    #10 rst = 0; // Deassert reset

    // Add test scenarios here

    #100 $finish; // End simulation
end

// Add your assertions or checks here if needed

endmodule
