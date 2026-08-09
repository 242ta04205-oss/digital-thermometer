# 🌡️ Digital Thermometer Using Verilog HDL

## 📌 Project Overview

This project implements a Digital Thermometer using Verilog HDL.

The system receives an 8-bit digital temperature value from a simulated temperature sensor and displays the measured temperature through a digital output.

The system also identifies whether the temperature is normal or above a predefined high-temperature threshold.

---

## 🎯 Objectives

- Measure digital temperature values.
- Display the temperature digitally.
- Compare the temperature with a predefined limit.
- Generate a high-temperature alert.
- Generate a normal-temperature indication.
- Verify the design using a Verilog testbench.
- Analyze the design using simulation waveforms.

---

## ⚙️ Working Principle

```text
       +----------------------+
       | Temperature Sensor   |
       +----------+-----------+
                  |
                  v
       +----------------------+
       |                      |
       |  Verilog Controller   |
       |                      |
       +----------+-----------+
                  |
          +-------+-------+
          |               |
          v               v
   Temperature       Temperature
     Output             Status
                          |
                    +-----+-----+
                    |           |
                  NORMAL      HIGH