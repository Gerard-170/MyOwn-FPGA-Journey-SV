# MyOwn-FPGA-Journey-SV

## This repo is intended to include all my tests and short scripts using SystemVerilog

Using the Clock-divider source code for example:
### Sythetizing: 
Loading the design:
\nYosys - slang front end module / verify, compile and Create AST Abstract Syntax Tree (AST). 
\n*usage:*
\n'yosys -m slang'
\n'read_slang clock-div.sv'
\n*Elaboration: Tech-mapping and optimization:*
\n'synth_ice40 -top clock_divider -json hardware.json'

### Upload to icestick:
\n*Place and route tool for ice40 devices:*
\n'nextpnr-ice40 --hx1k --package tq144 --json hardware.json --asc hardware.asc --pcf top-design.pcf -q'
\n'icepack hardware.asc hardware.bin'
\n/ -d indica el vendor ID y el product ID del dispositivo USB, en este caso el del chip ftdi
\n'iceprog -d i:0x0403:0x6010:0 hardware.bin'
