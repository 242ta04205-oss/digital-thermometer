module digital_thermometer #(
    parameter HIGH_TEMP = 40
)(
    input  wire       clk,
    input  wire       reset,

    input  wire [7:0] temperature,

    output reg [7:0]  temperature_out,
    output reg        high_temp,
    output reg        normal_temp
);

    always @(posedge clk or posedge reset) begin

        if (reset) begin
            temperature_out <= 8'd0;
            high_temp       <= 1'b0;
            normal_temp     <= 1'b0;
        end

        else begin

            // Store measured temperature
            temperature_out <= temperature;

            // Temperature comparison
            if (temperature >= HIGH_TEMP) begin
                high_temp   <= 1'b1;
                normal_temp <= 1'b0;
            end

            else begin
                high_temp   <= 1'b0;
                normal_temp <= 1'b1;
            end

        end

    end

endmodule