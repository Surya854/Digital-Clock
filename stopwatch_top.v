module stopwatch_top#(parameter INPUT_FREQ = 100)
 (
    input wire clk,      
    input wire rst_n,
    input wire start,
    input wire stop,
    input wire reset,
    output wire [7:0] minutes,
    output wire [5:0] seconds,
    output wire [1:0] status
);
    wire clk_1hz;
    wire ce, sec_ovf;

    clk_divider #( .INPUT_FREQ(100) ) u_div (
        .clk(clk),
        .rst_n(rst_n),
        .clk_1hz(clk_1hz)
    );

    control_fsm u_fsm (
        .clk(clk_1hz), 
        .rst_n(rst_n), 
        .start(start), 
        .stop(stop), 
        .reset(reset),
        .status(status), 
        .count_enable(ce)
    );

    seconds_counter u_sec (
        .clk(clk_1hz), 
        .rst_n(rst_n), 
        .clear(reset), 
        .enable(ce),
        .count(seconds), 
        .overflow(sec_ovf)
    );


    minutes_counter u_min (
        .clk(clk_1hz), 
        .rst_n(rst_n), 
        .clear(reset), 
        .enable(sec_ovf), 
        .count(minutes)
    );

endmodule
