module binarydivision (clk, rst, dividend, divisor, quotient, remainder);
    input wire clk;
    input wire rst;
    input wire [3:0] dividend;
    input wire [3:0] divisor;
    output reg [3:0] quotient;
    output reg [3:0] remainder;

    reg [3:0] temp_dividend;
    reg [3:0] temp_quotient;
    reg [3:0] temp_remainder;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            temp_dividend <= 4'b0;
            temp_quotient <= 4'b0;
            temp_remainder <= 4'b0;
        end else begin
            temp_dividend <= {temp_remainder, dividend};
            temp_quotient <= temp_dividend / divisor;
            temp_remainder <= temp_dividend % divisor;
        end
    end

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            quotient <= 4'b0;
            remainder <= 4'b0;
        end else begin
            quotient <= temp_quotient;
            remainder <= temp_remainder;
        end
    end
endmodule
