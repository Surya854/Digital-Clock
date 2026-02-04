# Digital-Clock
Digital clock with 0-60 seconds, and 0-99 minutes 

Functionality: 
Run the simulation with:
clk: force clock, leading edge value 1, trailing edge 0, time period 10ns
start: 1
rst_n, stop, reset: 0
Run for 1 microsecond, 
the states will change from XX to 00;

Now force rst_n to 1, the seconds counter will go to 1,
Now the clock is running, increase the time to 100 microseconds, to see it run, 
The status will show 1(running), and seconds and minutes will run as intended

Now to reset

Force reset and stop together as 1
All the seconds, minutes and state will go back to zero, essentially resetting the clock to 0

If you force stop 0 for one cycle, and reset 0 for the next cycle, the clock will start runninf from 0, 1, 3......

If you force rst_n(hard reset), it clears the memory and keeps it at 0
