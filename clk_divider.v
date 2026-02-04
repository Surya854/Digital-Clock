`timescale 1ns / 1ps

module clk_divider #(
    parameter INPUT_FREQ = 100
)(
    input wire clk,
    input wire rst_n,
    output reg clk_1hz 
);
    integer counter;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            counter <= 0;
            clk_1hz <= 0;
        end else begin
            if (counter == (INPUT_FREQ/2) - 1) begin
                clk_1hz <= ~clk_1hz;
                counter <= 0;
            end else begin
                counter <= counter + 1;
            end
        end
    end
endmodule
