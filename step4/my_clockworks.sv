/*
 * Clockworks includes
 *   - gearbox to divide clock frequency, used
 *     to let you observe how the design behaves
 *     one cycle at a time.
 *   - PLL to generate faster clock (This is not implemented yet, but that was the idea behind this file)
 *   - reset mechanism that resets the design (Again, not implemented yet)
 *     during the first microseconds because
 *     reading in Ice40 BRAM during the first 
 *     few microseconds returns garbage !
 *     (made me bang my head against the wall). 
 * 
 * Parameters
 *     SLOW number of bits of gearbox. Clock divider
 *       is (1 << SLOW)
 * 
 */    

module my_clockworks #(

    parameter SLOW=0
)(

   input  i_clk, // clock pin of the board
   input  rst, // reset pin of the board
   output o_clk,   // (optionally divided) clock for the design.
                 // divided if SLOW is different from zero.
);               
   generate

/****************************************************

 Slow speed mode.
 - Create a clock divider to let observe what happens.
 - Nothing special to do for reset
 
 ****************************************************/
      if(SLOW != 0) begin
        clock_divider #(.MODULO(SLOW)) div_clock (
            .clk(i_clk),
            .rst(rst),
            .tick(o_clk)
        );


/****************************************************

 High speed mode.
 - Nothing special to do for the clock
 - A timer that resets the design during the first
   few microseconds, because reading in Ice40 BRAM 
   during the first few microseconds returns garbage !
   (made me bang my head against the wall).
 
 ****************************************************/
	 
      end else begin 
	
        assign o_clk=i_clk;
      end

   endgenerate

endmodule