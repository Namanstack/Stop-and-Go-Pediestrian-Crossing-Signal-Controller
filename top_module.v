// top_module.v
module top_module(
    input CLOCK_50,
    input [1:0] KEY,         // KEY[0]=reset, KEY[1]=unused
    output [6:0] HEX0,       // 7-seg display
    output [2:0] GPIO_CAR,   // Car lights via GPIO
    output [1:0] GPIO_PED    // Ped lights via GPIO
);
    wire clk_1Hz;
    wire [2:0] car_light;
    wire [1:0] ped_light;
    wire [3:0] count;
    wire [1:0] state;

    // Generate slow clock
    timer CLK_DIV(
        .clk(CLOCK_50),
        .reset(~KEY[0]),
        .tick(clk_1Hz)
    );

    // Traffic FSM
    traffic_controller FSM(
        .clk(clk_1Hz),
        .reset(~KEY[0]),
        .car_light(car_light),
        .ped_light(ped_light),
        .count(count),
        .state(state)
    );

    // 7-segment countdown
    seven_segment DISP(
        .num(count),
        .seg(HEX0)
    );

    // Assign GPIO outputs
    assign GPIO_CAR = car_light;   // Connect to JP1 GPIO[0..2]
    assign GPIO_PED = ped_light;   // Connect to JP1 GPIO[3..4]
endmodule
