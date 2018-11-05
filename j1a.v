`default_nettype none


module j1a(input pclk,

           output TX,        // UART TX
           input RX,         // UART RX
					 output [4:0] D,
           input resetq);

  localparam MHZ = 12;

  wire clk;
  SB_PLL40_CORE #(.FEEDBACK_PATH("SIMPLE"),
                  .PLLOUT_SELECT("GENCLK"),
                  .DIVR(4'b0000),
                  .DIVF(7'd3),
                  .DIVQ(3'b000),
                  .FILTER_RANGE(3'b001),
                 ) uut (
                         .REFERENCECLK(pclk),
                         .PLLOUTCORE(clk),
                         //.PLLOUTGLOBAL(clk),
                         // .LOCK(D5),
                         .RESETB(1'b1),
                         .BYPASS(1'b0)
                        );

  wire io_rd, io_wr;
  wire [15:0] mem_addr;
  wire mem_wr;
  wire [15:0] dout;
  wire [15:0] io_din;
  wire [12:0] code_addr;
  reg unlocked = 0;

  j1 _j1(
    .clk(clk),
    .resetq(resetq),
    .io_rd(io_rd),    //-- output
    .io_wr(io_wr),    //-- output
    .mem_wr(mem_wr),  //-- output
    .dout(dout),      //-- output
    .io_din(io_din),  //-- input
    .mem_addr(mem_addr),  //-- output
    .code_addr(code_addr), //-- output (13 bits)
    .insn(insn));          //-- input

  // ######   IO SIGNALS   ####################################

	wire io_wr_ = io_wr, io_rd_ = io_rd;
	wire [15:0] dout_ = dout; //--
	wire [15:0] io_addr_ = mem_addr;


  // ######   UART   ##########################################

  wire uart0_valid, uart0_busy;
  wire [7:0] uart0_data;
  wire uart0_wr = io_wr_ & io_addr_[12];
  wire uart0_rd = io_rd_ & io_addr_[12];
  wire uart_RXD = RX;

  buart _uart0 (
     .clk(clk),
     .resetq(1'b1),
     .rx(uart_RXD),
     .tx(TX),
     .rd(uart0_rd),
     .wr(uart0_wr),
     .valid(uart0_valid),
     .busy(uart0_busy),
     .tx_data(dout_[7:0]),
     .rx_data(uart0_data));

  wire [4:0] LEDS;
  wire w4 = io_wr_ & io_addr_[2];


	SB_IO #(.PIN_TYPE(6'b0101_01)) _io0 (
        .PACKAGE_PIN(D[4]),
        .CLOCK_ENABLE(w4),
        .OUTPUT_CLK(clk),
        .D_OUT_0(dout_[0]),
        .D_IN_0(LEDS[0]));

	SB_IO #(.PIN_TYPE(6'b0101_01)) _io1 (
	        .PACKAGE_PIN(D[3]),
	        .CLOCK_ENABLE(w4),
	        .OUTPUT_CLK(clk),
	        .D_OUT_0(dout_[1]),
	        .D_IN_0(LEDS[1]));


  SB_IO #(.PIN_TYPE(6'b0101_01)) _io2 (
					.PACKAGE_PIN(D[2]),
					.CLOCK_ENABLE(w4),
					.OUTPUT_CLK(clk),
					.D_OUT_0(dout_[2]),
					.D_IN_0(LEDS[2]));


	SB_IO #(.PIN_TYPE(6'b0101_01)) _io3 (
	        .PACKAGE_PIN(D[1]),
	        .CLOCK_ENABLE(w4),
	        .OUTPUT_CLK(clk),
	        .D_OUT_0(dout_[3]),
	        .D_IN_0(LEDS[3]));


	SB_IO #(.PIN_TYPE(6'b0101_01)) _io4 (
	        .PACKAGE_PIN(D[0]),
	        .CLOCK_ENABLE(w4),
	        .OUTPUT_CLK(clk),
	        .D_OUT_0(dout_[4]),
	        .D_IN_0(LEDS[4]));

  assign io_din =
    (io_addr_[12] ? {8'd0, uart0_data}                                  : 16'd0) |
    (io_addr_[13] ? {11'd0, 1'b1, 1'b1, 1'b1, uart0_valid, !uart0_busy} : 16'd0);



  always @(negedge resetq or posedge clk)
    if (!resetq)
      unlocked <= 0;
    else
      unlocked <= unlocked | io_wr_;
/*
wire we0 = mem_wr & !mem_addr[12];
wire we1 = mem_wr & mem_addr[12];
wire wclke0 = unlocked;
wire wclke1 = unlocked;
*/

wire we0 = 1'b1;
wire we1 = 1'b1;
wire wclke0 = mem_wr & !mem_addr[12] & unlocked;
wire wclke1 = mem_wr & mem_addr[12] & unlocked;

//---------------------- memory

wire [15:0] insn0, insn1;
wire [15:0] insn;

//-- Definición de la tabla
//-- Tabla de TAM elementos de M bits
reg [15:0] tabla[0:4095];

//-- Read the table
always @(posedge clk)
  insn0 <= tabla[code_addr[10:0]];

//-- Puerto escritura
always @(posedge clk)
  if (wclke0)
      tabla[mem_addr[11:1]] <= dout;

//-- Init table from DATA parameters
initial begin
  $readmemh("nuc.list", tabla);
end


/*

SB_RAM2048x2 #(
.INIT_0(256'hd3d68152b0338cc6b68b2c3940c931dac00a23690e673f1b35f6d2ea65064585),
.INIT_1(256'h71aa2c5cd339e5ce2cd886d94615a3ecc5c9a4de0c9bcfc65cb40db572ffa68d),
.INIT_2(256'h20e0289af74cb6ac8bbf869e08e1017c48510c8004dcadf1ec60845433e1df76),
.INIT_3(256'h8d1613939b730265441e91a1cea6cbc23716eb6a436644fc2d5caf9e963a413b),
.INIT_4(256'h6c584c642b1f3a55327a0e357b2d29040104003d940202786b93015f8d313157),
.INIT_5(256'h5c66c5d71931347c023065bcfc8b9846307f4b7d215a335c3557483e64692e08),
.INIT_6(256'h24190f131938435691d3505e924a54dc192ce1abc8c18444f06675554a252877),
.INIT_7(256'h345d29ac797c583062af288c0c7deac884757c8a2d20ae72849aba00083ec1bf),
.INIT_8(256'hc092041ae686b93ce2c2885d24cf0cebf7f6a5b4a16c7c36acfdd288b52d0460),
.INIT_9(256'h4059624ef85ac14fe5104825cf51c52f9c04e49fc29cc05db8261c1916c62aa9),
.INIT_A(256'h8850051524bc9154886000e095b8adbce1f4b074a0c4f555f3300ad993a5a927),
.INIT_B(256'h84704511607d40f1f82c9018b0bd114ce56d801040555150a024a55d00bc0189),
.INIT_C(256'hb0c03354d008fcbf703cfdcb019b0913e39ea454c61e8c177d407226ab04b654),
.INIT_D(256'hb30b3e64a49d04b6ac5b701809c5344da60ec232a49b02acb39f124c9a42d1dc),
.INIT_E(256'h8a279c19ee72d0e05ad6c4fe78840a0f90b7b429f6ee828a3c665a6cf3e52f37),
.INIT_F(256'h484be17e1de193caf0ef19dd56c792e658e5d69e7325b5d8d1a490f1559e7c96)
) _bn00 (
.RDATA(insn0[1:0]),
.RADDR(code_addr[10:0]),
.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),
.WCLK(clk), .WCLKE(wclke0), .WE(we0),
.WADDR(mem_addr[11:1]),
.MASK(16'h0000), .WDATA(dout[1:0]));
*/





SB_RAM2048x2 #(
.INIT_0(256'hfcfdfcfcfffcfdfffffdfcfefefdfdfefefdfcfefefffefdfcfcfffdfefefefd),
.INIT_1(256'hfdfefdfcfffdfefefcfefcfcfffcfefefdfffffffffcfffcfcfcfffefdfefdfc),
.INIT_2(256'hfdfcfefffefcfefcfffffffefffefdfcfefefdfdfdfcfffcfdfcfdfcfdfefffc),
.INIT_3(256'hfdfefefefcfdfdfcfdfefcfcfcfefdfdfffefefdfefcfcfdfefdfcfdfffdfcfc),
.INIT_4(256'hfefcfcfffefcfefefefcfcfefefdfcfefffcfdfffffefefffdfcfdfdfffcfcfd),
.INIT_5(256'hfffffefdfcfdfefffdfffefffefdfcfcfefcfefdfefcfcfcfffcfdfffcfcfcff),
.INIT_6(256'hfefefefcfefefcfefcfcfcfefefefefefefcfefcfefefefefffcfefffffefffe),
.INIT_7(256'hfefefefcfcfcfefcfefcfefefefefefefcfefcfefefefcfcfefcfefefefefcfe),
.INIT_8(256'hfffefffefffdfcfcfcfefcfefcfcfcfefcfcfefcfcfcfcfefcfcfefcfcfcfefe),
.INIT_9(256'hfcfcfffdfcfefdfffffdfdfdfffffffffffcfcfdfdfdfffdfffcfffefefefffe),
.INIT_A(256'hfdfdfdfefcfcfdfcfffefffcfffefdfcfefffffefffcfcfdfcfcfefefefdfefd),
.INIT_B(256'hfdfcfcfcfdfdfdfdfffcfffdfffdfcfefcfdfffdfffdfffdfdfefcfffcfffefc),
.INIT_C(256'hfefffffefffefefffefefefefefffffffffefefefefefefffffffffffffeffff),
.INIT_D(256'hfefffffefefffffefefefefffefffffefefefefffffefffffefefefefefffeff),
.INIT_E(256'hfefffffefefefefefefffffffefffffefffefffffffffefefefffefffffffefe),
.INIT_F(256'hfefefffffffefffefefefffffffefffffefffefffefffefefffffffefffeffff)
) _bn10 (
.RDATA(insn1[1:0]),
.RADDR(code_addr[10:0]),
.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),
.WCLK(clk), .WCLKE(wclke1), .WE(we1),
.WADDR(mem_addr[11:1]),
.MASK(16'h0000), .WDATA(dout[1:0]));

SB_RAM2048x2 #(
.INIT_0(256'hfefdfffefefcfdfdfcfefffffefcfcfefcfefffffcfffffdfdfcfcfdfcfffffd),
.INIT_1(256'hfefefefffdfdfffdfcfdfdfdfefdfdfefcfefdfcfefffcfdfcfffcfcfcfefcfe),
.INIT_2(256'hfffffdfdfefefcfdfcfcfffdfcfdfffcfdfdfdfcfcfdfefcfefcfffdfcfcfefc),
.INIT_3(256'hfdfffdfefffefefdfffefcfffcfefefefcfcfcfffcfefcfcfffdfefefcfefcfc),
.INIT_4(256'hfcfdfffcfefdfffdfcfdfefdfffcfffcfcfcfefdfdfcfffdfffdfcfffffdffff),
.INIT_5(256'hfcfffefffdfcfdfffcfefdfcfdfcfffffefcfcfcfefcfffefefdfcfcfefefefd),
.INIT_6(256'hfefcfcfefefefefcfcfefcfcfefefcfcfefcfcfefefcfdfdfdfefcfcfefcfcfd),
.INIT_7(256'hfcfcfefefefefcfcfcfefefcfcfcfefefefcfefefefefcfefcfefefefcfcfefe),
.INIT_8(256'hfcfefcfefefcfcfcfcfefefcfcfefcfcfefefcfefcfcfcfefcfefcfcfcfcfefe),
.INIT_9(256'hfefdfdfefffffdfffcfefefefdfdfcfefffcfdfdfcfcfcfdfcfdfefdfcfdfcfc),
.INIT_A(256'hfffdfcfdfcfcfdfdfefffefffcfdfffefcfdfcfffefcfdfdfdfdfefefcfdfefc),
.INIT_B(256'hfcfdfcfcfcfcfefcfffdfefffcfefffffffdfefcfcfffdfffffffcfffffcffff),
.INIT_C(256'hfefefffefffffffffefefefefefffefefefefffefefefefefffefffffefffefe),
.INIT_D(256'hfefffffffffffefefefffefffffffffefffffefefefffffefefffefefffefeff),
.INIT_E(256'hfefefefffffefffefffefffffefffefefefffffffefffefefefffffffffefffe),
.INIT_F(256'hfefefefefefefffefffffefefefffffefffffefffefffefefffefefffefefffe)
) _bn11 (
.RDATA(insn1[3:2]),
.RADDR(code_addr[10:0]),
.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),
.WCLK(clk), .WCLKE(wclke1), .WE(we1),
.WADDR(mem_addr[11:1]),
.MASK(16'h0000), .WDATA(dout[3:2]));

SB_RAM2048x2 #(
.INIT_0(256'hfefffcfdfefefdfcfcfcfcfefffefcfcfcfcfdfffffdfcfffcfdfffcfffcfdfe),
.INIT_1(256'hfdfcfefefefffefcfefdfefdfdfcfffefefcfcfdfdfffdfcfcfcfffefffcfcfc),
.INIT_2(256'hfdfefcfffefcfdfcfdfffffcfcfefffffcfcfdfdfdfcfffcfefffdfcfdfcfffd),
.INIT_3(256'hfdfcfffefdfcfcfefffefcfefcfcfffffdfdfefefffcfdfffcfffffcfcfcfefd),
.INIT_4(256'hfdfcfffefcfcfefcfcfdfefefdfefffcfcfcfffffcfcfefdfffcfdfefffefefd),
.INIT_5(256'hfcfdfdfcfffefdfefffcfcfcfefdfefefcfcfcfffdfefcfdfefdfcfdfcfcfefc),
.INIT_6(256'hfefcfefefefefefefefcfefefefcfcfefefefcfcfefcfcfefefefcfefffdfdfe),
.INIT_7(256'hfcfcfefcfcfefefefefefefcfcfefefefcfefcfcfcfcfefcfefefefefcfefefe),
.INIT_8(256'hfdfcfefcfcfefcfcfcfcfcfefcfcfcfefefefefcfefefefefcfcfefefefcfcfe),
.INIT_9(256'hfcfefcfdfcfefcfcfffcfcfffcfefffcfcfffcfdfcfefcfdfdfdfffcfcfefdfe),
.INIT_A(256'hfcfefffefdfdfdfcfffefcfcfdfefdfffcfefffcfcfefdfdfcfefcfcfdfcfffe),
.INIT_B(256'hfdfcfdfdfdfdfdfefffefcfcfdfcfcfefcfffffffffcfdfcfdfefcfcfefefefc),
.INIT_C(256'hfffefefefefefffffffefefffffefefefffffefffefefefffffffefefefefeff),
.INIT_D(256'hfffffffefffefffffffffffefefefefffefefefefffffffefffffffffffefffe),
.INIT_E(256'hfffefefefefefefffffefffffefefffffffffffefefefffffefefffffffefeff),
.INIT_F(256'hfefefffffefefefffefefefefffffffffefefefffefffefffffffffffffffffe)
) _bn12 (
.RDATA(insn1[5:4]),
.RADDR(code_addr[10:0]),
.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),
.WCLK(clk), .WCLKE(wclke1), .WE(we1),
.WADDR(mem_addr[11:1]),
.MASK(16'h0000), .WDATA(dout[5:4]));

SB_RAM2048x2 #(
.INIT_0(256'hfefefefcfefefcfdfefcfcfcfefefcfcfefcfdfdfdfdfcfefcfcfcfefcfdfcff),
.INIT_1(256'hfcfffcfefcfefdfefcfffcfcfdfcfffcfdfffcfcfdfcfcfffdfcfcfefcfefcfc),
.INIT_2(256'hfdfdfdfdfefefcfdfcfdfefdfcfcfcfefdfcfcfefdfefdfcfefefcfefcfcfcfd),
.INIT_3(256'hfcfdfefdfefdfcfcfcfdfcfefcfefcfdfcfdfefefcfdfdfffffffcfdfcfcfcfd),
.INIT_4(256'hfefdfcfffcfefffcfefdfdfefcfefcfcfefcfcfffcfefefcfffffcfefdfdfcfe),
.INIT_5(256'hfefdfcfffcfdfcfffcfffcfcfffcfdfefefcfefcfffdfefdfefcfcfcfdfffcfd),
.INIT_6(256'hfefcfefefefefcfefcfcfcfefcfcfcfcfcfcfcfcfefcfdfcfffdfcfcfffcfdfc),
.INIT_7(256'hfcfcfefefcfcfefcfefcfefefcfefcfcfcfefcfcfcfcfefefefefefefcfcfcfe),
.INIT_8(256'hfefcfcfcfdfffcfcfcfcfcfefcfcfcfcfefcfefefcfefcfefcfcfefcfefefcfe),
.INIT_9(256'hfefcfefcfdfcfcfcfefdfcfcfcfcfcfdfdfffdfcfdfdfffcfffcfefdfdfcfcfc),
.INIT_A(256'hfcfcfffcfcfcfcfefdfefefcfdfcfcfcfcfcfcfdfcfefcfcfdfcfcfcfefdfeff),
.INIT_B(256'hfdfcfcfcfcfdfcfdfefffefcfefdfdfcfcfcfffefefcfefdfcfdfcfcfcfffdfc),
.INIT_C(256'hfefffefefffefefefefffefefefffefefefffefefffffefefefefefefffffefe),
.INIT_D(256'hfefffefffefefefffefffefffefefffefffefefefffefefffefffefffefffeff),
.INIT_E(256'hfefffefefffffefefffffffffefefefffefffefffefefffefffffefefefffefe),
.INIT_F(256'hfefefefffefefffffffefefffefffefefefffffefffefffffefefefffefffeff)
) _bn13 (
.RDATA(insn1[7:6]),
.RADDR(code_addr[10:0]),
.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),
.WCLK(clk), .WCLKE(wclke1), .WE(we1),
.WADDR(mem_addr[11:1]),
.MASK(16'h0000), .WDATA(dout[7:6]));

SB_RAM2048x2 #(
.INIT_0(256'hfcfefcfdfefefcfefcfdfefefefffcfefdfdfffffdfefdfdfdfcfefffcfefdfd),
.INIT_1(256'hfffdfcfdfcfcfcfefefdfcfefdfdfffefffffefcfefcfcfdfdfdfcfcfcfcfdfc),
.INIT_2(256'hfcfefcfffcfcfcfcfcfffcfdfcfffcfcfefcfefcfffdfffcfcfcfefcfcfcfefc),
.INIT_3(256'hfcfefefffcfcfdfffcfefdfffcfefcfffcfffcfdfcfcfcfdfcfdfcfefcfefcfc),
.INIT_4(256'hfcfcfdfcfdfcfcfcfcfdfdfdfcfcfcfefdfcfcfcfcfdfdfdfcfcfcfffcfcfcff),
.INIT_5(256'hfcfdfcfffcfcfcfefdfffffffefcfefcfefcfefcfefcfcfcfefcfefffffcfcff),
.INIT_6(256'hfcfcfcfcfefefcfcfcfcfcfefcfcfcfefefefcfcfcfcfcfefcfcfdfffcfcfdff),
.INIT_7(256'hfcfefcfcfcfcfcfcfcfcfcfcfcfefcfefcfcfcfcfcfefcfcfcfcfefefcfefcfe),
.INIT_8(256'hfcfcfdfffcfcfcfcfcfcfcfcfcfcfcfcfcfefcfcfcfcfcfefcfcfefcfcfcfcfe),
.INIT_9(256'hfdfffcfdfefefcfdfcfcfdfffcfffcfefcfcfcfcfdfdfcfcfcfcfcfdfdfffcfe),
.INIT_A(256'hfcfffdfffdfefcfcfdfdfdfcfdfffdfefcfefcfefdfdfcfdfcfcfcfefcfcffff),
.INIT_B(256'hfdfdfdfcfcfdfcfffefefcfffcfdfefefdfffffefcfffdfcfefefcfdfcfdfcfc),
.INIT_C(256'hfffefffffefffefefefffefefefefefefefffefffefefefefefefefffefefeff),
.INIT_D(256'hfefefefefefffefffffffffffffefefffefefefefefefefffefefefffffefeff),
.INIT_E(256'hfffefefffefffefffffefefffefefefefefffffefffffefffefefefefefffeff),
.INIT_F(256'hfefefefefefffefffefefffffefffffffefefffffffffffefffffefffefefeff)
) _bn14 (
.RDATA(insn1[9:8]),
.RADDR(code_addr[10:0]),
.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),
.WCLK(clk), .WCLKE(wclke1), .WE(we1),
.WADDR(mem_addr[11:1]),
.MASK(16'h0000), .WDATA(dout[9:8]));

SB_RAM2048x2 #(
.INIT_0(256'hfcfcfcfdfdfcfefdfdfffefcfcfdfffcfdfffffdfcfdfdfefcfcfcfefcfcfdff),
.INIT_1(256'hfdfffcfcfcfcfcfefcfcfffefefefcfcfcfefffefcfcfcfcfcfcfcfcfcfeffff),
.INIT_2(256'hfcfdfcfefcfefcfcfcfffcfdfcfffcfefefefcfdfcfcfdfcfffcfcfdfefefcfd),
.INIT_3(256'hfcfcfdfcfcfdfcfffefcfcfcfcfcfefdfcfefcfffcfcfefcfcfcfefdfcfefcfc),
.INIT_4(256'hfcfcfdfdfcfdfcfcfcfcfcfcfcfcfefcfdfdfcfcfcfdfdfcfcfffcfcfcfdfcff),
.INIT_5(256'hfcfdfdfdfdfdfcfefdfffdfcfcfcfcfcfcfcfcfcfcfcfdfcfcfcfefffcfcfefc),
.INIT_6(256'hfcfcfcfefefefcfcfcfcfefcfcfcfcfefcfefcfcfcfcfcfefcfcfdfffcfcfcfe),
.INIT_7(256'hfcfefcfcfcfcfcfcfcfcfcfefefcfcfefcfcfcfcfcfefcfefcfefefefcfefefc),
.INIT_8(256'hfcfcfcfcfcfefcfcfcfcfcfcfcfcfcfcfefcfcfcfcfcfefefcfefcfcfcfcfefc),
.INIT_9(256'hfefcfcfefefcfcfdfdfcfcfcfcfffdfcfcfefdfcfcfcfdfcfcfcfcfcfcfefcfe),
.INIT_A(256'hfcfffefcfdfefefdfcfcfdfcfcfefdfcfcfefcfcfdfffcfcfcfcfcfefcfcfcfc),
.INIT_B(256'hfcfcfdfcfcfdfcfefcfdfefdfcfefefcfdfefcfdfefcfcfffefdfcfdfcfcfcfc),
.INIT_C(256'hfefffefefefefefefefefefefffefffefefefefffffefefefefffefffffefeff),
.INIT_D(256'hfefffefefffefefffffffefefefefefefefefefefefefefefefefeffffffffff),
.INIT_E(256'hfefefffffefefefffefefefefefefefffefffffffefefefefefefefefefefeff),
.INIT_F(256'hfefefefefffffefefefefefefefefefefefffefefefefefffefefefefefefeff)
) _bn15 (
.RDATA(insn1[11:10]),
.RADDR(code_addr[10:0]),
.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),
.WCLK(clk), .WCLKE(wclke1), .WE(we1),
.WADDR(mem_addr[11:1]),
.MASK(16'h0000), .WDATA(dout[11:10]));

SB_RAM2048x2 #(
.INIT_0(256'hfcfffefcfcfcfffcfdfcfefdfcfcfefcfdfcfefcfefcfdfcfcfcfdfefefcfdfc),
.INIT_1(256'hfdfcfdfcfefdfffcfefefefcfefefcfcfefefffcfcfefcfcfcfcfcfcfefcfffc),
.INIT_2(256'hfcfcfcfcfdfcfcfcfdfcfdfdfdfdfefffffcfcfefcfefcfefcfcfcfefefefdff),
.INIT_3(256'hfefcfdfcfffdfdfdfcfdfcfcfcfcfffcfdfcfdfcfcfdfcfcfcfcfffcfdfdfcfd),
.INIT_4(256'hfcfcfdfcfdfcfcfdfcfcfcfcfcfcfcfcfdfcfcfdfcfcfdfcfcfcfdfcfefcfefe),
.INIT_5(256'hfcfcfcfdfdfcfdfdfffcfefffcfffdfefcfefcfefcfefffcfcfefcfefcfefcfc),
.INIT_6(256'hfcfcfcfcfefefcfcfcfcfefcfcfcfcfcfcfcfcfcfcfcfdfcfcfdfcfdfcfdfcfc),
.INIT_7(256'hfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfefcfcfcfc),
.INIT_8(256'hfcfcfffdfcfdfcfcfcfcfcfcfcfcfcfcfefcfcfcfcfcfefcfefcfcfefcfcfefc),
.INIT_9(256'hfffcfcfdfffcfcfcfcfcfcfcfcfcfefcfcfcfcfcfcfcfdfcfcfcfcfcfcfcfcfc),
.INIT_A(256'hfcfcfefcfcfcfcfcfcfcfcfcfcfcfcfcfcfcfefcfdfcfcfdfdfcfcfcfcfcfdfd),
.INIT_B(256'hfcfcfcfcfdfcfdfcfdfcfffcfcfdfffcfdfcfcfcfffcfdfcfffcfdfcfcfdfdfc),
.INIT_C(256'hfffffffffefffefefefefefefffffffefefffefefefefefefefefefefffefefe),
.INIT_D(256'hfffffffffffefffefffefffffffffefffffefefefefefefefefefffffffefffe),
.INIT_E(256'hfffffffefefffefefefefefefefefffffffefffefffefefffefefefefefefefe),
.INIT_F(256'hfefefefefffefefffffefefefefefefefefefefefefefefefefefefefefefffe)
) _bn16 (
.RDATA(insn1[13:12]),
.RADDR(code_addr[10:0]),
.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),
.WCLK(clk), .WCLKE(wclke1), .WE(we1),
.WADDR(mem_addr[11:1]),
.MASK(16'h0000), .WDATA(dout[13:12]));

SB_RAM2048x2 #(
.INIT_0(256'hfcfcfcfefcfffcfdfcfffcfefcfefcfdfcfefcfefcfefcfffefdfefdfcfefcff),
.INIT_1(256'hfcfdfcfdfcfcfcfffcfffcfefcfffdfefcfffcfefcfdfcfdfefdfdfcfcfefcfe),
.INIT_2(256'hfcfefcfffdfefefcfcfffcfffcfffcfefcfdfcfdfcfdfdfcfcfdfefdfcfefcfd),
.INIT_3(256'hfcfefcfffcfffcfffcfcfcfefdfefcfdfcfffcfffcfefcfefcfffcfdfcfffefc),
.INIT_4(256'hfcfefcfffefdfcfcfcfefcfffffcfcfcfcfefcfefefcfcfdfcfffcfffcfdfcff),
.INIT_5(256'hfcfffcfffefdfcfffcfffcfffcfcfcfdfdfcfcfdfcfdfcfefefdfcfffcfdfcfd),
.INIT_6(256'hfcfefcfefefefcfefefcfcfcfcfefcfefcfefefcfcfefcfffdfefcfffcfefcfe),
.INIT_7(256'hfcfefcfefcfefcfefcfefcfefcfefcfefcfefefcfcfefcfefcfefefcfcfefcfc),
.INIT_8(256'hfcfefcfffcfefefcfcfefcfefefcfcfefcfcfcfefcfcfcfefcfefcfcfcfcfcfc),
.INIT_9(256'hfcfdfcfefcfffcfffcfffcfffcfffcfffcfffefcfefdfcfefcfffcfffcfffdfe),
.INIT_A(256'hfcfffcfdfdfefcfffefdfdfefcfffdfefcfffcfefcfffefcfefdfdfefcfefcff),
.INIT_B(256'hfcfdfdfcfcfdfcfdfcfffcfdfcfefcfffcfffcfffcfdfcfffcfffcfffcfefefd),
.INIT_C(256'hfefffefffefefefefefffffefefffefffefefefefefefefffefffefffefefeff),
.INIT_D(256'hfefffefffefffefffefffefffefffefefefffffefefffefffefefefffefffefe),
.INIT_E(256'hfefffefffefefefefefffffefefffefffefffefffefffefefefefefffefffeff),
.INIT_F(256'hfffefefefefffefefefffefffefffefffefffefffefffefffefffefffefefeff)
) _bn17 (
.RDATA(insn1[15:14]),
.RADDR(code_addr[10:0]),
.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),
.WCLK(clk), .WCLKE(wclke1), .WE(we1),
.WADDR(mem_addr[11:1]),
.MASK(16'h0000), .WDATA(dout[15:14]));


reg c11;
always @(posedge clk)
  c11 <= code_addr[11];

assign insn = c11 ? insn1 : insn0;





endmodule // top
