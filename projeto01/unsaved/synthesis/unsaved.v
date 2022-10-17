// unsaved.v

// Generated using ACDS version 20.1 720

`timescale 1 ps / 1 ps
module unsaved (
		input  wire        clk_clk,       //   clk.clk
		input  wire        reset_reset_n, // reset.reset_n
		inout  wire [15:0] sram_DQ,       //  sram.DQ
		output wire [19:0] sram_ADDR,     //      .ADDR
		output wire        sram_LB_N,     //      .LB_N
		output wire        sram_UB_N,     //      .UB_N
		output wire        sram_CE_N,     //      .CE_N
		output wire        sram_OE_N,     //      .OE_N
		output wire        sram_WE_N      //      .WE_N
	);

	wire    rst_controller_reset_out_reset; // rst_controller:reset_out -> sram:reset

	unsaved_sram sram (
		.clk           (clk_clk),                        //                clk.clk
		.reset         (rst_controller_reset_out_reset), //              reset.reset
		.SRAM_DQ       (sram_DQ),                        // external_interface.export
		.SRAM_ADDR     (sram_ADDR),                      //                   .export
		.SRAM_LB_N     (sram_LB_N),                      //                   .export
		.SRAM_UB_N     (sram_UB_N),                      //                   .export
		.SRAM_CE_N     (sram_CE_N),                      //                   .export
		.SRAM_OE_N     (sram_OE_N),                      //                   .export
		.SRAM_WE_N     (sram_WE_N),                      //                   .export
		.address       (),                               //  avalon_sram_slave.address
		.byteenable    (),                               //                   .byteenable
		.read          (),                               //                   .read
		.write         (),                               //                   .write
		.writedata     (),                               //                   .writedata
		.readdata      (),                               //                   .readdata
		.readdatavalid ()                                //                   .readdatavalid
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (0),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (~reset_reset_n),                 // reset_in0.reset
		.clk            (clk_clk),                        //       clk.clk
		.reset_out      (rst_controller_reset_out_reset), // reset_out.reset
		.reset_req      (),                               // (terminated)
		.reset_req_in0  (1'b0),                           // (terminated)
		.reset_in1      (1'b0),                           // (terminated)
		.reset_req_in1  (1'b0),                           // (terminated)
		.reset_in2      (1'b0),                           // (terminated)
		.reset_req_in2  (1'b0),                           // (terminated)
		.reset_in3      (1'b0),                           // (terminated)
		.reset_req_in3  (1'b0),                           // (terminated)
		.reset_in4      (1'b0),                           // (terminated)
		.reset_req_in4  (1'b0),                           // (terminated)
		.reset_in5      (1'b0),                           // (terminated)
		.reset_req_in5  (1'b0),                           // (terminated)
		.reset_in6      (1'b0),                           // (terminated)
		.reset_req_in6  (1'b0),                           // (terminated)
		.reset_in7      (1'b0),                           // (terminated)
		.reset_req_in7  (1'b0),                           // (terminated)
		.reset_in8      (1'b0),                           // (terminated)
		.reset_req_in8  (1'b0),                           // (terminated)
		.reset_in9      (1'b0),                           // (terminated)
		.reset_req_in9  (1'b0),                           // (terminated)
		.reset_in10     (1'b0),                           // (terminated)
		.reset_req_in10 (1'b0),                           // (terminated)
		.reset_in11     (1'b0),                           // (terminated)
		.reset_req_in11 (1'b0),                           // (terminated)
		.reset_in12     (1'b0),                           // (terminated)
		.reset_req_in12 (1'b0),                           // (terminated)
		.reset_in13     (1'b0),                           // (terminated)
		.reset_req_in13 (1'b0),                           // (terminated)
		.reset_in14     (1'b0),                           // (terminated)
		.reset_req_in14 (1'b0),                           // (terminated)
		.reset_in15     (1'b0),                           // (terminated)
		.reset_req_in15 (1'b0)                            // (terminated)
	);

endmodule
