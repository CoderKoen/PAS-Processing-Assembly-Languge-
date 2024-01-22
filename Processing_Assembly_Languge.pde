/*
  Processing Assembly Language
  By Koen
  Made in Processing
  January, 21, 2024
  
  Processing Refrence:
  https://processing.org/reference

--------------------------------------------

0x00 = NULL = No Instruction
0x01 = LDP = Load into Register P
0x02 = LDR = Load into Register R
0x03 = DOT = point();
0x04 = PRTCHR = println(ASCII)
0x05 = JTB = Jump to the nth byte in the program
0x06 = JIZ = jump if the 0 opcode is on
0x07 = BKGRD = sets background to a rgb value
0x08 = FILL = fills the next render (Not Implemented)
*/

int P = 0; // At
int R = 0;
int[] opcodes = {0, 0}; // 1st = zero flag, 2nd = negative flag

void setup() {
  size(255, 255);
  byte[] code = loadBytes("code.bin");

  for (int i = 0; i < code.length; i++) {
    switch (code[i]) {
      case 0x01:
        if (i + 1 < code.length) {
          P = code[i + 1];
          println("P = " + P);
        } else {
          println("Error: Incomplete data for instruction 0x01");
        }
        break;

      case 0x02:
        if (i + 1 < code.length) {
          R = code[i + 1];
          println("R = " + R);
        } else {
          println("Error: Incomplete data for instruction 0x02");
        }
        break;

      case 0x03:
        if (i + 2 < code.length) {
          strokeWeight(4);
          point(abs(int(code[i + 1])), abs(int(code[i + 2])));
        } else {
          println("Error: Incomplete data for instruction 0x03");
        }
        break;

      case 0x04:
        if (i + 1 < code.length) {
          print(char(code[i + 1]));
        } else {
          println("Error: Incomplete data for instruction 0x04");
        }
        break;

      case 0x05:
        if (i + 1 < code.length) {
          int jumpTarget = abs(int(code[i + 1]));
          if (jumpTarget < code.length) {
            i = jumpTarget - 1; // -1 to compensate for the automatic increment at the end of the loop
          } else {
            println("Error: Jump target out of bounds");
          }
        } else {
          println("Error: Incomplete data for instruction 0x05");
        }
        break;

      case 0x06:
        if (i + 1 < code.length) {
          int jumpTarget = abs(int(code[i + 1]));
          if (jumpTarget < code.length && opcodes[0] == 1) {
            i = jumpTarget - 1; // -1 to compensate for the automatic increment at the end of the loop
          } else {
            println("Error: Jump target out of bounds or zero flag not set");
          }
        } else {
          println("Error: Incomplete data for instruction 0x06");
        }
        break;
      case 0x07:
        if (i + 3 < code.length) {
          int r = abs(int(code[i+1]));
          int g = abs(int(code[i+2]));
          int b = abs(int(code[i+3]));
          background(r,g,b);
        } else {
          println("Error: Incomplete data for instruction 0x06");
        }
        break;
        
    }
  }
}
