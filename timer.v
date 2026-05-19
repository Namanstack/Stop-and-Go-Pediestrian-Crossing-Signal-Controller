// timer.v
module timer(
input clk,        // 50 MHz
input reset
output reg tick   // 1 Hz pulse
);
reg [25:0] counter;
 	always @(posedge clk or posedge reset) begin
 if     (reset) begin
         counter <= 0;
         tick <= 0;
end else begin
         if (counter == 25_000_000) begin // 0.5 sec high + 0.5 sec
               tick <= ~tick;
               counter <= 0;
       end else begin
               counter <= counter + 1;
            			       end
        			end
    		end
  endmodule 
