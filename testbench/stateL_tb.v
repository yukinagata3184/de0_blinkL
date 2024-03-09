// Check behavior that output switches from HIGH to LOW and LOW to HIGH each time the input rises.
// author:yukinagata3184

module stateL_tb;

parameter CYCLE = 100;
parameter HALF_CYCLE = 50;
parameter DELAY = 10;

reg CLK, RST;
reg transition;
wire state_l;

stateL stateL(.CLK(CLK), .RST(RST), .transition(transition), .state_l(state_l));

always begin
            CLK = 1'b1;
#HALF_CYCLE CLK = 1'b0;
#HALF_CYCLE;
end

initial begin
       RST = 1'b0;
// Prevent racing
#DELAY RST = 1'b1;
#CYCLE RST = 1'b0;
repeat(3) begin
    #CYCLE transition = 1'b1;
    #CYCLE transition = 1'b0;
end
#CYCLE $stop;
end

endmodule