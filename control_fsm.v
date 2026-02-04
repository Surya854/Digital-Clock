`timescale 1ns / 1ps

module control_fsm (
    input wire clk,          
    input wire rst_n,        
    input wire start,        
    input wire stop,         
    input wire reset,        
    output reg [1:0] status, // 00: IDLE, 01: RUNNING, 10: PAUSED
    output reg count_enable  
);

    localparam IDLE    = 2'b00;
    localparam RUNNING = 2'b01;
    localparam PAUSED  = 2'b10;

    reg [1:0] current_state, next_state;

    
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) 
            current_state <= IDLE;
        else if (reset) 
            current_state <= IDLE;
        else 
            current_state <= next_state;
    end
    
    always @(*) begin
        next_state = current_state;
        case (current_state)
            IDLE:    if (start) next_state = RUNNING;
            RUNNING: if (stop)  next_state = PAUSED;
            PAUSED:  if (start) next_state = RUNNING;
            default: next_state = IDLE;
        endcase
    end

    always @(*) begin
        status = current_state;
        count_enable = (current_state == RUNNING);
    end
endmodule
