# MyOwn-FPGA-Journey-SV

## This repo is intended to include all my tests and short scripts using SystemVerilog

Using the Clock-divider source code for example:
### Sythetizing: 
Loading the design:
Yosys - slang front end module / verify, compile and Create AST Abstract Syntax Tree (AST). 
*usage:*
'yosys -m slang'
'read_slang clock-div.sv'
*Elaboration: Tech-mapping and optimization:*
'synth_ice40 -top clock_divider -json hardware.json'

### Upload to icestick:
*Place and route tool for ice40 devices:*
'nextpnr-ice40 --hx1k --package tq144 --json hardware.json --asc hardware.asc --pcf top-design.pcf -q'
'icepack hardware.asc hardware.bin'
/ -d indica el vendor ID y el product ID del dispositivo USB, en este caso el del chip ftdi
'iceprog -d i:0x0403:0x6010:0 hardware.bin'
