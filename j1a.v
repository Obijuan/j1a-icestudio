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


//---------------------- memory

wire [15:0] insn0, insn1;
wire [15:0] insn;

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
.WCLK(clk), .WCLKE(unlocked), .WE(mem_wr & !mem_addr[12]),
.WADDR(mem_addr[11:1]),
.MASK(16'h0000), .WDATA(dout[1:0]));

SB_RAM2048x2 #(
.INIT_0(256'h30b0010588ad46ac203d2ca8b6e7d2936adb7327889e95ceb8fe8e8295eff8f0),
.INIT_1(256'h80dc908c65bb9c8889a994a1ec9ff2b3d5559090c5a9180429eb073f4a4a01a9),
.INIT_2(256'h48ead1d1005020a0b3abc2b240e890f1c868b0a80919a4bc99ddf1313a382189),
.INIT_3(256'ha23b7571442c0c6e21f511311602051d424252901b223a2eebfd809221104535),
.INIT_4(256'h1246046c7850024a161f65760858520b214199e9dc980a7a5bd324d693258636),
.INIT_5(256'hb0a66064055380f41e5c54d0407a564d614a0a1c60510b1f09477b5134724848),
.INIT_6(256'h08072c3424356efd8ac8529c0080a8fa2070c75528735033d95a5b398f841a90),
.INIT_7(256'h6001697088289c94fffcc3e2b0b69695e99bb611558a0f3bbcb22abc241c6635),
.INIT_8(256'hef7f147c854554d44b98158cd7d485438bca4c4e38b8150f41b0707022f82c30),
.INIT_9(256'h14761272acac6a381d9aa2a224be0325a1f2a98a7e5b2460de51e5f6c1929ede),
.INIT_A(256'hbdec8c0d94d4688c0494016064c840657094e4e5293c3c8cb6f7ebaac87440d7),
.INIT_B(256'h1cdc8844f05c4c69e56c416161b1245ce8fc6c74f01455d4f93980f9c0fd94d4),
.INIT_C(256'h80c92931a9ab0953e21a408da9c9907038ba19737a3ae4efcc3e2a2ba2c3016f),
.INIT_D(256'h616390c10a0991a785d3a012c1aaa2b3c811a3fb7df044e8d8f97cb66ef74a98),
.INIT_E(256'h79cb725e40c2c64790d90405fbc3d1d5d77644c4c82c1cdbbc8d0382e1c958b8),
.INIT_F(256'h67fe8d985cd10d1c9cdc14d420e1c4ce01d13a3c54fc46611b12fc54385e0c8f)
) _bn01 (
.RDATA(insn0[3:2]),
.RADDR(code_addr[10:0]),
.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),
.WCLK(clk), .WCLKE(unlocked), .WE(mem_wr & !mem_addr[12]),
.WADDR(mem_addr[11:1]),
.MASK(16'h0000), .WDATA(dout[3:2]));

SB_RAM2048x2 #(
.INIT_0(256'h9430a8f2a022820051d48904e33ad05e1052961c4640cf504a804e00b0310283),
.INIT_1(256'h14c47d77d226a42a29e005486618414c2ce4b07a0b85a09004e72cb848c4c526),
.INIT_2(256'ha2c863b55088c24b8820a23b2848001c59881ccc09e13454c10d787016c4f109),
.INIT_3(256'h898b70887919421eb59e10a092a785059a8223029b369428bd218646043d00bc),
.INIT_4(256'h701648090a1b7a395f0549286d65342665471d0d10498a8832b82c1495063eea),
.INIT_5(256'h9e314670d9ed764890bd23bc1827135f315811571866682c06183a3e64317033),
.INIT_6(256'h833a08743802f974d2065a0048059880d86c3fd383023a12d1946202003d5a17),
.INIT_7(256'h78405168e046201c810da104d4f89337e958d2765a572ad4803dbcd2bd01e7ea),
.INIT_8(256'hc836a790d3509e8c4a0c1f7503c90a204a0083859ace9b1bfb59dfe293e09377),
.INIT_9(256'hb35ed315ab86227cde5002751ab2e658b233ca9986fc0635f69d6e6b5aeaca65),
.INIT_A(256'h31d1c49c24b948a0b0013591a00c4490a01080455901fc84ba294ff11682db9b),
.INIT_B(256'hdcb0859161982400fd046c3ce40d110584480c186850188df4ace12049b9018c),
.INIT_C(256'h5838580cc8731801300bed3e299e4c9ee21eaa984a50a980dbd13814cb7f4e2e),
.INIT_D(256'hc5040b623aaa37c876a1c4015b8c71a93a3aaa79ad339e55f904340529c9c929),
.INIT_E(256'haeb58285e1adcb366284240440e60c819542c483e909cf4c7002c761f2161a3a),
.INIT_F(256'h1913fcea3d4a04cc510e014758308364592b4ec97828c12fccf9ed2c1c008ac1)
) _bn02 (
.RDATA(insn0[5:4]),
.RADDR(code_addr[10:0]),
.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),
.WCLK(clk), .WCLKE(unlocked), .WE(mem_wr & !mem_addr[12]),
.WADDR(mem_addr[11:1]),
.MASK(16'h0000), .WDATA(dout[5:4]));

SB_RAM2048x2 #(
.INIT_0(256'h301488a880a0040210412485028300d00010a396804c90d4304a044ea4b17b0a),
.INIT_1(256'h101004543310002000230001100030001120002000020888a488032802480004),
.INIT_2(256'h808050700090002123901222002010110030201800280020908089c830100020),
.INIT_3(256'h280101749c7002c004252118429600a80a9a1021229200120010000000313580),
.INIT_4(256'h06380c082047285a005f04493249102008618050e454404209fa10214493003c),
.INIT_5(256'h109a000289418240803462871042a033003f0c5720106546194a006b00001a60),
.INIT_6(256'h30bb1c600f0b60e802d8005a80c93202508832ec4013581289501340c009cac8),
.INIT_7(256'h0070213d88c19c3870c1602100c8141310e942b40157998e002d8a5620b582c5),
.INIT_8(256'h91ea0406e4d3c09c4808101534034c0a000a408ba0124d830059008af0231899),
.INIT_9(256'h29c0b090212018284402e0028026084291e240c378ce402481d6cc3b580a20c8),
.INIT_A(256'ha4494cc06401850401a0146d4c2040016140214020411468a088040f5482d410),
.INIT_B(256'h00dca0250069082400b19d6c8474150c0074780428880c952d34a0c828451001),
.INIT_C(256'h3e6e23481952000ac820d47802230c48096a298208626c85a63b164c026b034c),
.INIT_D(256'hf031ea2120126152a1d200641a61b0e13218d188612820ba60986254e649d647),
.INIT_E(256'hd5be9082ec6d1a993a6a25257b38590c8185c00458f130652ce801c611ea282a),
.INIT_F(256'h2510a5750c9c25051011706108980109189c7040e87c87c693dd1ce40018e5cb)
) _bn03 (
.RDATA(insn0[7:6]),
.RADDR(code_addr[10:0]),
.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),
.WCLK(clk), .WCLKE(unlocked), .WE(mem_wr & !mem_addr[12]),
.WADDR(mem_addr[11:1]),
.MASK(16'h0000), .WDATA(dout[7:6]));

SB_RAM2048x2 #(
.INIT_0(256'h1cf3400240702ba82082222881c98bbeae0a419c005eb01ea2a146e48b70e5ce),
.INIT_1(256'h2080205ed5b04848d1fd22ea731908aa8b89242c8088a4424298c0c89818388a),
.INIT_2(256'hc46888d4ae4a669c624a1091c94a801624c284fa495a488a086221029187ca8a),
.INIT_3(256'he2d620290602e4b5620623a128350e822081e09aac3c7ce8909c3c42ee4ab03c),
.INIT_4(256'h297a0a757c581c0020122b6c06483c7a0c222620e0010010e063d232be212c91),
.INIT_5(256'h3c694b3f87310a7d84799418d45ae4546d7a786e715610464805404c00401a45),
.INIT_6(256'ha8cd99314218444c090d4241c24c0a00b4bccca004031d07a63602010c3ca068),
.INIT_7(256'h0121909890304226bcbc020eeaae3246523f84b1c49096311ef80a10a49c440c),
.INIT_8(256'h10701258082c3f1a080504aa50fc442a34ecca0861252ca2048c8822141768a1),
.INIT_9(256'h88ee1466405c82ea8482483e89ef8a1c0420c280062884a2ce1804209c9680b4),
.INIT_A(256'h80e9a899d4f1b0808888a8481d9800d530d0942c412081a8404902f89d981c7a),
.INIT_B(256'h8098f89dbc7c8154a0990448a9e5505c2c781814b0b428c9b8bc143968fda0c9),
.INIT_C(256'h08a700398c6b4dffa8f9808990a6bd7070fb7b32ba789eaa8eb90602023b10cc),
.INIT_D(256'h92ea4b6a8586c0bd929180a582d2f591549c105d30980203b07b46ab88fac5f3),
.INIT_E(256'h0e1908034c3a0a9fd98e5cf108fa2e980602384e4cf83087cda51207e033c8e1),
.INIT_F(256'h82cad4a2d8c7ca982efa054f8fe834d78cd210958da08292025c48d2514d80cd)
) _bn04 (
.RDATA(insn0[9:8]),
.RADDR(code_addr[10:0]),
.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),
.WCLK(clk), .WCLKE(unlocked), .WE(mem_wr & !mem_addr[12]),
.WADDR(mem_addr[11:1]),
.MASK(16'h0000), .WDATA(dout[9:8]));

SB_RAM2048x2 #(
.INIT_0(256'h101800c4025406072282203180918ba12284b0cc20302094903428aa248dc42d),
.INIT_1(256'h21a5200000c04850d52431a52040088000872228823422120040815908282010),
.INIT_2(256'h448080402820304031e0a480c30182a02690a6384b0d128422882205840500d4),
.INIT_3(256'h22841006646004c0221041c3201000981401304084c038d000900000b8408180),
.INIT_4(256'h2124100030001412005620511108014140481010a09000123082004090902588),
.INIT_5(256'h208080408181490080a050c00000c480401109286002004010400004080a042c),
.INIT_6(256'h73c401ae00404450c0d083038a9a1c4c64c810c00106858c84801014040080e0),
.INIT_7(256'h04341030989850404cd0000020c00808016008a9024081815062001804841454),
.INIT_8(256'h48a8500042ec12901018108040b2024200a0004040540232001a001204277048),
.INIT_9(256'h02e04460420043728280026400b800020020008000720a2882ca4270820410a8),
.INIT_A(256'h40e100a19020008060a04058113120e830400c0000a0c1b9488048c80080005a),
.INIT_B(256'h88841481514990c5b0e00050419000407c45048090c0006430f010a010818069),
.INIT_C(256'h01a1006004400180c0c000c08001500070405041d0e090a210e9004102220088),
.INIT_D(256'hcaea042c10109070008842709000008000d140481000004818d898f080b81181),
.INIT_E(256'h1a8a1a9010781001c04018a050e8300002c00844160e100545650042524004a6),
.INIT_F(256'h82c080a0409018001a80041100801450108000c00032008012404250010850c2)
) _bn05 (
.RDATA(insn0[11:10]),
.RADDR(code_addr[10:0]),
.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),
.WCLK(clk), .WCLKE(unlocked), .WE(mem_wr & !mem_addr[12]),
.WADDR(mem_addr[11:1]),
.MASK(16'h0000), .WDATA(dout[11:10]));

SB_RAM2048x2 #(
.INIT_0(256'he71156007a00a72002002101d900af308e007d00b6600e00f7436a224e12b400),
.INIT_1(256'h21010a50e1004a00f5106b0041003c009f006e04aa0243017400fb203e009800),
.INIT_2(256'h76008c006f21dc00eb00a500eb212e001600fe007f014b0172000700ef04f620),
.INIT_3(256'h36042b206700f5004a400300390cd610e521d8804410780014007b21ca000d00),
.INIT_4(256'h631077001100171072427f40490869283200b200111012122302230039085500),
.INIT_5(256'he9009f023301fd00415039000900441051003b10570110100500060a420a2560),
.INIT_6(256'h4705c30254004448c500c3405f426d402c000c080f09a7802e121d00b4002400),
.INIT_7(256'h050190083c10c4213d004c02a4024c02052a8910e2906302530050011d005c00),
.INIT_8(256'h4b005a020600710216026a025e022600760a4202670226008e000a080f086300),
.INIT_9(256'h22000642134287000600bf40c30016000600120232029b000210860086002b08),
.INIT_A(256'h05003100b80010007c082020f1203c009000bc80d14159000c401a024f002200),
.INIT_B(256'h6c505d481504990028006120692060600d00e50014003010312015004940f901),
.INIT_C(256'h21005048c580f58011000308b7017341d402574296025602210107011e02d984),
.INIT_D(256'h03098501150398001b025300c400cd4047490800da000b029f80990016102100),
.INIT_E(256'h4f001b0872002101d5015c48070077040700371c0624930167017254c780c782),
.INIT_F(256'hae00321053101a006b011f01470136004200350033001800620c52005d509e10)
) _bn06 (
.RDATA(insn0[13:12]),
.RADDR(code_addr[10:0]),
.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),
.WCLK(clk), .WCLKE(unlocked), .WE(mem_wr & !mem_addr[12]),
.WADDR(mem_addr[11:1]),
.MASK(16'h0000), .WDATA(dout[13:12]));

SB_RAM2048x2 #(
.INIT_0(256'h10e6009400fa50b700de403d00cd007f4086003f01de008e00f610ca00dd00b5),
.INIT_1(256'h02f800da003f01da00ec00eb008910fc401701fe40ba00ca00b800ef41be4098),
.INIT_2(256'h316e00dc00ce009c04eb42ad1462007e005601fa00fe00ea00f200c710e90026),
.INIT_3(256'h403600ab00ef007e00de0483223500d202e504980254217e429c007c004e420d),
.INIT_4(256'h00730877005408030072007f004d006d102600b6c21d055a04cb00e744300051),
.INIT_5(256'h10e500ff013f00fd805d009c00a90076007f005d085700562845006e205b0075),
.INIT_6(256'h20cf08e3b05c407c20df20c7005d016c01ac10aa007f1067403e403d00f4807f),
.INIT_7(256'h80754438002c01ac00bc906d012c10ec003d00ff00be007f107f29d040fc00bb),
.INIT_8(256'h00fdb15e008600f7a81600ec00ff916a01fe348a00ef08f620de45ba00df14e1),
.INIT_9(256'h00d419e4007c000d211000df007721d608d5649b014e00772057009329d6108d),
.INIT_A(256'h00ad00b900d840b400bd00a400f000fc08dc00bd00f40048005c00bc00e911e6),
.INIT_B(256'h017c007d00b500190068046900fd807c100d01f4105d007020f9008d00e520fd),
.INIT_C(256'h0886807a00df00ff043b001f40bd08f700de001f2116007a08458063023e00ff),
.INIT_D(256'h14091085409404d8001f0cf300cc204d10ed049a30de046b00ff00dd00760061),
.INIT_E(256'h00eb20d7008600e500dc02c000a700f708e600ef00e200b308c6086600ef08c7),
.INIT_F(256'h006e005b087720df00ef20df00e600fe08e600fd08d7003d00ef00bea05e003e)
) _bn07 (
.RDATA(insn0[15:14]),
.RADDR(code_addr[10:0]),
.RCLK(clk), .RCLKE(1'b1), .RE(1'b1),
.WCLK(clk), .WCLKE(unlocked), .WE(mem_wr & !mem_addr[12]),
.WADDR(mem_addr[11:1]),
.MASK(16'h0000), .WDATA(dout[15:14]));

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
.WCLK(clk), .WCLKE(unlocked), .WE(mem_wr & mem_addr[12]),
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
.WCLK(clk), .WCLKE(unlocked), .WE(mem_wr & mem_addr[12]),
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
.WCLK(clk), .WCLKE(unlocked), .WE(mem_wr & mem_addr[12]),
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
.WCLK(clk), .WCLKE(unlocked), .WE(mem_wr & mem_addr[12]),
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
.WCLK(clk), .WCLKE(unlocked), .WE(mem_wr & mem_addr[12]),
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
.WCLK(clk), .WCLKE(unlocked), .WE(mem_wr & mem_addr[12]),
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
.WCLK(clk), .WCLKE(unlocked), .WE(mem_wr & mem_addr[12]),
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
.WCLK(clk), .WCLKE(unlocked), .WE(mem_wr & mem_addr[12]),
.WADDR(mem_addr[11:1]),
.MASK(16'h0000), .WDATA(dout[15:14]));

reg c11;
always @(posedge clk) c11 <= code_addr[11];
wire [15:0] cm = {16{c11}};
assign insn = (cm & insn1) | (~cm & insn0);
// assign insn = c11 ? insn1 : insn0;





endmodule // top
