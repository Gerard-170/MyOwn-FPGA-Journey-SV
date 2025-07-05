module led_blinky(
    //Inputs
    input       clk,
    input		rst,

    //Outputs
    output [4:0] led
);

    bit [20:0][4:0] m_data;
    int count = 0;
    reg [4:0] out_reg_led = 5'b00000;

    initial begin 
        for (int i = 0; i < $size(m_data); i++) begin
            $display ("m_data[%0d] = %b (0x%0h)", i, m_data[i], m_data[i]);
            m_data[i] = i;
        end
    end

    // Internal signals
	wire rst_signal;
    wire clk_local;
	
	//Invert active-low button
	assign rst_signal = ~rst;
    assign led = out_reg_led;
    
    clock_divider #(.MODULO(8)) div_clock (
        .clk(clk),
        .rst(rst_signal),
        .tick(clk_local)
    );

    always @ (posedge clk_local or posedge rst_signal) begin
        if (rst_signal == 1'b1) begin
            out_reg_led <= 5'b00000;
        end else begin
            if (count < $size(m_data)) begin
                count <= count + 1;
                out_reg_led <= m_data[count];
            end else begin
                out_reg_led <= 5'b00000;
                count <= 0;
            end
        end
    end

endmodule
