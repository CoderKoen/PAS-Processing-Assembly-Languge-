# Processing Assembly Languge (PAL)
the .pde file is the runner.
PAL.py is the assembler.
app.asm is the example script that prints Hello World! when ran through the runner.

When using the runner the code can put stuff on a 255 by 255 px canvas.

0x00 = NULL = No Instruction
---
0x01 = LDP val = Load into Register P
---
0x02 = LDR val = Load into Register R
---
0x03 = DOT x y = point();
---
0x04 = PRTCHR charashex = println(ASCII)
---
0x05 = JTB byte = Jump to the nth byte in the program
---
0x06 = JIZ byte = jump if the 0 opcode is on
---
0x07 = BKGRD r g b = sets background to a rgb value
---
