`timescale 1ns/1ps

module digital_thermometer_tb;

    reg clk;
    reg reset;

    reg [7:0] temperature;

    wire [7:0] temperature_out;
    wire high_temp;
    wire normal_temp;

    // Instantiate design
    digital_thermometer #(
        .HIGH_TEMP(40)
    ) uut (
        .clk(clk),
        .reset(reset),
        .temperature(temperature),
        .temperature_out(temperature_out),
        .high_temp(high_temp),
        .normal_temp(normal_temp)
    );

    // Clock generation
    always #5 clk = ~clk;

    initial begin

        // Create waveform
        $dumpfile("simulation/digital_thermometer.vcd");
        $dumpvars(0, digital_thermometer_tb);

        // Initial values
        clk = 0;
        reset = 1;
        temperature = 0;

        // Reset
        #20;
        reset = 0;

        // Test 1: 25°C
        temperature = 25;
        #20;

        // Test 2: 30°C
        temperature = 30;
        #20;

        // Test 3: 35°C
        temperature = 35;
        #20;

        // Test 4: 40°C
        temperature = 40;
        #20;

        // Test 5: 45°C
        temperature = 45;
        #20;

        // Test 6: 50°C
        temperature = 50;
        #20;

        // Return to normal
        temperature = 30;
        #20;

        $finish;

    end

    // Display simulation results
    initial begin

        $monitor(
            "Time=%0t | Temperature=%0d C | Output=%0d C | HIGH=%b | NORMAL=%b",
            $time,
            temperature,
            temperature_out,
            high_temp,
            normal_temp
        );

    end

endmodule