# MyOwn-FPGA-Journey-SV

## This repo is intended to include all my tests and short scripts using SystemVerilog

Using the Clock-divider source code for example:<br/>
### Sythetizing: <br/>
**Loading the design:** <br/>
Yosys - slang front end module / verify, compile and Create AST Abstract Syntax Tree (AST). <br/>
**usage:** <br/>
'yosys -m slang' <br/> 
'read_slang clock-div.sv' <br/>
**Elaboration: Tech-mapping and optimization:** <br/>
'synth_ice40 -top clock_divider -json hardware.json'

### Upload to icestick: <br/>
**Place and route tool for ice40 devices:** <br/>
'nextpnr-ice40 --hx1k --package tq144 --json hardware.json --asc hardware.asc --pcf top-design.pcf -q' <br/>
'icepack hardware.asc hardware.bin' <br/>
* -d indica el vendor ID y el product ID del dispositivo USB, en este caso el del chip ftdi* <br/>
'iceprog -d i:0x0403:0x6010:0 hardware.bin'
