{
  "version": "1.2",
  "package": {
    "name": "",
    "version": "",
    "description": "",
    "author": "",
    "image": ""
  },
  "design": {
    "board": "icestick",
    "graph": {
      "blocks": [
        {
          "id": "af61474a-9c2e-4521-91e3-484df325351b",
          "type": "basic.input",
          "data": {
            "name": "",
            "pins": [
              {
                "index": "0",
                "name": "CLK",
                "value": "21"
              }
            ],
            "virtual": false,
            "clock": false
          },
          "position": {
            "x": -80,
            "y": -88
          }
        },
        {
          "id": "f294cce9-d520-4691-9891-57b2e9662b09",
          "type": "basic.output",
          "data": {
            "name": "",
            "pins": [
              {
                "index": "0",
                "name": "TX",
                "value": "8"
              }
            ],
            "virtual": false
          },
          "position": {
            "x": 816,
            "y": -48
          }
        },
        {
          "id": "314fff6c-8caa-4e10-a7c8-f8e0bc866d8c",
          "type": "basic.input",
          "data": {
            "name": "",
            "pins": [
              {
                "index": "0",
                "name": "DTR",
                "value": "3"
              }
            ],
            "virtual": false,
            "clock": false
          },
          "position": {
            "x": -72,
            "y": 88
          }
        },
        {
          "id": "baa97a1d-08df-45a4-835f-9076539a39cc",
          "type": "basic.output",
          "data": {
            "name": "D",
            "range": "[4:0]",
            "pins": [
              {
                "index": "4",
                "name": "D5",
                "value": "95"
              },
              {
                "index": "3",
                "name": "D4",
                "value": "96"
              },
              {
                "index": "2",
                "name": "D3",
                "value": "97"
              },
              {
                "index": "1",
                "name": "D2",
                "value": "98"
              },
              {
                "index": "0",
                "name": "D1",
                "value": "99"
              }
            ],
            "virtual": false
          },
          "position": {
            "x": 832,
            "y": 152
          }
        },
        {
          "id": "8c898076-5393-4f25-ae59-8272cb54fdc4",
          "type": "basic.input",
          "data": {
            "name": "",
            "pins": [
              {
                "index": "0",
                "name": "RX",
                "value": "9"
              }
            ],
            "virtual": false,
            "clock": false
          },
          "position": {
            "x": -64,
            "y": 256
          }
        },
        {
          "id": "ac824ce9-e479-4150-9f46-0978e99540bb",
          "type": "basic.code",
          "data": {
            "code": "// @include j1.v\n// @include j1a.v\n// @include mem.v\n// @include stack2.v\n// @include uart.v\n\n \n localparam MHZ = 12;\n\n  wire clk;\n  SB_PLL40_CORE #(.FEEDBACK_PATH(\"SIMPLE\"),\n                  .PLLOUT_SELECT(\"GENCLK\"),\n                  .DIVR(4'b0000),\n                  .DIVF(7'd3),\n                  .DIVQ(3'b000),\n                  .FILTER_RANGE(3'b001),\n                 ) uut (\n                         .REFERENCECLK(pclk),\n                         .PLLOUTCORE(clk),\n                         //.PLLOUTGLOBAL(clk),\n                         // .LOCK(D5),\n                         .RESETB(1'b1),\n                         .BYPASS(1'b0)\n                        );\n\n  wire io_rd, io_wr;\n  wire [15:0] mem_addr;\n  wire mem_wr;\n  wire [15:0] dout;\n  wire [15:0] io_din;\n  wire [12:0] code_addr;\n  reg unlocked = 0;\n\n  j1 _j1(\n    .clk(clk),\n    .resetq(resetq),\n    .io_rd(io_rd),\n    .io_wr(io_wr),\n    .mem_wr(mem_wr),\n    .dout(dout),\n    .io_din(io_din),\n    .mem_addr(mem_addr),\n    .code_addr(code_addr),\n    .insn(insn));\n\n  /*\n  // ######   TICKS   #########################################\n\n  reg [15:0] ticks;\n  always @(posedge clk)\n    ticks <= ticks + 16'd1;\n  */\n\n  // ######   IO SIGNALS   ####################################\n\n`define EASE_IO_TIMING\n`ifdef EASE_IO_TIMING\n  reg io_wr_, io_rd_;\n  reg [15:0] dout_;\n  reg [15:0] io_addr_;\n\n  always @(posedge clk) begin\n    {io_rd_, io_wr_, dout_} <= {io_rd, io_wr, dout};\n    if (io_rd | io_wr)\n      io_addr_ <= mem_addr;\n  end\n`else\n  wire io_wr_ = io_wr, io_rd_ = io_rd;\n  wire [15:0] dout_ = dout;\n  wire [15:0] io_addr_ = mem_addr;\n`endif\n\n  // ######   PMOD   ##########################################\n\n  reg [7:0] pmod_dir;   // 1:output, 0:input\n  wire [7:0] pmod_in;\n\n/*\n  ioport _mod (.clk(clk),\n               .pins({PIO1_09, PIO1_08, PIO1_07, PIO1_06, PIO1_05, PIO1_04, PIO1_03, PIO1_02}),\n               .we(io_wr_ & io_addr_[0]),\n               .wd(dout_),\n               .rd(pmod_in),\n               .dir(pmod_dir));\n*/\n  // ######   HDR1   ##########################################\n\n  reg [7:0] hdr1_dir;   // 1:output, 0:input\n  wire [7:0] hdr1_in;\n\n/*\n  ioport _hdr1 (.clk(clk),\n               .pins({PIO0_09, PIO0_08, PIO0_07, PIO0_06, PIO0_05, PIO0_04, PIO0_03, PIO0_02}),\n               .we(io_wr_ & io_addr_[4]),\n               .wd(dout_[7:0]),\n               .rd(hdr1_in),\n               .dir(hdr1_dir));\n*/\n  // ######   HDR2   ##########################################\n\n  reg [7:0] hdr2_dir;   // 1:output, 0:input\n  wire [7:0] hdr2_in;\n/*\n  ioport _hdr2 (.clk(clk),\n               .pins({PIO2_17, PIO2_16, PIO2_15, PIO2_14, PIO2_13, PIO2_12, PIO2_11, PIO2_10}),\n               .we(io_wr_ & io_addr_[6]),\n               .wd(dout_[7:0]),\n               .rd(hdr2_in),\n               .dir(hdr2_dir));\n*/\n  // ######   UART   ##########################################\n\n  wire uart0_valid, uart0_busy;\n  wire [7:0] uart0_data;\n  wire uart0_wr = io_wr_ & io_addr_[12];\n  wire uart0_rd = io_rd_ & io_addr_[12];\n  wire uart_RXD = RX;\n  //inpin _rcxd(.clk(clk), .pin(RXD), .rd(uart_RXD));\n  buart _uart0 (\n     .clk(clk),\n     .resetq(1'b1),\n     .rx(uart_RXD),\n     .tx(TX),\n     .rd(uart0_rd),\n     .wr(uart0_wr),\n     .valid(uart0_valid),\n     .busy(uart0_busy),\n     .tx_data(dout_[7:0]),\n     .rx_data(uart0_data));\n\n  wire [4:0] LEDS;\n  wire w4 = io_wr_ & io_addr_[2];\n\n\n\tSB_IO #(.PIN_TYPE(6'b0101_01)) _io0 (\n        .PACKAGE_PIN(D[4]),\n        .CLOCK_ENABLE(w4),\n        .OUTPUT_CLK(clk),\n        .D_OUT_0(dout_[0]),\n        .D_IN_0(LEDS[0]));\n\n\tSB_IO #(.PIN_TYPE(6'b0101_01)) _io1 (\n\t        .PACKAGE_PIN(D[3]),\n\t        .CLOCK_ENABLE(w4),\n\t        .OUTPUT_CLK(clk),\n\t        .D_OUT_0(dout_[1]),\n\t        .D_IN_0(LEDS[1]));\n\n\n  SB_IO #(.PIN_TYPE(6'b0101_01)) _io2 (\n\t\t\t\t\t.PACKAGE_PIN(D[2]),\n\t\t\t\t\t.CLOCK_ENABLE(w4),\n\t\t\t\t\t.OUTPUT_CLK(clk),\n\t\t\t\t\t.D_OUT_0(dout_[2]),\n\t\t\t\t\t.D_IN_0(LEDS[2]));\n\n\n\tSB_IO #(.PIN_TYPE(6'b0101_01)) _io3 (\n\t        .PACKAGE_PIN(D[1]),\n\t        .CLOCK_ENABLE(w4),\n\t        .OUTPUT_CLK(clk),\n\t        .D_OUT_0(dout_[3]),\n\t        .D_IN_0(LEDS[3]));\n\n\n\tSB_IO #(.PIN_TYPE(6'b0101_01)) _io4 (\n\t        .PACKAGE_PIN(D[0]),\n\t        .CLOCK_ENABLE(w4),\n\t        .OUTPUT_CLK(clk),\n\t        .D_OUT_0(dout_[4]),\n\t        .D_IN_0(LEDS[4]));\n\n\n\n  //outpin led0 (.clk(clk), .we(w4), .pin(D5), .wd(dout_[0]), .rd(LEDS[0]));\n  //outpin led1 (.clk(clk), .we(w4), .pin(D4), .wd(dout_[1]), .rd(LEDS[1]));\n  //outpin led2 (.clk(clk), .we(w4), .pin(D3), .wd(dout_[2]), .rd(LEDS[2]));\n  //outpin led3 (.clk(clk), .we(w4), .pin(D2), .wd(dout_[3]), .rd(LEDS[3]));\n  //outpin led4 (.clk(clk), .we(w4), .pin(D1), .wd(dout_[4]), .rd(LEDS[4]));\n\n  wire [4:0] PIOS;\n  wire w8 = io_wr_ & io_addr_[3];\n\n/*\n\tSB_IO #(.PIN_TYPE(6'b0101_01)) _io00 (\n\t        .PACKAGE_PIN(PIOS_03),\n\t        .CLOCK_ENABLE(w8),\n\t        .OUTPUT_CLK(clk),\n\t        .D_OUT_0(dout_[0]),\n\t        .D_IN_0(PIOS[0]));\n\n\tSB_IO #(.PIN_TYPE(6'b0101_01)) _io01 (\n\t        .PACKAGE_PIN(PIOS_02),\n\t        .CLOCK_ENABLE(w8),\n\t        .OUTPUT_CLK(clk),\n\t        .D_OUT_0(dout_[1]),\n\t        .D_IN_0(PIOS[1]));\n*/\n/*\n\tSB_IO #(.PIN_TYPE(6'b0101_01)) _io02 (\n\t\t\t\t\t.PACKAGE_PIN(PIOS_00),\n\t\t\t\t\t.CLOCK_ENABLE(w8),\n\t\t\t\t\t.OUTPUT_CLK(clk),\n\t\t\t\t\t.D_OUT_0(dout_[2]),\n\t\t\t\t\t.D_IN_0(PIOS[2]));\n*/\n/*\n\tSB_IO #(.PIN_TYPE(6'b0101_01)) _io03 (\n\t\t\t\t\t.PACKAGE_PIN(PIO1_18),\n\t\t\t\t\t.CLOCK_ENABLE(w8),\n\t\t\t\t\t.OUTPUT_CLK(clk),\n\t\t\t\t\t.D_OUT_0(dout_[3]),\n\t\t\t\t\t.D_IN_0(PIOS[3]));\n\n*/\n/*\n\tSB_IO #(.PIN_TYPE(6'b0101_01)) _io04 (\n\t\t\t\t\t.PACKAGE_PIN(PIO1_20),\n\t\t\t\t\t.CLOCK_ENABLE(w8),\n\t\t\t\t\t.OUTPUT_CLK(clk),\n\t\t\t\t\t.D_OUT_0(dout_[4]),\n\t\t\t\t\t.D_IN_0(PIOS[4]));\n*/\n  //outpin pio0 (.clk(clk), .we(w8), .pin(PIOS_03), .wd(dout_[0]), .rd(PIOS[0]));\n  //outpin pio1 (.clk(clk), .we(w8), .pin(PIOS_02), .wd(dout_[1]), .rd(PIOS[1]));\n  //outpin pio2 (.clk(clk), .we(w8), .pin(PIOS_00), .wd(dout_[2]), .rd(PIOS[2]));\n  //outpin pio3 (.clk(clk), .we(w8), .pin(PIO1_18), .wd(dout_[3]), .rd(PIOS[3]));\n  //outpin pio4 (.clk(clk), .we(w8), .pin(PIO1_20), .wd(dout_[4]), .rd(PIOS[4]));\n\n  // ######   RING OSCILLATOR   ###############################\n\n  wire [1:0] buffers_in, buffers_out;\n  assign buffers_in = {buffers_out[0:0], ~buffers_out[1]};\n  SB_LUT4 #(\n          .LUT_INIT(16'd2)\n  ) buffers [1:0] (\n          .O(buffers_out),\n          .I0(buffers_in),\n          .I1(1'b0),\n          .I2(1'b0),\n          .I3(1'b0)\n  );\n  wire random = ~buffers_out[1];\n\n  // ######   IO PORTS   ######################################\n\n  /*        bit   mode    device\n      0001  0     r/w     PMOD GPIO\n      0002  1     r/w     PMOD direction\n      0004  2     r/w     LEDS\n      0008  3     r/w     misc.out\n      0010  4     r/w     HDR1 GPIO\n      0020  5     r/w     HDR1 direction\n      0040  6     r/w     HDR2 GPIO\n      0080  7     r/w     HDR2 direction\n      0800  11      w     sb_warmboot\n      1000  12    r/w     UART RX, UART TX\n      2000  13    r       misc.in\n  */\n\n  assign io_din =\n    (io_addr_[ 0] ? {8'd0, pmod_in}                                     : 16'd0) |\n    (io_addr_[ 1] ? {8'd0, pmod_dir}                                    : 16'd0) |\n    (io_addr_[ 2] ? {11'd0, LEDS}                                       : 16'd0) |\n    (io_addr_[ 3] ? {11'd0, PIOS}                                       : 16'd0) |\n    (io_addr_[ 4] ? {8'd0, hdr1_in}                                     : 16'd0) |\n    (io_addr_[ 5] ? {8'd0, hdr1_dir}                                    : 16'd0) |\n    (io_addr_[ 6] ? {8'd0, hdr2_in}                                     : 16'd0) |\n    (io_addr_[ 7] ? {8'd0, hdr2_dir}                                    : 16'd0) |\n    (io_addr_[12] ? {8'd0, uart0_data}                                  : 16'd0) |\n    (io_addr_[13] ? {11'd0, random, 1'b1, 1'b1, uart0_valid, !uart0_busy} : 16'd0);\n\n  reg boot, s0, s1;\n\n  SB_WARMBOOT _sb_warmboot (\n    .BOOT(boot),\n    .S0(s0),\n    .S1(s1)\n    );\n\n  always @(posedge clk) begin\n    if (io_wr_ & io_addr_[1])\n      pmod_dir <= dout_[7:0];\n    if (io_wr_ & io_addr_[5])\n      hdr1_dir <= dout_[7:0];\n    if (io_wr_ & io_addr_[7])\n      hdr2_dir <= dout_[7:0];\n    if (io_wr_ & io_addr_[11])\n      {boot, s1, s0} <= dout_[2:0];\n  end\n\n  always @(negedge resetq or posedge clk)\n    if (!resetq)\n      unlocked <= 0;\n    else\n      unlocked <= unlocked | io_wr_;\n\n\n//---------------------- memory\n\nwire [15:0] insn0, insn1;\nwire [15:0] insn;\n\nSB_RAM2048x2 #(\n.INIT_0(256'hd3d68152b0338cc6b68b2c3940c931dac00a23690e673f1b35f6d2ea65064585),\n.INIT_1(256'h71aa2c5cd339e5ce2cd886d94615a3ecc5c9a4de0c9bcfc65cb40db572ffa68d),\n.INIT_2(256'h20e0289af74cb6ac8bbf869e08e1017c48510c8004dcadf1ec60845433e1df76),\n.INIT_3(256'h8d1613939b730265441e91a1cea6cbc23716eb6a436644fc2d5caf9e963a413b),\n.INIT_4(256'h6c584c642b1f3a55327a0e357b2d29040104003d940202786b93015f8d313157),\n.INIT_5(256'h5c66c5d71931347c023065bcfc8b9846307f4b7d215a335c3557483e64692e08),\n.INIT_6(256'h24190f131938435691d3505e924a54dc192ce1abc8c18444f06675554a252877),\n.INIT_7(256'h345d29ac797c583062af288c0c7deac884757c8a2d20ae72849aba00083ec1bf),\n.INIT_8(256'hc092041ae686b93ce2c2885d24cf0cebf7f6a5b4a16c7c36acfdd288b52d0460),\n.INIT_9(256'h4059624ef85ac14fe5104825cf51c52f9c04e49fc29cc05db8261c1916c62aa9),\n.INIT_A(256'h8850051524bc9154886000e095b8adbce1f4b074a0c4f555f3300ad993a5a927),\n.INIT_B(256'h84704511607d40f1f82c9018b0bd114ce56d801040555150a024a55d00bc0189),\n.INIT_C(256'hb0c03354d008fcbf703cfdcb019b0913e39ea454c61e8c177d407226ab04b654),\n.INIT_D(256'hb30b3e64a49d04b6ac5b701809c5344da60ec232a49b02acb39f124c9a42d1dc),\n.INIT_E(256'h8a279c19ee72d0e05ad6c4fe78840a0f90b7b429f6ee828a3c665a6cf3e52f37),\n.INIT_F(256'h484be17e1de193caf0ef19dd56c792e658e5d69e7325b5d8d1a490f1559e7c96)\n) _bn00 (\n.RDATA(insn0[1:0]),\n.RADDR(code_addr[10:0]),\n.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),\n.WCLK(clk), .WCLKE(unlocked), .WE(mem_wr & !mem_addr[12]),\n.WADDR(mem_addr[11:1]),\n.MASK(16'h0000), .WDATA(dout[1:0]));\n\nSB_RAM2048x2 #(\n.INIT_0(256'h30b0010588ad46ac203d2ca8b6e7d2936adb7327889e95ceb8fe8e8295eff8f0),\n.INIT_1(256'h80dc908c65bb9c8889a994a1ec9ff2b3d5559090c5a9180429eb073f4a4a01a9),\n.INIT_2(256'h48ead1d1005020a0b3abc2b240e890f1c868b0a80919a4bc99ddf1313a382189),\n.INIT_3(256'ha23b7571442c0c6e21f511311602051d424252901b223a2eebfd809221104535),\n.INIT_4(256'h1246046c7850024a161f65760858520b214199e9dc980a7a5bd324d693258636),\n.INIT_5(256'hb0a66064055380f41e5c54d0407a564d614a0a1c60510b1f09477b5134724848),\n.INIT_6(256'h08072c3424356efd8ac8529c0080a8fa2070c75528735033d95a5b398f841a90),\n.INIT_7(256'h6001697088289c94fffcc3e2b0b69695e99bb611558a0f3bbcb22abc241c6635),\n.INIT_8(256'hef7f147c854554d44b98158cd7d485438bca4c4e38b8150f41b0707022f82c30),\n.INIT_9(256'h14761272acac6a381d9aa2a224be0325a1f2a98a7e5b2460de51e5f6c1929ede),\n.INIT_A(256'hbdec8c0d94d4688c0494016064c840657094e4e5293c3c8cb6f7ebaac87440d7),\n.INIT_B(256'h1cdc8844f05c4c69e56c416161b1245ce8fc6c74f01455d4f93980f9c0fd94d4),\n.INIT_C(256'h80c92931a9ab0953e21a408da9c9907038ba19737a3ae4efcc3e2a2ba2c3016f),\n.INIT_D(256'h616390c10a0991a785d3a012c1aaa2b3c811a3fb7df044e8d8f97cb66ef74a98),\n.INIT_E(256'h79cb725e40c2c64790d90405fbc3d1d5d77644c4c82c1cdbbc8d0382e1c958b8),\n.INIT_F(256'h67fe8d985cd10d1c9cdc14d420e1c4ce01d13a3c54fc46611b12fc54385e0c8f)\n) _bn01 (\n.RDATA(insn0[3:2]),\n.RADDR(code_addr[10:0]),\n.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),\n.WCLK(clk), .WCLKE(unlocked), .WE(mem_wr & !mem_addr[12]),\n.WADDR(mem_addr[11:1]),\n.MASK(16'h0000), .WDATA(dout[3:2]));\n\nSB_RAM2048x2 #(\n.INIT_0(256'h9430a8f2a022820051d48904e33ad05e1052961c4640cf504a804e00b0310283),\n.INIT_1(256'h14c47d77d226a42a29e005486618414c2ce4b07a0b85a09004e72cb848c4c526),\n.INIT_2(256'ha2c863b55088c24b8820a23b2848001c59881ccc09e13454c10d787016c4f109),\n.INIT_3(256'h898b70887919421eb59e10a092a785059a8223029b369428bd218646043d00bc),\n.INIT_4(256'h701648090a1b7a395f0549286d65342665471d0d10498a8832b82c1495063eea),\n.INIT_5(256'h9e314670d9ed764890bd23bc1827135f315811571866682c06183a3e64317033),\n.INIT_6(256'h833a08743802f974d2065a0048059880d86c3fd383023a12d1946202003d5a17),\n.INIT_7(256'h78405168e046201c810da104d4f89337e958d2765a572ad4803dbcd2bd01e7ea),\n.INIT_8(256'hc836a790d3509e8c4a0c1f7503c90a204a0083859ace9b1bfb59dfe293e09377),\n.INIT_9(256'hb35ed315ab86227cde5002751ab2e658b233ca9986fc0635f69d6e6b5aeaca65),\n.INIT_A(256'h31d1c49c24b948a0b0013591a00c4490a01080455901fc84ba294ff11682db9b),\n.INIT_B(256'hdcb0859161982400fd046c3ce40d110584480c186850188df4ace12049b9018c),\n.INIT_C(256'h5838580cc8731801300bed3e299e4c9ee21eaa984a50a980dbd13814cb7f4e2e),\n.INIT_D(256'hc5040b623aaa37c876a1c4015b8c71a93a3aaa79ad339e55f904340529c9c929),\n.INIT_E(256'haeb58285e1adcb366284240440e60c819542c483e909cf4c7002c761f2161a3a),\n.INIT_F(256'h1913fcea3d4a04cc510e014758308364592b4ec97828c12fccf9ed2c1c008ac1)\n) _bn02 (\n.RDATA(insn0[5:4]),\n.RADDR(code_addr[10:0]),\n.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),\n.WCLK(clk), .WCLKE(unlocked), .WE(mem_wr & !mem_addr[12]),\n.WADDR(mem_addr[11:1]),\n.MASK(16'h0000), .WDATA(dout[5:4]));\n\nSB_RAM2048x2 #(\n.INIT_0(256'h301488a880a0040210412485028300d00010a396804c90d4304a044ea4b17b0a),\n.INIT_1(256'h101004543310002000230001100030001120002000020888a488032802480004),\n.INIT_2(256'h808050700090002123901222002010110030201800280020908089c830100020),\n.INIT_3(256'h280101749c7002c004252118429600a80a9a1021229200120010000000313580),\n.INIT_4(256'h06380c082047285a005f04493249102008618050e454404209fa10214493003c),\n.INIT_5(256'h109a000289418240803462871042a033003f0c5720106546194a006b00001a60),\n.INIT_6(256'h30bb1c600f0b60e802d8005a80c93202508832ec4013581289501340c009cac8),\n.INIT_7(256'h0070213d88c19c3870c1602100c8141310e942b40157998e002d8a5620b582c5),\n.INIT_8(256'h91ea0406e4d3c09c4808101534034c0a000a408ba0124d830059008af0231899),\n.INIT_9(256'h29c0b090212018284402e0028026084291e240c378ce402481d6cc3b580a20c8),\n.INIT_A(256'ha4494cc06401850401a0146d4c2040016140214020411468a088040f5482d410),\n.INIT_B(256'h00dca0250069082400b19d6c8474150c0074780428880c952d34a0c828451001),\n.INIT_C(256'h3e6e23481952000ac820d47802230c48096a298208626c85a63b164c026b034c),\n.INIT_D(256'hf031ea2120126152a1d200641a61b0e13218d188612820ba60986254e649d647),\n.INIT_E(256'hd5be9082ec6d1a993a6a25257b38590c8185c00458f130652ce801c611ea282a),\n.INIT_F(256'h2510a5750c9c25051011706108980109189c7040e87c87c693dd1ce40018e5cb)\n) _bn03 (\n.RDATA(insn0[7:6]),\n.RADDR(code_addr[10:0]),\n.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),\n.WCLK(clk), .WCLKE(unlocked), .WE(mem_wr & !mem_addr[12]),\n.WADDR(mem_addr[11:1]),\n.MASK(16'h0000), .WDATA(dout[7:6]));\n\nSB_RAM2048x2 #(\n.INIT_0(256'h1cf3400240702ba82082222881c98bbeae0a419c005eb01ea2a146e48b70e5ce),\n.INIT_1(256'h2080205ed5b04848d1fd22ea731908aa8b89242c8088a4424298c0c89818388a),\n.INIT_2(256'hc46888d4ae4a669c624a1091c94a801624c284fa495a488a086221029187ca8a),\n.INIT_3(256'he2d620290602e4b5620623a128350e822081e09aac3c7ce8909c3c42ee4ab03c),\n.INIT_4(256'h297a0a757c581c0020122b6c06483c7a0c222620e0010010e063d232be212c91),\n.INIT_5(256'h3c694b3f87310a7d84799418d45ae4546d7a786e715610464805404c00401a45),\n.INIT_6(256'ha8cd99314218444c090d4241c24c0a00b4bccca004031d07a63602010c3ca068),\n.INIT_7(256'h0121909890304226bcbc020eeaae3246523f84b1c49096311ef80a10a49c440c),\n.INIT_8(256'h10701258082c3f1a080504aa50fc442a34ecca0861252ca2048c8822141768a1),\n.INIT_9(256'h88ee1466405c82ea8482483e89ef8a1c0420c280062884a2ce1804209c9680b4),\n.INIT_A(256'h80e9a899d4f1b0808888a8481d9800d530d0942c412081a8404902f89d981c7a),\n.INIT_B(256'h8098f89dbc7c8154a0990448a9e5505c2c781814b0b428c9b8bc143968fda0c9),\n.INIT_C(256'h08a700398c6b4dffa8f9808990a6bd7070fb7b32ba789eaa8eb90602023b10cc),\n.INIT_D(256'h92ea4b6a8586c0bd929180a582d2f591549c105d30980203b07b46ab88fac5f3),\n.INIT_E(256'h0e1908034c3a0a9fd98e5cf108fa2e980602384e4cf83087cda51207e033c8e1),\n.INIT_F(256'h82cad4a2d8c7ca982efa054f8fe834d78cd210958da08292025c48d2514d80cd)\n) _bn04 (\n.RDATA(insn0[9:8]),\n.RADDR(code_addr[10:0]),\n.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),\n.WCLK(clk), .WCLKE(unlocked), .WE(mem_wr & !mem_addr[12]),\n.WADDR(mem_addr[11:1]),\n.MASK(16'h0000), .WDATA(dout[9:8]));\n\nSB_RAM2048x2 #(\n.INIT_0(256'h101800c4025406072282203180918ba12284b0cc20302094903428aa248dc42d),\n.INIT_1(256'h21a5200000c04850d52431a52040088000872228823422120040815908282010),\n.INIT_2(256'h448080402820304031e0a480c30182a02690a6384b0d128422882205840500d4),\n.INIT_3(256'h22841006646004c0221041c3201000981401304084c038d000900000b8408180),\n.INIT_4(256'h2124100030001412005620511108014140481010a09000123082004090902588),\n.INIT_5(256'h208080408181490080a050c00000c480401109286002004010400004080a042c),\n.INIT_6(256'h73c401ae00404450c0d083038a9a1c4c64c810c00106858c84801014040080e0),\n.INIT_7(256'h04341030989850404cd0000020c00808016008a9024081815062001804841454),\n.INIT_8(256'h48a8500042ec12901018108040b2024200a0004040540232001a001204277048),\n.INIT_9(256'h02e04460420043728280026400b800020020008000720a2882ca4270820410a8),\n.INIT_A(256'h40e100a19020008060a04058113120e830400c0000a0c1b9488048c80080005a),\n.INIT_B(256'h88841481514990c5b0e00050419000407c45048090c0006430f010a010818069),\n.INIT_C(256'h01a1006004400180c0c000c08001500070405041d0e090a210e9004102220088),\n.INIT_D(256'hcaea042c10109070008842709000008000d140481000004818d898f080b81181),\n.INIT_E(256'h1a8a1a9010781001c04018a050e8300002c00844160e100545650042524004a6),\n.INIT_F(256'h82c080a0409018001a80041100801450108000c00032008012404250010850c2)\n) _bn05 (\n.RDATA(insn0[11:10]),\n.RADDR(code_addr[10:0]),\n.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),\n.WCLK(clk), .WCLKE(unlocked), .WE(mem_wr & !mem_addr[12]),\n.WADDR(mem_addr[11:1]),\n.MASK(16'h0000), .WDATA(dout[11:10]));\n\nSB_RAM2048x2 #(\n.INIT_0(256'he71156007a00a72002002101d900af308e007d00b6600e00f7436a224e12b400),\n.INIT_1(256'h21010a50e1004a00f5106b0041003c009f006e04aa0243017400fb203e009800),\n.INIT_2(256'h76008c006f21dc00eb00a500eb212e001600fe007f014b0172000700ef04f620),\n.INIT_3(256'h36042b206700f5004a400300390cd610e521d8804410780014007b21ca000d00),\n.INIT_4(256'h631077001100171072427f40490869283200b200111012122302230039085500),\n.INIT_5(256'he9009f023301fd00415039000900441051003b10570110100500060a420a2560),\n.INIT_6(256'h4705c30254004448c500c3405f426d402c000c080f09a7802e121d00b4002400),\n.INIT_7(256'h050190083c10c4213d004c02a4024c02052a8910e2906302530050011d005c00),\n.INIT_8(256'h4b005a020600710216026a025e022600760a4202670226008e000a080f086300),\n.INIT_9(256'h22000642134287000600bf40c30016000600120232029b000210860086002b08),\n.INIT_A(256'h05003100b80010007c082020f1203c009000bc80d14159000c401a024f002200),\n.INIT_B(256'h6c505d481504990028006120692060600d00e50014003010312015004940f901),\n.INIT_C(256'h21005048c580f58011000308b7017341d402574296025602210107011e02d984),\n.INIT_D(256'h03098501150398001b025300c400cd4047490800da000b029f80990016102100),\n.INIT_E(256'h4f001b0872002101d5015c48070077040700371c0624930167017254c780c782),\n.INIT_F(256'hae00321053101a006b011f01470136004200350033001800620c52005d509e10)\n) _bn06 (\n.RDATA(insn0[13:12]),\n.RADDR(code_addr[10:0]),\n.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),\n.WCLK(clk), .WCLKE(unlocked), .WE(mem_wr & !mem_addr[12]),\n.WADDR(mem_addr[11:1]),\n.MASK(16'h0000), .WDATA(dout[13:12]));\n\nSB_RAM2048x2 #(\n.INIT_0(256'h10e6009400fa50b700de403d00cd007f4086003f01de008e00f610ca00dd00b5),\n.INIT_1(256'h02f800da003f01da00ec00eb008910fc401701fe40ba00ca00b800ef41be4098),\n.INIT_2(256'h316e00dc00ce009c04eb42ad1462007e005601fa00fe00ea00f200c710e90026),\n.INIT_3(256'h403600ab00ef007e00de0483223500d202e504980254217e429c007c004e420d),\n.INIT_4(256'h00730877005408030072007f004d006d102600b6c21d055a04cb00e744300051),\n.INIT_5(256'h10e500ff013f00fd805d009c00a90076007f005d085700562845006e205b0075),\n.INIT_6(256'h20cf08e3b05c407c20df20c7005d016c01ac10aa007f1067403e403d00f4807f),\n.INIT_7(256'h80754438002c01ac00bc906d012c10ec003d00ff00be007f107f29d040fc00bb),\n.INIT_8(256'h00fdb15e008600f7a81600ec00ff916a01fe348a00ef08f620de45ba00df14e1),\n.INIT_9(256'h00d419e4007c000d211000df007721d608d5649b014e00772057009329d6108d),\n.INIT_A(256'h00ad00b900d840b400bd00a400f000fc08dc00bd00f40048005c00bc00e911e6),\n.INIT_B(256'h017c007d00b500190068046900fd807c100d01f4105d007020f9008d00e520fd),\n.INIT_C(256'h0886807a00df00ff043b001f40bd08f700de001f2116007a08458063023e00ff),\n.INIT_D(256'h14091085409404d8001f0cf300cc204d10ed049a30de046b00ff00dd00760061),\n.INIT_E(256'h00eb20d7008600e500dc02c000a700f708e600ef00e200b308c6086600ef08c7),\n.INIT_F(256'h006e005b087720df00ef20df00e600fe08e600fd08d7003d00ef00bea05e003e)\n) _bn07 (\n.RDATA(insn0[15:14]),\n.RADDR(code_addr[10:0]),\n.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),\n.WCLK(clk), .WCLKE(unlocked), .WE(mem_wr & !mem_addr[12]),\n.WADDR(mem_addr[11:1]),\n.MASK(16'h0000), .WDATA(dout[15:14]));\n\nSB_RAM2048x2 #(\n.INIT_0(256'hfcfdfcfcfffcfdfffffdfcfefefdfdfefefdfcfefefffefdfcfcfffdfefefefd),\n.INIT_1(256'hfdfefdfcfffdfefefcfefcfcfffcfefefdfffffffffcfffcfcfcfffefdfefdfc),\n.INIT_2(256'hfdfcfefffefcfefcfffffffefffefdfcfefefdfdfdfcfffcfdfcfdfcfdfefffc),\n.INIT_3(256'hfdfefefefcfdfdfcfdfefcfcfcfefdfdfffefefdfefcfcfdfefdfcfdfffdfcfc),\n.INIT_4(256'hfefcfcfffefcfefefefcfcfefefdfcfefffcfdfffffefefffdfcfdfdfffcfcfd),\n.INIT_5(256'hfffffefdfcfdfefffdfffefffefdfcfcfefcfefdfefcfcfcfffcfdfffcfcfcff),\n.INIT_6(256'hfefefefcfefefcfefcfcfcfefefefefefefcfefcfefefefefffcfefffffefffe),\n.INIT_7(256'hfefefefcfcfcfefcfefcfefefefefefefcfefcfefefefcfcfefcfefefefefcfe),\n.INIT_8(256'hfffefffefffdfcfcfcfefcfefcfcfcfefcfcfefcfcfcfcfefcfcfefcfcfcfefe),\n.INIT_9(256'hfcfcfffdfcfefdfffffdfdfdfffffffffffcfcfdfdfdfffdfffcfffefefefffe),\n.INIT_A(256'hfdfdfdfefcfcfdfcfffefffcfffefdfcfefffffefffcfcfdfcfcfefefefdfefd),\n.INIT_B(256'hfdfcfcfcfdfdfdfdfffcfffdfffdfcfefcfdfffdfffdfffdfdfefcfffcfffefc),\n.INIT_C(256'hfefffffefffefefffefefefefefffffffffefefefefefefffffffffffffeffff),\n.INIT_D(256'hfefffffefefffffefefefefffefffffefefefefffffefffffefefefefefffeff),\n.INIT_E(256'hfefffffefefefefefefffffffefffffefffefffffffffefefefffefffffffefe),\n.INIT_F(256'hfefefffffffefffefefefffffffefffffefffefffefffefefffffffefffeffff)\n) _bn10 (\n.RDATA(insn1[1:0]),\n.RADDR(code_addr[10:0]),\n.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),\n.WCLK(clk), .WCLKE(unlocked), .WE(mem_wr & mem_addr[12]),\n.WADDR(mem_addr[11:1]),\n.MASK(16'h0000), .WDATA(dout[1:0]));\n\nSB_RAM2048x2 #(\n.INIT_0(256'hfefdfffefefcfdfdfcfefffffefcfcfefcfefffffcfffffdfdfcfcfdfcfffffd),\n.INIT_1(256'hfefefefffdfdfffdfcfdfdfdfefdfdfefcfefdfcfefffcfdfcfffcfcfcfefcfe),\n.INIT_2(256'hfffffdfdfefefcfdfcfcfffdfcfdfffcfdfdfdfcfcfdfefcfefcfffdfcfcfefc),\n.INIT_3(256'hfdfffdfefffefefdfffefcfffcfefefefcfcfcfffcfefcfcfffdfefefcfefcfc),\n.INIT_4(256'hfcfdfffcfefdfffdfcfdfefdfffcfffcfcfcfefdfdfcfffdfffdfcfffffdffff),\n.INIT_5(256'hfcfffefffdfcfdfffcfefdfcfdfcfffffefcfcfcfefcfffefefdfcfcfefefefd),\n.INIT_6(256'hfefcfcfefefefefcfcfefcfcfefefcfcfefcfcfefefcfdfdfdfefcfcfefcfcfd),\n.INIT_7(256'hfcfcfefefefefcfcfcfefefcfcfcfefefefcfefefefefcfefcfefefefcfcfefe),\n.INIT_8(256'hfcfefcfefefcfcfcfcfefefcfcfefcfcfefefcfefcfcfcfefcfefcfcfcfcfefe),\n.INIT_9(256'hfefdfdfefffffdfffcfefefefdfdfcfefffcfdfdfcfcfcfdfcfdfefdfcfdfcfc),\n.INIT_A(256'hfffdfcfdfcfcfdfdfefffefffcfdfffefcfdfcfffefcfdfdfdfdfefefcfdfefc),\n.INIT_B(256'hfcfdfcfcfcfcfefcfffdfefffcfefffffffdfefcfcfffdfffffffcfffffcffff),\n.INIT_C(256'hfefefffefffffffffefefefefefffefefefefffefefefefefffefffffefffefe),\n.INIT_D(256'hfefffffffffffefefefffefffffffffefffffefefefffffefefffefefffefeff),\n.INIT_E(256'hfefefefffffefffefffefffffefffefefefffffffefffefefefffffffffefffe),\n.INIT_F(256'hfefefefefefefffefffffefefefffffefffffefffefffefefffefefffefefffe)\n) _bn11 (\n.RDATA(insn1[3:2]),\n.RADDR(code_addr[10:0]),\n.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),\n.WCLK(clk), .WCLKE(unlocked), .WE(mem_wr & mem_addr[12]),\n.WADDR(mem_addr[11:1]),\n.MASK(16'h0000), .WDATA(dout[3:2]));\n\nSB_RAM2048x2 #(\n.INIT_0(256'hfefffcfdfefefdfcfcfcfcfefffefcfcfcfcfdfffffdfcfffcfdfffcfffcfdfe),\n.INIT_1(256'hfdfcfefefefffefcfefdfefdfdfcfffefefcfcfdfdfffdfcfcfcfffefffcfcfc),\n.INIT_2(256'hfdfefcfffefcfdfcfdfffffcfcfefffffcfcfdfdfdfcfffcfefffdfcfdfcfffd),\n.INIT_3(256'hfdfcfffefdfcfcfefffefcfefcfcfffffdfdfefefffcfdfffcfffffcfcfcfefd),\n.INIT_4(256'hfdfcfffefcfcfefcfcfdfefefdfefffcfcfcfffffcfcfefdfffcfdfefffefefd),\n.INIT_5(256'hfcfdfdfcfffefdfefffcfcfcfefdfefefcfcfcfffdfefcfdfefdfcfdfcfcfefc),\n.INIT_6(256'hfefcfefefefefefefefcfefefefcfcfefefefcfcfefcfcfefefefcfefffdfdfe),\n.INIT_7(256'hfcfcfefcfcfefefefefefefcfcfefefefcfefcfcfcfcfefcfefefefefcfefefe),\n.INIT_8(256'hfdfcfefcfcfefcfcfcfcfcfefcfcfcfefefefefcfefefefefcfcfefefefcfcfe),\n.INIT_9(256'hfcfefcfdfcfefcfcfffcfcfffcfefffcfcfffcfdfcfefcfdfdfdfffcfcfefdfe),\n.INIT_A(256'hfcfefffefdfdfdfcfffefcfcfdfefdfffcfefffcfcfefdfdfcfefcfcfdfcfffe),\n.INIT_B(256'hfdfcfdfdfdfdfdfefffefcfcfdfcfcfefcfffffffffcfdfcfdfefcfcfefefefc),\n.INIT_C(256'hfffefefefefefffffffefefffffefefefffffefffefefefffffffefefefefeff),\n.INIT_D(256'hfffffffefffefffffffffffefefefefffefefefefffffffefffffffffffefffe),\n.INIT_E(256'hfffefefefefefefffffefffffefefffffffffffefefefffffefefffffffefeff),\n.INIT_F(256'hfefefffffefefefffefefefefffffffffefefefffefffefffffffffffffffffe)\n) _bn12 (\n.RDATA(insn1[5:4]),\n.RADDR(code_addr[10:0]),\n.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),\n.WCLK(clk), .WCLKE(unlocked), .WE(mem_wr & mem_addr[12]),\n.WADDR(mem_addr[11:1]),\n.MASK(16'h0000), .WDATA(dout[5:4]));\n\nSB_RAM2048x2 #(\n.INIT_0(256'hfefefefcfefefcfdfefcfcfcfefefcfcfefcfdfdfdfdfcfefcfcfcfefcfdfcff),\n.INIT_1(256'hfcfffcfefcfefdfefcfffcfcfdfcfffcfdfffcfcfdfcfcfffdfcfcfefcfefcfc),\n.INIT_2(256'hfdfdfdfdfefefcfdfcfdfefdfcfcfcfefdfcfcfefdfefdfcfefefcfefcfcfcfd),\n.INIT_3(256'hfcfdfefdfefdfcfcfcfdfcfefcfefcfdfcfdfefefcfdfdfffffffcfdfcfcfcfd),\n.INIT_4(256'hfefdfcfffcfefffcfefdfdfefcfefcfcfefcfcfffcfefefcfffffcfefdfdfcfe),\n.INIT_5(256'hfefdfcfffcfdfcfffcfffcfcfffcfdfefefcfefcfffdfefdfefcfcfcfdfffcfd),\n.INIT_6(256'hfefcfefefefefcfefcfcfcfefcfcfcfcfcfcfcfcfefcfdfcfffdfcfcfffcfdfc),\n.INIT_7(256'hfcfcfefefcfcfefcfefcfefefcfefcfcfcfefcfcfcfcfefefefefefefcfcfcfe),\n.INIT_8(256'hfefcfcfcfdfffcfcfcfcfcfefcfcfcfcfefcfefefcfefcfefcfcfefcfefefcfe),\n.INIT_9(256'hfefcfefcfdfcfcfcfefdfcfcfcfcfcfdfdfffdfcfdfdfffcfffcfefdfdfcfcfc),\n.INIT_A(256'hfcfcfffcfcfcfcfefdfefefcfdfcfcfcfcfcfcfdfcfefcfcfdfcfcfcfefdfeff),\n.INIT_B(256'hfdfcfcfcfcfdfcfdfefffefcfefdfdfcfcfcfffefefcfefdfcfdfcfcfcfffdfc),\n.INIT_C(256'hfefffefefffefefefefffefefefffefefefffefefffffefefefefefefffffefe),\n.INIT_D(256'hfefffefffefefefffefffefffefefffefffefefefffefefffefffefffefffeff),\n.INIT_E(256'hfefffefefffffefefffffffffefefefffefffefffefefffefffffefefefffefe),\n.INIT_F(256'hfefefefffefefffffffefefffefffefefefffffefffefffffefefefffefffeff)\n) _bn13 (\n.RDATA(insn1[7:6]),\n.RADDR(code_addr[10:0]),\n.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),\n.WCLK(clk), .WCLKE(unlocked), .WE(mem_wr & mem_addr[12]),\n.WADDR(mem_addr[11:1]),\n.MASK(16'h0000), .WDATA(dout[7:6]));\n\nSB_RAM2048x2 #(\n.INIT_0(256'hfcfefcfdfefefcfefcfdfefefefffcfefdfdfffffdfefdfdfdfcfefffcfefdfd),\n.INIT_1(256'hfffdfcfdfcfcfcfefefdfcfefdfdfffefffffefcfefcfcfdfdfdfcfcfcfcfdfc),\n.INIT_2(256'hfcfefcfffcfcfcfcfcfffcfdfcfffcfcfefcfefcfffdfffcfcfcfefcfcfcfefc),\n.INIT_3(256'hfcfefefffcfcfdfffcfefdfffcfefcfffcfffcfdfcfcfcfdfcfdfcfefcfefcfc),\n.INIT_4(256'hfcfcfdfcfdfcfcfcfcfdfdfdfcfcfcfefdfcfcfcfcfdfdfdfcfcfcfffcfcfcff),\n.INIT_5(256'hfcfdfcfffcfcfcfefdfffffffefcfefcfefcfefcfefcfcfcfefcfefffffcfcff),\n.INIT_6(256'hfcfcfcfcfefefcfcfcfcfcfefcfcfcfefefefcfcfcfcfcfefcfcfdfffcfcfdff),\n.INIT_7(256'hfcfefcfcfcfcfcfcfcfcfcfcfcfefcfefcfcfcfcfcfefcfcfcfcfefefcfefcfe),\n.INIT_8(256'hfcfcfdfffcfcfcfcfcfcfcfcfcfcfcfcfcfefcfcfcfcfcfefcfcfefcfcfcfcfe),\n.INIT_9(256'hfdfffcfdfefefcfdfcfcfdfffcfffcfefcfcfcfcfdfdfcfcfcfcfcfdfdfffcfe),\n.INIT_A(256'hfcfffdfffdfefcfcfdfdfdfcfdfffdfefcfefcfefdfdfcfdfcfcfcfefcfcffff),\n.INIT_B(256'hfdfdfdfcfcfdfcfffefefcfffcfdfefefdfffffefcfffdfcfefefcfdfcfdfcfc),\n.INIT_C(256'hfffefffffefffefefefffefefefefefefefffefffefefefefefefefffefefeff),\n.INIT_D(256'hfefefefefefffefffffffffffffefefffefefefefefefefffefefefffffefeff),\n.INIT_E(256'hfffefefffefffefffffefefffefefefefefffffefffffefffefefefefefffeff),\n.INIT_F(256'hfefefefefefffefffefefffffefffffffefefffffffffffefffffefffefefeff)\n) _bn14 (\n.RDATA(insn1[9:8]),\n.RADDR(code_addr[10:0]),\n.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),\n.WCLK(clk), .WCLKE(unlocked), .WE(mem_wr & mem_addr[12]),\n.WADDR(mem_addr[11:1]),\n.MASK(16'h0000), .WDATA(dout[9:8]));\n\nSB_RAM2048x2 #(\n.INIT_0(256'hfcfcfcfdfdfcfefdfdfffefcfcfdfffcfdfffffdfcfdfdfefcfcfcfefcfcfdff),\n.INIT_1(256'hfdfffcfcfcfcfcfefcfcfffefefefcfcfcfefffefcfcfcfcfcfcfcfcfcfeffff),\n.INIT_2(256'hfcfdfcfefcfefcfcfcfffcfdfcfffcfefefefcfdfcfcfdfcfffcfcfdfefefcfd),\n.INIT_3(256'hfcfcfdfcfcfdfcfffefcfcfcfcfcfefdfcfefcfffcfcfefcfcfcfefdfcfefcfc),\n.INIT_4(256'hfcfcfdfdfcfdfcfcfcfcfcfcfcfcfefcfdfdfcfcfcfdfdfcfcfffcfcfcfdfcff),\n.INIT_5(256'hfcfdfdfdfdfdfcfefdfffdfcfcfcfcfcfcfcfcfcfcfcfdfcfcfcfefffcfcfefc),\n.INIT_6(256'hfcfcfcfefefefcfcfcfcfefcfcfcfcfefcfefcfcfcfcfcfefcfcfdfffcfcfcfe),\n.INIT_7(256'hfcfefcfcfcfcfcfcfcfcfcfefefcfcfefcfcfcfcfcfefcfefcfefefefcfefefc),\n.INIT_8(256'hfcfcfcfcfcfefcfcfcfcfcfcfcfcfcfcfefcfcfcfcfcfefefcfefcfcfcfcfefc),\n.INIT_9(256'hfefcfcfefefcfcfdfdfcfcfcfcfffdfcfcfefdfcfcfcfdfcfcfcfcfcfcfefcfe),\n.INIT_A(256'hfcfffefcfdfefefdfcfcfdfcfcfefdfcfcfefcfcfdfffcfcfcfcfcfefcfcfcfc),\n.INIT_B(256'hfcfcfdfcfcfdfcfefcfdfefdfcfefefcfdfefcfdfefcfcfffefdfcfdfcfcfcfc),\n.INIT_C(256'hfefffefefefefefefefefefefffefffefefefefffffefefefefffefffffefeff),\n.INIT_D(256'hfefffefefffefefffffffefefefefefefefefefefefefefefefefeffffffffff),\n.INIT_E(256'hfefefffffefefefffefefefefefefefffefffffffefefefefefefefefefefeff),\n.INIT_F(256'hfefefefefffffefefefefefefefefefefefffefefefefefffefefefefefefeff)\n) _bn15 (\n.RDATA(insn1[11:10]),\n.RADDR(code_addr[10:0]),\n.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),\n.WCLK(clk), .WCLKE(unlocked), .WE(mem_wr & mem_addr[12]),\n.WADDR(mem_addr[11:1]),\n.MASK(16'h0000), .WDATA(dout[11:10]));\n\nSB_RAM2048x2 #(\n.INIT_0(256'hfcfffefcfcfcfffcfdfcfefdfcfcfefcfdfcfefcfefcfdfcfcfcfdfefefcfdfc),\n.INIT_1(256'hfdfcfdfcfefdfffcfefefefcfefefcfcfefefffcfcfefcfcfcfcfcfcfefcfffc),\n.INIT_2(256'hfcfcfcfcfdfcfcfcfdfcfdfdfdfdfefffffcfcfefcfefcfefcfcfcfefefefdff),\n.INIT_3(256'hfefcfdfcfffdfdfdfcfdfcfcfcfcfffcfdfcfdfcfcfdfcfcfcfcfffcfdfdfcfd),\n.INIT_4(256'hfcfcfdfcfdfcfcfdfcfcfcfcfcfcfcfcfdfcfcfdfcfcfdfcfcfcfdfcfefcfefe),\n.INIT_5(256'hfcfcfcfdfdfcfdfdfffcfefffcfffdfefcfefcfefcfefffcfcfefcfefcfefcfc),\n.INIT_6(256'hfcfcfcfcfefefcfcfcfcfefcfcfcfcfcfcfcfcfcfcfcfdfcfcfdfcfdfcfdfcfc),\n.INIT_7(256'hfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfefcfcfcfc),\n.INIT_8(256'hfcfcfffdfcfdfcfcfcfcfcfcfcfcfcfcfefcfcfcfcfcfefcfefcfcfefcfcfefc),\n.INIT_9(256'hfffcfcfdfffcfcfcfcfcfcfcfcfcfefcfcfcfcfcfcfcfdfcfcfcfcfcfcfcfcfc),\n.INIT_A(256'hfcfcfefcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfefcfdfcfcfdfdfcfcfcfcfcfdfd),\n.INIT_B(256'hfcfcfcfcfdfcfdfcfdfcfffcfcfdfffcfdfcfcfcfffcfdfcfffcfdfcfcfdfdfc),\n.INIT_C(256'hfffffffffefffefefefefefefffffffefefffefefefefefefefefefefffefefe),\n.INIT_D(256'hfffffffffffefffefffefffffffffefffffefefefefefefefefefffffffefffe),\n.INIT_E(256'hfffffffefefffefefefefefefefefffffffefffefffefefffefefefefefefefe),\n.INIT_F(256'hfefefefefffefefffffefefefefefefefefefefefefefefefefefefefefefffe)\n) _bn16 (\n.RDATA(insn1[13:12]),\n.RADDR(code_addr[10:0]),\n.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),\n.WCLK(clk), .WCLKE(unlocked), .WE(mem_wr & mem_addr[12]),\n.WADDR(mem_addr[11:1]),\n.MASK(16'h0000), .WDATA(dout[13:12]));\n\nSB_RAM2048x2 #(\n.INIT_0(256'hfcfcfcfefcfffcfdfcfffcfefcfefcfdfcfefcfefcfefcfffefdfefdfcfefcff),\n.INIT_1(256'hfcfdfcfdfcfcfcfffcfffcfefcfffdfefcfffcfefcfdfcfdfefdfdfcfcfefcfe),\n.INIT_2(256'hfcfefcfffdfefefcfcfffcfffcfffcfefcfdfcfdfcfdfdfcfcfdfefdfcfefcfd),\n.INIT_3(256'hfcfefcfffcfffcfffcfcfcfefdfefcfdfcfffcfffcfefcfefcfffcfdfcfffefc),\n.INIT_4(256'hfcfefcfffefdfcfcfcfefcfffffcfcfcfcfefcfefefcfcfdfcfffcfffcfdfcff),\n.INIT_5(256'hfcfffcfffefdfcfffcfffcfffcfcfcfdfdfcfcfdfcfdfcfefefdfcfffcfdfcfd),\n.INIT_6(256'hfcfefcfefefefcfefefcfcfcfcfefcfefcfefefcfcfefcfffdfefcfffcfefcfe),\n.INIT_7(256'hfcfefcfefcfefcfefcfefcfefcfefcfefcfefefcfcfefcfefcfefefcfcfefcfc),\n.INIT_8(256'hfcfefcfffcfefefcfcfefcfefefcfcfefcfcfcfefcfcfcfefcfefcfcfcfcfcfc),\n.INIT_9(256'hfcfdfcfefcfffcfffcfffcfffcfffcfffcfffefcfefdfcfefcfffcfffcfffdfe),\n.INIT_A(256'hfcfffcfdfdfefcfffefdfdfefcfffdfefcfffcfefcfffefcfefdfdfefcfefcff),\n.INIT_B(256'hfcfdfdfcfcfdfcfdfcfffcfdfcfefcfffcfffcfffcfdfcfffcfffcfffcfefefd),\n.INIT_C(256'hfefffefffefefefefefffffefefffefffefefefefefefefffefffefffefefeff),\n.INIT_D(256'hfefffefffefffefffefffefffefffefefefffffefefffefffefefefffefffefe),\n.INIT_E(256'hfefffefffefefefefefffffefefffefffefffefffefffefefefefefffefffeff),\n.INIT_F(256'hfffefefefefffefefefffefffefffefffefffefffefffefffefffefffefefeff)\n) _bn17 (\n.RDATA(insn1[15:14]),\n.RADDR(code_addr[10:0]),\n.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),\n.WCLK(clk), .WCLKE(unlocked), .WE(mem_wr & mem_addr[12]),\n.WADDR(mem_addr[11:1]),\n.MASK(16'h0000), .WDATA(dout[15:14]));\n\nreg c11;\nalways @(posedge clk) c11 <= code_addr[11];\nwire [15:0] cm = {16{c11}};\nassign insn = (cm & insn1) | (~cm & insn0);\n// assign insn = c11 ? insn1 : insn0;\n\n ",
            "params": [],
            "ports": {
              "in": [
                {
                  "name": "pclk"
                },
                {
                  "name": "resetq"
                },
                {
                  "name": "RX"
                }
              ],
              "out": [
                {
                  "name": "TX"
                },
                {
                  "name": "D",
                  "range": "[4:0]",
                  "size": 5
                }
              ]
            }
          },
          "position": {
            "x": 112,
            "y": -144
          },
          "size": {
            "width": 616,
            "height": 520
          }
        }
      ],
      "wires": [
        {
          "source": {
            "block": "af61474a-9c2e-4521-91e3-484df325351b",
            "port": "out"
          },
          "target": {
            "block": "ac824ce9-e479-4150-9f46-0978e99540bb",
            "port": "pclk"
          }
        },
        {
          "source": {
            "block": "314fff6c-8caa-4e10-a7c8-f8e0bc866d8c",
            "port": "out"
          },
          "target": {
            "block": "ac824ce9-e479-4150-9f46-0978e99540bb",
            "port": "resetq"
          }
        },
        {
          "source": {
            "block": "ac824ce9-e479-4150-9f46-0978e99540bb",
            "port": "D"
          },
          "target": {
            "block": "baa97a1d-08df-45a4-835f-9076539a39cc",
            "port": "in"
          },
          "size": 5
        },
        {
          "source": {
            "block": "ac824ce9-e479-4150-9f46-0978e99540bb",
            "port": "TX"
          },
          "target": {
            "block": "f294cce9-d520-4691-9891-57b2e9662b09",
            "port": "in"
          }
        },
        {
          "source": {
            "block": "8c898076-5393-4f25-ae59-8272cb54fdc4",
            "port": "out"
          },
          "target": {
            "block": "ac824ce9-e479-4150-9f46-0978e99540bb",
            "port": "RX"
          }
        }
      ]
    }
  },
  "dependencies": {}
}