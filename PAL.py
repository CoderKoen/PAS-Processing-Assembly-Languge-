"""
  Processing Assembly Language Assembler
  By Koen
  Made in Python
  January, 22, 2024
  
  Processing Refrence:
  https://processing.org/reference
"""

import sys
import array

import sys

def print_hexlist(binary_file):
    for byte in binary_file:
        print(hex(byte), end=" ")
    print("")

if len(sys.argv) < 2:
    print("Usage: python3 PAL.py [file]")
    exit(0)

with open(sys.argv[1], "r") as f:
    asm = f.read()

asm_list = asm.upper().split()
binary_file = []

for i in range(len(asm_list)):
    if asm_list[i] == "NULL":
        binary_file.append(0x00)
    elif asm_list[i] == "LDP":
        binary_file.append(0x01)
        binary_file.append(int(asm_list[i+1], 16))
    elif asm_list[i] == "LDR":
        binary_file.append(0x02)
        binary_file.append(int(asm_list[i+1], 16))
    elif asm_list[i] == "DOT":
        binary_file.append(0x03)
        binary_file.append(int(asm_list[i+1], 16))
        binary_file.append(int(asm_list[i+2], 16))
    elif asm_list[i] == "PRTCHR":
        binary_file.append(0x04)
        binary_file.append(int(asm_list[i+1], 16))
    elif asm_list[i] == "JTB":
        binary_file.append(0x05)
        binary_file.append(int(asm_list[i+1], 16))
    elif asm_list[i] == "JIZ":
        binary_file.append(0x06)
        binary_file.append(int(asm_list[i+1], 16))

print_hexlist(binary_file)

with open("code.bin", "wb") as f:
    f.write(bytearray(binary_file))