`timescale 1ns / 1ps

module minutes_counter (
    input wire clk,          
    input wire rst_n,
    input wire clear,
    input wire enable,       
    output reg [7:0] count
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) 
            count <= 8'd0;
        else if (clear) 
            count <= 8'd0;
        else if (enable) begin
            if (count == 8'd99) 
                count <= 8'd0;
            else 
                count <= count + 1'b1;
        end
    end
endmodule
