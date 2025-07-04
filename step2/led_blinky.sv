module led_blinky(
    //Inputs
    input       clk,
    input		rst,

    //Outputs
    output reg      led
);

    // Internal signals
	wire rst_signal;
    wire clk_local;
	
	//Invert active-low button
	assign rst_signal = ~rst;
    
    clock_divider div_clock (
        .clk(clk),
        .rst(rst_signal),
        .tick(clk_local)
    );

    always @ (posedge clk_local or posedge rst_signal) begin
        if (rst_signal == 1'b1)
            led <= 1'b0;
        else
            led <= ~led;
    end

endmodule
