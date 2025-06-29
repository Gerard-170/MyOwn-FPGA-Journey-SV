module clock_divider #(

    // Parameters
    parameter   MODULO  = 6000000
) (
    
    // Inputs
    input   clk,
    input   rst,
    
    // Outputs
    output  tick
);

    // Calculate number of bits needed for the counter
    localparam WIDTH = (MODULO == 1) ? 1 : $clog2(MODULO);

    // Internal storage elements
    reg [WIDTH-1:0] count = 0;

    // Tick is high for one clock cycle at max count
    assign tick = (count == MODULO - 1) ? 1'b1 : 1'b0;
    
    // Count up, reset on tick pulse
    always @ (posedge clk or posedge rst) begin
        if (rst == 1'b1) begin
            count <= 0;
        end else if (tick == 1'b1) begin
            count <= 0;
        end else begin
            count <= count + 1;
        end
    end
    
endmodule