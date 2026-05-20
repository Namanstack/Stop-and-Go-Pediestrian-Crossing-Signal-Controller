# Stop-and-Go-Pedestrian-Crossing-Signal-Controller

## About
This project presents an FPGA-based Stop-and-Go Pedestrian Crossing Signal Controller designed using Verilog/VHDL and Finite State Machine (FSM) concepts. The system controls vehicle and pedestrian traffic signals with synchronized timing and a countdown display, ensuring safe and efficient road crossing.

The design was developed using Quartus Prime and verified through ModelSim simulation before hardware implementation on an FPGA board.

## Features
- FPGA-based traffic signal controller
- Finite State Machine (FSM) implementation
- Countdown timer using 7-segment display
- Vehicle and pedestrian signal synchronization
- Real-time hardware-based operation
- Supports onboard FPGA and breadboard implementation

## Technologies Used
- Verilog/VHDL
- Intel Quartus Prime
- ModelSim
- Cyclone IV FPGA

## Source Files
- `seven_segment.v` → Controls the 7-segment display
- `timer.v` → Generates timing pulses
- `traffic_controller.v` → Implements FSM logic
- `top_module.v` → Connects all modules together

## Working
The system follows the sequence:

Vehicle Green → Vehicle Yellow → Pedestrian Walk → Reset

A countdown timer displays the remaining time for each state transition.

## Future Scope
- Sensor-based pedestrian detection
- Smart traffic monitoring
- Wireless communication between intersections
- AI-based traffic optimization

## Author
Naman Samadhiya  
Electronics Engineering (VLSI Design & Technology)
Shauryansh 
Electronics Engineering (VLSI Design & Technology)
