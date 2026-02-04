`timescale 1ns / 1ps

module seconds_counter (
    input wire clk,          
    input wire rst_n,
    input wire clear,
    input wire enable,
    output reg [5:0] count,
    output wire overflow    
);

  assign overflow = (enable && (count == 6'd59));

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) 
            count <= 6'd0;
        else if (clear) 
            count <= 6'd0;
        else if (enable) begin
            if (count == 6'd59) 
                count <= 6'd0;
            else 
                count <= count + 1'b1;
        end
    end
endmodule
