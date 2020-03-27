`default_nettype none


module top(input pclk,
           input RX,
           output TX,
           output [4:0] D,
           input resetq);

j1a U1 (
    .pclk(pclk),
    .TX(TX),
    .RX(RX),
    .D(D),
    .resetq(resetq));

endmodule
