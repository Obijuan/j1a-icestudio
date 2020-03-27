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
          "id": "f6dbe6a2-7a5b-4b8a-81f8-75000d0082fa",
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
            "x": -384,
            "y": -8
          }
        },
        {
          "id": "51ffc131-a0be-4402-8d8a-d493aa097f71",
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
            "x": 768,
            "y": 32
          }
        },
        {
          "id": "ad21df2a-1a7c-41be-b4bc-d92a7dec1a0d",
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
            "x": -64,
            "y": 176
          }
        },
        {
          "id": "474f9a61-9b0b-45a7-8ac1-13757b0a9153",
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
            "x": 896,
            "y": 208
          }
        },
        {
          "id": "65e5ed38-6c4c-4aab-8069-c328e953e98c",
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
            "y": 296
          }
        },
        {
          "id": "b09be0dc-b4ab-4c33-9b1d-7a7a1f2f097e",
          "type": "basic.constant",
          "data": {
            "name": "",
            "value": "\"nuc.list\"",
            "local": false
          },
          "position": {
            "x": 416,
            "y": -80
          }
        },
        {
          "id": "6a701f7c-b355-4bd9-9b0e-c6cfd974a2fe",
          "type": "basic.code",
          "data": {
            "code": "SB_PLL40_CORE #(.FEEDBACK_PATH(\"SIMPLE\"),\n                .PLLOUT_SELECT(\"GENCLK\"),\n                .DIVR(4'b0000),\n                .DIVF(7'd3),\n                .DIVQ(3'b000),\n                .FILTER_RANGE(3'b001),\n) uut (\n .REFERENCECLK(pclk),\n .PLLOUTCORE(clk),\n //.PLLOUTGLOBAL(clk),\n // .LOCK(D5),\n .RESETB(1'b1),\n .BYPASS(1'b0)\n);",
            "params": [],
            "ports": {
              "in": [
                {
                  "name": "pclk"
                }
              ],
              "out": [
                {
                  "name": "clk"
                }
              ]
            }
          },
          "position": {
            "x": -208,
            "y": -72
          },
          "size": {
            "width": 336,
            "height": 184
          }
        },
        {
          "id": "a9d1a7b7-5129-4f5f-9403-62eaad3cd393",
          "type": "basic.code",
          "data": {
            "code": "// @include j1.v\n// @include mem.v\n// @include stack2.v\n// @include uart.v\n// @include nuc.list\n\n   localparam MHZ = 12;\n\n\n wire io_rd, io_wr;\n  wire [15:0] mem_addr;\n  wire mem_wr;\n  wire [15:0] dout;\n  wire [15:0] io_din;\n  wire [12:0] code_addr;\n  reg unlocked = 0;\n\n  j1 _j1(\n    .clk(clk),\n    .resetq(resetq),\n    .io_rd(io_rd),    //-- output\n    .io_wr(io_wr),    //-- output\n    .mem_wr(mem_wr),  //-- output\n    .dout(dout),      //-- output\n    .io_din(io_din),  //-- input\n    .mem_addr(mem_addr),  //-- output\n    .code_addr(code_addr), //-- output (13 bits)\n    .insn(insn));          //-- input\n\n  // ######   IO SIGNALS   ####################################\n\n\twire io_wr_ = io_wr, io_rd_ = io_rd;\n\twire [15:0] dout_ = dout; //--\n\twire [15:0] io_addr_ = mem_addr;\n\n\n  // ######   UART   ##########################################\n\n  wire uart0_valid, uart0_busy;\n  wire [7:0] uart0_data;\n  wire uart0_wr = io_wr_ & io_addr_[12];\n  wire uart0_rd = io_rd_ & io_addr_[12];\n  wire uart_RXD = RX;\n\n  buart _uart0 (\n     .clk(clk),\n     .resetq(1'b1),\n     .rx(uart_RXD),\n     .tx(TX),\n     .rd(uart0_rd),\n     .wr(uart0_wr),\n     .valid(uart0_valid),\n     .busy(uart0_busy),\n     .tx_data(dout_[7:0]),\n     .rx_data(uart0_data));\n\n  wire [4:0] LEDS;\n  wire w4 = io_wr_ & io_addr_[2];\n\n\n\tSB_IO #(.PIN_TYPE(6'b0101_01)) _io0 (\n        .PACKAGE_PIN(D[4]),\n        .CLOCK_ENABLE(w4),\n        .OUTPUT_CLK(clk),\n        .D_OUT_0(dout_[0]),\n        .D_IN_0(LEDS[0]));\n\n\tSB_IO #(.PIN_TYPE(6'b0101_01)) _io1 (\n\t        .PACKAGE_PIN(D[3]),\n\t        .CLOCK_ENABLE(w4),\n\t        .OUTPUT_CLK(clk),\n\t        .D_OUT_0(dout_[1]),\n\t        .D_IN_0(LEDS[1]));\n\n\n  SB_IO #(.PIN_TYPE(6'b0101_01)) _io2 (\n\t\t\t\t\t.PACKAGE_PIN(D[2]),\n\t\t\t\t\t.CLOCK_ENABLE(w4),\n\t\t\t\t\t.OUTPUT_CLK(clk),\n\t\t\t\t\t.D_OUT_0(dout_[2]),\n\t\t\t\t\t.D_IN_0(LEDS[2]));\n\n\n\tSB_IO #(.PIN_TYPE(6'b0101_01)) _io3 (\n\t        .PACKAGE_PIN(D[1]),\n\t        .CLOCK_ENABLE(w4),\n\t        .OUTPUT_CLK(clk),\n\t        .D_OUT_0(dout_[3]),\n\t        .D_IN_0(LEDS[3]));\n\n\n\tSB_IO #(.PIN_TYPE(6'b0101_01)) _io4 (\n\t        .PACKAGE_PIN(D[0]),\n\t        .CLOCK_ENABLE(w4),\n\t        .OUTPUT_CLK(clk),\n\t        .D_OUT_0(dout_[4]),\n\t        .D_IN_0(LEDS[4]));\n\n  assign io_din =\n    (io_addr_[12] ? {8'd0, uart0_data}                                  : 16'd0) |\n    (io_addr_[13] ? {11'd0, 1'b1, 1'b1, 1'b1, uart0_valid, !uart0_busy} : 16'd0);\n\n\n\n  always @(negedge resetq or posedge clk)\n    if (!resetq)\n      unlocked <= 0;\n    else\n      unlocked <= unlocked | io_wr_;\n/*\nwire we0 = mem_wr & !mem_addr[12];\nwire we1 = mem_wr & mem_addr[12];\nwire wclke0 = unlocked;\nwire wclke1 = unlocked;\n*/\n\nwire we0 = 1'b1;\nwire we1 = 1'b1;\nwire wclke0 = mem_wr & !mem_addr[12] & unlocked;\nwire wclke1 = mem_wr & mem_addr[12] & unlocked;\n\n//---------------------- memory\n\nwire [15:0] insn0, insn1;\nwire [15:0] insn;\n\n//-- Definición de la tabla\n//-- Tabla de TAM elementos de M bits\nreg [15:0] tabla[0:4095];\n\n//-- Read the table\nalways @(posedge clk)\n  insn0 <= tabla[code_addr[10:0]];\n\n//-- Puerto escritura\nalways @(posedge clk)\n  if (wclke0)\n      tabla[mem_addr[11:1]] <= dout;\n\n//-- Init table from PROG parameter\ninitial begin\n  if (PROG) $readmemh(PROG, tabla);\nend\n\n\n\n\nSB_RAM2048x2 #(\n.INIT_0(256'hfcfdfcfcfffcfdfffffdfcfefefdfdfefefdfcfefefffefdfcfcfffdfefefefd),\n.INIT_1(256'hfdfefdfcfffdfefefcfefcfcfffcfefefdfffffffffcfffcfcfcfffefdfefdfc),\n.INIT_2(256'hfdfcfefffefcfefcfffffffefffefdfcfefefdfdfdfcfffcfdfcfdfcfdfefffc),\n.INIT_3(256'hfdfefefefcfdfdfcfdfefcfcfcfefdfdfffefefdfefcfcfdfefdfcfdfffdfcfc),\n.INIT_4(256'hfefcfcfffefcfefefefcfcfefefdfcfefffcfdfffffefefffdfcfdfdfffcfcfd),\n.INIT_5(256'hfffffefdfcfdfefffdfffefffefdfcfcfefcfefdfefcfcfcfffcfdfffcfcfcff),\n.INIT_6(256'hfefefefcfefefcfefcfcfcfefefefefefefcfefcfefefefefffcfefffffefffe),\n.INIT_7(256'hfefefefcfcfcfefcfefcfefefefefefefcfefcfefefefcfcfefcfefefefefcfe),\n.INIT_8(256'hfffefffefffdfcfcfcfefcfefcfcfcfefcfcfefcfcfcfcfefcfcfefcfcfcfefe),\n.INIT_9(256'hfcfcfffdfcfefdfffffdfdfdfffffffffffcfcfdfdfdfffdfffcfffefefefffe),\n.INIT_A(256'hfdfdfdfefcfcfdfcfffefffcfffefdfcfefffffefffcfcfdfcfcfefefefdfefd),\n.INIT_B(256'hfdfcfcfcfdfdfdfdfffcfffdfffdfcfefcfdfffdfffdfffdfdfefcfffcfffefc),\n.INIT_C(256'hfefffffefffefefffefefefefefffffffffefefefefefefffffffffffffeffff),\n.INIT_D(256'hfefffffefefffffefefefefffefffffefefefefffffefffffefefefefefffeff),\n.INIT_E(256'hfefffffefefefefefefffffffefffffefffefffffffffefefefffefffffffefe),\n.INIT_F(256'hfefefffffffefffefefefffffffefffffefffefffefffefefffffffefffeffff)\n) _bn10 (\n.RDATA(insn1[1:0]),\n.RADDR(code_addr[10:0]),\n.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),\n.WCLK(clk), .WCLKE(wclke1), .WE(we1),\n.WADDR(mem_addr[11:1]),\n.MASK(16'h0000), .WDATA(dout[1:0]));\n\nSB_RAM2048x2 #(\n.INIT_0(256'hfefdfffefefcfdfdfcfefffffefcfcfefcfefffffcfffffdfdfcfcfdfcfffffd),\n.INIT_1(256'hfefefefffdfdfffdfcfdfdfdfefdfdfefcfefdfcfefffcfdfcfffcfcfcfefcfe),\n.INIT_2(256'hfffffdfdfefefcfdfcfcfffdfcfdfffcfdfdfdfcfcfdfefcfefcfffdfcfcfefc),\n.INIT_3(256'hfdfffdfefffefefdfffefcfffcfefefefcfcfcfffcfefcfcfffdfefefcfefcfc),\n.INIT_4(256'hfcfdfffcfefdfffdfcfdfefdfffcfffcfcfcfefdfdfcfffdfffdfcfffffdffff),\n.INIT_5(256'hfcfffefffdfcfdfffcfefdfcfdfcfffffefcfcfcfefcfffefefdfcfcfefefefd),\n.INIT_6(256'hfefcfcfefefefefcfcfefcfcfefefcfcfefcfcfefefcfdfdfdfefcfcfefcfcfd),\n.INIT_7(256'hfcfcfefefefefcfcfcfefefcfcfcfefefefcfefefefefcfefcfefefefcfcfefe),\n.INIT_8(256'hfcfefcfefefcfcfcfcfefefcfcfefcfcfefefcfefcfcfcfefcfefcfcfcfcfefe),\n.INIT_9(256'hfefdfdfefffffdfffcfefefefdfdfcfefffcfdfdfcfcfcfdfcfdfefdfcfdfcfc),\n.INIT_A(256'hfffdfcfdfcfcfdfdfefffefffcfdfffefcfdfcfffefcfdfdfdfdfefefcfdfefc),\n.INIT_B(256'hfcfdfcfcfcfcfefcfffdfefffcfefffffffdfefcfcfffdfffffffcfffffcffff),\n.INIT_C(256'hfefefffefffffffffefefefefefffefefefefffefefefefefffefffffefffefe),\n.INIT_D(256'hfefffffffffffefefefffefffffffffefffffefefefffffefefffefefffefeff),\n.INIT_E(256'hfefefefffffefffefffefffffefffefefefffffffefffefefefffffffffefffe),\n.INIT_F(256'hfefefefefefefffefffffefefefffffefffffefffefffefefffefefffefefffe)\n) _bn11 (\n.RDATA(insn1[3:2]),\n.RADDR(code_addr[10:0]),\n.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),\n.WCLK(clk), .WCLKE(wclke1), .WE(we1),\n.WADDR(mem_addr[11:1]),\n.MASK(16'h0000), .WDATA(dout[3:2]));\n\nSB_RAM2048x2 #(\n.INIT_0(256'hfefffcfdfefefdfcfcfcfcfefffefcfcfcfcfdfffffdfcfffcfdfffcfffcfdfe),\n.INIT_1(256'hfdfcfefefefffefcfefdfefdfdfcfffefefcfcfdfdfffdfcfcfcfffefffcfcfc),\n.INIT_2(256'hfdfefcfffefcfdfcfdfffffcfcfefffffcfcfdfdfdfcfffcfefffdfcfdfcfffd),\n.INIT_3(256'hfdfcfffefdfcfcfefffefcfefcfcfffffdfdfefefffcfdfffcfffffcfcfcfefd),\n.INIT_4(256'hfdfcfffefcfcfefcfcfdfefefdfefffcfcfcfffffcfcfefdfffcfdfefffefefd),\n.INIT_5(256'hfcfdfdfcfffefdfefffcfcfcfefdfefefcfcfcfffdfefcfdfefdfcfdfcfcfefc),\n.INIT_6(256'hfefcfefefefefefefefcfefefefcfcfefefefcfcfefcfcfefefefcfefffdfdfe),\n.INIT_7(256'hfcfcfefcfcfefefefefefefcfcfefefefcfefcfcfcfcfefcfefefefefcfefefe),\n.INIT_8(256'hfdfcfefcfcfefcfcfcfcfcfefcfcfcfefefefefcfefefefefcfcfefefefcfcfe),\n.INIT_9(256'hfcfefcfdfcfefcfcfffcfcfffcfefffcfcfffcfdfcfefcfdfdfdfffcfcfefdfe),\n.INIT_A(256'hfcfefffefdfdfdfcfffefcfcfdfefdfffcfefffcfcfefdfdfcfefcfcfdfcfffe),\n.INIT_B(256'hfdfcfdfdfdfdfdfefffefcfcfdfcfcfefcfffffffffcfdfcfdfefcfcfefefefc),\n.INIT_C(256'hfffefefefefefffffffefefffffefefefffffefffefefefffffffefefefefeff),\n.INIT_D(256'hfffffffefffefffffffffffefefefefffefefefefffffffefffffffffffefffe),\n.INIT_E(256'hfffefefefefefefffffefffffefefffffffffffefefefffffefefffffffefeff),\n.INIT_F(256'hfefefffffefefefffefefefefffffffffefefefffefffefffffffffffffffffe)\n) _bn12 (\n.RDATA(insn1[5:4]),\n.RADDR(code_addr[10:0]),\n.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),\n.WCLK(clk), .WCLKE(wclke1), .WE(we1),\n.WADDR(mem_addr[11:1]),\n.MASK(16'h0000), .WDATA(dout[5:4]));\n\nSB_RAM2048x2 #(\n.INIT_0(256'hfefefefcfefefcfdfefcfcfcfefefcfcfefcfdfdfdfdfcfefcfcfcfefcfdfcff),\n.INIT_1(256'hfcfffcfefcfefdfefcfffcfcfdfcfffcfdfffcfcfdfcfcfffdfcfcfefcfefcfc),\n.INIT_2(256'hfdfdfdfdfefefcfdfcfdfefdfcfcfcfefdfcfcfefdfefdfcfefefcfefcfcfcfd),\n.INIT_3(256'hfcfdfefdfefdfcfcfcfdfcfefcfefcfdfcfdfefefcfdfdfffffffcfdfcfcfcfd),\n.INIT_4(256'hfefdfcfffcfefffcfefdfdfefcfefcfcfefcfcfffcfefefcfffffcfefdfdfcfe),\n.INIT_5(256'hfefdfcfffcfdfcfffcfffcfcfffcfdfefefcfefcfffdfefdfefcfcfcfdfffcfd),\n.INIT_6(256'hfefcfefefefefcfefcfcfcfefcfcfcfcfcfcfcfcfefcfdfcfffdfcfcfffcfdfc),\n.INIT_7(256'hfcfcfefefcfcfefcfefcfefefcfefcfcfcfefcfcfcfcfefefefefefefcfcfcfe),\n.INIT_8(256'hfefcfcfcfdfffcfcfcfcfcfefcfcfcfcfefcfefefcfefcfefcfcfefcfefefcfe),\n.INIT_9(256'hfefcfefcfdfcfcfcfefdfcfcfcfcfcfdfdfffdfcfdfdfffcfffcfefdfdfcfcfc),\n.INIT_A(256'hfcfcfffcfcfcfcfefdfefefcfdfcfcfcfcfcfcfdfcfefcfcfdfcfcfcfefdfeff),\n.INIT_B(256'hfdfcfcfcfcfdfcfdfefffefcfefdfdfcfcfcfffefefcfefdfcfdfcfcfcfffdfc),\n.INIT_C(256'hfefffefefffefefefefffefefefffefefefffefefffffefefefefefefffffefe),\n.INIT_D(256'hfefffefffefefefffefffefffefefffefffefefefffefefffefffefffefffeff),\n.INIT_E(256'hfefffefefffffefefffffffffefefefffefffefffefefffefffffefefefffefe),\n.INIT_F(256'hfefefefffefefffffffefefffefffefefefffffefffefffffefefefffefffeff)\n) _bn13 (\n.RDATA(insn1[7:6]),\n.RADDR(code_addr[10:0]),\n.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),\n.WCLK(clk), .WCLKE(wclke1), .WE(we1),\n.WADDR(mem_addr[11:1]),\n.MASK(16'h0000), .WDATA(dout[7:6]));\n\nSB_RAM2048x2 #(\n.INIT_0(256'hfcfefcfdfefefcfefcfdfefefefffcfefdfdfffffdfefdfdfdfcfefffcfefdfd),\n.INIT_1(256'hfffdfcfdfcfcfcfefefdfcfefdfdfffefffffefcfefcfcfdfdfdfcfcfcfcfdfc),\n.INIT_2(256'hfcfefcfffcfcfcfcfcfffcfdfcfffcfcfefcfefcfffdfffcfcfcfefcfcfcfefc),\n.INIT_3(256'hfcfefefffcfcfdfffcfefdfffcfefcfffcfffcfdfcfcfcfdfcfdfcfefcfefcfc),\n.INIT_4(256'hfcfcfdfcfdfcfcfcfcfdfdfdfcfcfcfefdfcfcfcfcfdfdfdfcfcfcfffcfcfcff),\n.INIT_5(256'hfcfdfcfffcfcfcfefdfffffffefcfefcfefcfefcfefcfcfcfefcfefffffcfcff),\n.INIT_6(256'hfcfcfcfcfefefcfcfcfcfcfefcfcfcfefefefcfcfcfcfcfefcfcfdfffcfcfdff),\n.INIT_7(256'hfcfefcfcfcfcfcfcfcfcfcfcfcfefcfefcfcfcfcfcfefcfcfcfcfefefcfefcfe),\n.INIT_8(256'hfcfcfdfffcfcfcfcfcfcfcfcfcfcfcfcfcfefcfcfcfcfcfefcfcfefcfcfcfcfe),\n.INIT_9(256'hfdfffcfdfefefcfdfcfcfdfffcfffcfefcfcfcfcfdfdfcfcfcfcfcfdfdfffcfe),\n.INIT_A(256'hfcfffdfffdfefcfcfdfdfdfcfdfffdfefcfefcfefdfdfcfdfcfcfcfefcfcffff),\n.INIT_B(256'hfdfdfdfcfcfdfcfffefefcfffcfdfefefdfffffefcfffdfcfefefcfdfcfdfcfc),\n.INIT_C(256'hfffefffffefffefefefffefefefefefefefffefffefefefefefefefffefefeff),\n.INIT_D(256'hfefefefefefffefffffffffffffefefffefefefefefefefffefefefffffefeff),\n.INIT_E(256'hfffefefffefffefffffefefffefefefefefffffefffffefffefefefefefffeff),\n.INIT_F(256'hfefefefefefffefffefefffffefffffffefefffffffffffefffffefffefefeff)\n) _bn14 (\n.RDATA(insn1[9:8]),\n.RADDR(code_addr[10:0]),\n.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),\n.WCLK(clk), .WCLKE(wclke1), .WE(we1),\n.WADDR(mem_addr[11:1]),\n.MASK(16'h0000), .WDATA(dout[9:8]));\n\nSB_RAM2048x2 #(\n.INIT_0(256'hfcfcfcfdfdfcfefdfdfffefcfcfdfffcfdfffffdfcfdfdfefcfcfcfefcfcfdff),\n.INIT_1(256'hfdfffcfcfcfcfcfefcfcfffefefefcfcfcfefffefcfcfcfcfcfcfcfcfcfeffff),\n.INIT_2(256'hfcfdfcfefcfefcfcfcfffcfdfcfffcfefefefcfdfcfcfdfcfffcfcfdfefefcfd),\n.INIT_3(256'hfcfcfdfcfcfdfcfffefcfcfcfcfcfefdfcfefcfffcfcfefcfcfcfefdfcfefcfc),\n.INIT_4(256'hfcfcfdfdfcfdfcfcfcfcfcfcfcfcfefcfdfdfcfcfcfdfdfcfcfffcfcfcfdfcff),\n.INIT_5(256'hfcfdfdfdfdfdfcfefdfffdfcfcfcfcfcfcfcfcfcfcfcfdfcfcfcfefffcfcfefc),\n.INIT_6(256'hfcfcfcfefefefcfcfcfcfefcfcfcfcfefcfefcfcfcfcfcfefcfcfdfffcfcfcfe),\n.INIT_7(256'hfcfefcfcfcfcfcfcfcfcfcfefefcfcfefcfcfcfcfcfefcfefcfefefefcfefefc),\n.INIT_8(256'hfcfcfcfcfcfefcfcfcfcfcfcfcfcfcfcfefcfcfcfcfcfefefcfefcfcfcfcfefc),\n.INIT_9(256'hfefcfcfefefcfcfdfdfcfcfcfcfffdfcfcfefdfcfcfcfdfcfcfcfcfcfcfefcfe),\n.INIT_A(256'hfcfffefcfdfefefdfcfcfdfcfcfefdfcfcfefcfcfdfffcfcfcfcfcfefcfcfcfc),\n.INIT_B(256'hfcfcfdfcfcfdfcfefcfdfefdfcfefefcfdfefcfdfefcfcfffefdfcfdfcfcfcfc),\n.INIT_C(256'hfefffefefefefefefefefefefffefffefefefefffffefefefefffefffffefeff),\n.INIT_D(256'hfefffefefffefefffffffefefefefefefefefefefefefefefefefeffffffffff),\n.INIT_E(256'hfefefffffefefefffefefefefefefefffefffffffefefefefefefefefefefeff),\n.INIT_F(256'hfefefefefffffefefefefefefefefefefefffefefefefefffefefefefefefeff)\n) _bn15 (\n.RDATA(insn1[11:10]),\n.RADDR(code_addr[10:0]),\n.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),\n.WCLK(clk), .WCLKE(wclke1), .WE(we1),\n.WADDR(mem_addr[11:1]),\n.MASK(16'h0000), .WDATA(dout[11:10]));\n\nSB_RAM2048x2 #(\n.INIT_0(256'hfcfffefcfcfcfffcfdfcfefdfcfcfefcfdfcfefcfefcfdfcfcfcfdfefefcfdfc),\n.INIT_1(256'hfdfcfdfcfefdfffcfefefefcfefefcfcfefefffcfcfefcfcfcfcfcfcfefcfffc),\n.INIT_2(256'hfcfcfcfcfdfcfcfcfdfcfdfdfdfdfefffffcfcfefcfefcfefcfcfcfefefefdff),\n.INIT_3(256'hfefcfdfcfffdfdfdfcfdfcfcfcfcfffcfdfcfdfcfcfdfcfcfcfcfffcfdfdfcfd),\n.INIT_4(256'hfcfcfdfcfdfcfcfdfcfcfcfcfcfcfcfcfdfcfcfdfcfcfdfcfcfcfdfcfefcfefe),\n.INIT_5(256'hfcfcfcfdfdfcfdfdfffcfefffcfffdfefcfefcfefcfefffcfcfefcfefcfefcfc),\n.INIT_6(256'hfcfcfcfcfefefcfcfcfcfefcfcfcfcfcfcfcfcfcfcfcfdfcfcfdfcfdfcfdfcfc),\n.INIT_7(256'hfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfefcfcfcfc),\n.INIT_8(256'hfcfcfffdfcfdfcfcfcfcfcfcfcfcfcfcfefcfcfcfcfcfefcfefcfcfefcfcfefc),\n.INIT_9(256'hfffcfcfdfffcfcfcfcfcfcfcfcfcfefcfcfcfcfcfcfcfdfcfcfcfcfcfcfcfcfc),\n.INIT_A(256'hfcfcfefcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfefcfdfcfcfdfdfcfcfcfcfcfdfd),\n.INIT_B(256'hfcfcfcfcfdfcfdfcfdfcfffcfcfdfffcfdfcfcfcfffcfdfcfffcfdfcfcfdfdfc),\n.INIT_C(256'hfffffffffefffefefefefefefffffffefefffefefefefefefefefefefffefefe),\n.INIT_D(256'hfffffffffffefffefffefffffffffefffffefefefefefefefefefffffffefffe),\n.INIT_E(256'hfffffffefefffefefefefefefefefffffffefffefffefefffefefefefefefefe),\n.INIT_F(256'hfefefefefffefefffffefefefefefefefefefefefefefefefefefefefefefffe)\n) _bn16 (\n.RDATA(insn1[13:12]),\n.RADDR(code_addr[10:0]),\n.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),\n.WCLK(clk), .WCLKE(wclke1), .WE(we1),\n.WADDR(mem_addr[11:1]),\n.MASK(16'h0000), .WDATA(dout[13:12]));\n\nSB_RAM2048x2 #(\n.INIT_0(256'hfcfcfcfefcfffcfdfcfffcfefcfefcfdfcfefcfefcfefcfffefdfefdfcfefcff),\n.INIT_1(256'hfcfdfcfdfcfcfcfffcfffcfefcfffdfefcfffcfefcfdfcfdfefdfdfcfcfefcfe),\n.INIT_2(256'hfcfefcfffdfefefcfcfffcfffcfffcfefcfdfcfdfcfdfdfcfcfdfefdfcfefcfd),\n.INIT_3(256'hfcfefcfffcfffcfffcfcfcfefdfefcfdfcfffcfffcfefcfefcfffcfdfcfffefc),\n.INIT_4(256'hfcfefcfffefdfcfcfcfefcfffffcfcfcfcfefcfefefcfcfdfcfffcfffcfdfcff),\n.INIT_5(256'hfcfffcfffefdfcfffcfffcfffcfcfcfdfdfcfcfdfcfdfcfefefdfcfffcfdfcfd),\n.INIT_6(256'hfcfefcfefefefcfefefcfcfcfcfefcfefcfefefcfcfefcfffdfefcfffcfefcfe),\n.INIT_7(256'hfcfefcfefcfefcfefcfefcfefcfefcfefcfefefcfcfefcfefcfefefcfcfefcfc),\n.INIT_8(256'hfcfefcfffcfefefcfcfefcfefefcfcfefcfcfcfefcfcfcfefcfefcfcfcfcfcfc),\n.INIT_9(256'hfcfdfcfefcfffcfffcfffcfffcfffcfffcfffefcfefdfcfefcfffcfffcfffdfe),\n.INIT_A(256'hfcfffcfdfdfefcfffefdfdfefcfffdfefcfffcfefcfffefcfefdfdfefcfefcff),\n.INIT_B(256'hfcfdfdfcfcfdfcfdfcfffcfdfcfefcfffcfffcfffcfdfcfffcfffcfffcfefefd),\n.INIT_C(256'hfefffefffefefefefefffffefefffefffefefefefefefefffefffefffefefeff),\n.INIT_D(256'hfefffefffefffefffefffefffefffefefefffffefefffefffefefefffefffefe),\n.INIT_E(256'hfefffefffefefefefefffffefefffefffefffefffefffefefefefefffefffeff),\n.INIT_F(256'hfffefefefefffefefefffefffefffefffefffefffefffefffefffefffefefeff)\n) _bn17 (\n.RDATA(insn1[15:14]),\n.RADDR(code_addr[10:0]),\n.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),\n.WCLK(clk), .WCLKE(wclke1), .WE(we1),\n.WADDR(mem_addr[11:1]),\n.MASK(16'h0000), .WDATA(dout[15:14]));\n\n\nreg c11;\nalways @(posedge clk)\n  c11 <= code_addr[11];\n\nassign insn = c11 ? insn1 : insn0;\n\n",
            "params": [
              {
                "name": "PROG"
              }
            ],
            "ports": {
              "in": [
                {
                  "name": "clk"
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
            "x": 240,
            "y": 64
          },
          "size": {
            "width": 448,
            "height": 320
          }
        }
      ],
      "wires": [
        {
          "source": {
            "block": "a9d1a7b7-5129-4f5f-9403-62eaad3cd393",
            "port": "D"
          },
          "target": {
            "block": "474f9a61-9b0b-45a7-8ac1-13757b0a9153",
            "port": "in"
          },
          "vertices": [],
          "size": 5
        },
        {
          "source": {
            "block": "a9d1a7b7-5129-4f5f-9403-62eaad3cd393",
            "port": "TX"
          },
          "target": {
            "block": "51ffc131-a0be-4402-8d8a-d493aa097f71",
            "port": "in"
          },
          "vertices": []
        },
        {
          "source": {
            "block": "ad21df2a-1a7c-41be-b4bc-d92a7dec1a0d",
            "port": "out"
          },
          "target": {
            "block": "a9d1a7b7-5129-4f5f-9403-62eaad3cd393",
            "port": "resetq"
          },
          "vertices": []
        },
        {
          "source": {
            "block": "65e5ed38-6c4c-4aab-8069-c328e953e98c",
            "port": "out"
          },
          "target": {
            "block": "a9d1a7b7-5129-4f5f-9403-62eaad3cd393",
            "port": "RX"
          },
          "vertices": []
        },
        {
          "source": {
            "block": "f6dbe6a2-7a5b-4b8a-81f8-75000d0082fa",
            "port": "out"
          },
          "target": {
            "block": "6a701f7c-b355-4bd9-9b0e-c6cfd974a2fe",
            "port": "pclk"
          }
        },
        {
          "source": {
            "block": "6a701f7c-b355-4bd9-9b0e-c6cfd974a2fe",
            "port": "clk"
          },
          "target": {
            "block": "a9d1a7b7-5129-4f5f-9403-62eaad3cd393",
            "port": "clk"
          }
        },
        {
          "source": {
            "block": "b09be0dc-b4ab-4c33-9b1d-7a7a1f2f097e",
            "port": "constant-out"
          },
          "target": {
            "block": "a9d1a7b7-5129-4f5f-9403-62eaad3cd393",
            "port": "PROG"
          }
        }
      ]
    }
  },
  "dependencies": {}
}