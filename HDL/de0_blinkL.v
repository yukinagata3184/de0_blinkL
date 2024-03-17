// Top module of de0_blinkL.
// author:yukinagata3184

module de0_blinkL(
    input CLK, RST,
    output GPIO0_D,
    output [6:0] nSEG
);

wire gen1hz;
cnt1sec cnt1sec(.CLK(CLK), .RST(RST), .gen1hz(gen1hz));

reg state_l;
stateL stateL(.CLK(CLK), .RST(RST), .transition(gen1hz), .state_l(state_l));

gpio_ctrl gpio_ctrl(.state(state_l), .GPIO0_D(GPIO0_D));

seg7decL seg7decL(.en(state_l), .nSEG(nSEG));

endmodule