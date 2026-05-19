// traffic_controller.v
module traffic_controller(
    input clk,
    input reset,
    output reg [2:0] car_light,        // {Red, Yellow, Green}
    output reg [1:0] ped_light,        // {Red, Green}
    output reg [3:0] count,            // countdown value
    output reg [1:0] state             // for debug
);

    
    parameter S_CAR_GREEN  = 2'b00;
    parameter S_CAR_YELLOW = 2'b01;
    parameter S_PED_GREEN  = 2'b10;
    parameter S_ALL_RED    = 2'b11;

    reg [3:0] timer;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= S_CAR_GREEN;
            timer <= 9;
            car_light <= 3'b001;
            ped_light <= 2'b10;
        end
        else begin
            case(state)

                S_CAR_GREEN: begin
                    car_light <= 3'b001;
                    ped_light <= 2'b10;

                    if(timer == 0) begin
                        state <= S_CAR_YELLOW;
                        timer <= 3;
                    end
                    else
                        timer <= timer - 1;
                end

                S_CAR_YELLOW: begin
                    car_light <= 3'b010;
                    ped_light <= 2'b10;

                    if(timer == 0) begin
                        state <= S_PED_GREEN;
                        timer <= 9;
                    end
                    else
                        timer <= timer - 1;
                end

                S_PED_GREEN: begin
                    car_light <= 3'b100;
                    ped_light <= 2'b01;

                    if(timer == 0) begin
                        state <= S_ALL_RED;
                        timer <= 0;
                    end
                    else
                        timer <= timer - 1;
                end

                S_ALL_RED: begin
                    car_light <= 3'b100;
                    ped_light <= 2'b10;

                    if(timer == 0) begin
                        state <= S_CAR_GREEN;
                        timer <= 9;
                    end
                    else
                        timer <= timer - 1;
                end

                default: begin
                    state <= S_CAR_GREEN;
                    timer <= 9;
                end

            endcase
        end
    end

    always @(*) begin
        count = timer;
    end

endmodule