// This module whose output switches from HIGH to LOW and LOW to HIGH each time the input rises.
// author:yukinagata3184

module stateL(
    input CLK, RST,
    input transition,
    output reg state_l
);

always @(posedge CLK or posedge RST) begin
    if(RST)
        state_l <= 1'b0;
    else if(transition == 1'b1 && state_l == 1'b0)
        state_l <= 1'b1;
    else if(transition == 1'b1 && state_l == 1'b1)
        state_l <= 1'b0;
end

endmodule