# Simple Calculator in Assembly (NASM) for macOS

This project is a simple calculator implemented in x86_64 assembly using NASM. The calculator accepts two numbers and an operation (`+` or `-`), performs the calculation, and outputs the result. It works on macOS and uses system calls for input/output.

## Features

- Input: Two numbers and an arithmetic operation (`+` for addition or `-` for subtraction).
- Output: Displays the result of the arithmetic operation.
- Handles basic error-checking for invalid operations.

## Requirements

- macOS (64-bit)
- NASM (Netwide Assembler)
- x86_64 architecture
- Linker (`ld`) for macOS

## Installation

To install NASM on macOS, you can use [Homebrew](https://brew.sh/):

```bash
brew install nasm

Usage

    Clone the repository or download the calculator.asm file to your local machine.

    Open your terminal and navigate to the directory where calculator.asm is located.

    Assemble the program using NASM:

    bash

nasm -f macho64 -o calculator.o calculator.asm

Link the object file to create an executable:

bash

ld -macos_version_min 10.7 -o calculator calculator.o -lSystem

Run the program:

bash

    ./calculator

    Follow the on-screen prompts to enter two numbers and an operation (+ or -).

    The result of the operation will be displayed.

Example

Here’s an example interaction with the calculator:

sql

Enter first number: 7
Enter second number: 5
Choose operation (+ or -): -
Result: 2

If you enter an invalid operation (any character other than + or -), the program will display an error message:

mathematica

Enter first number: 4
Enter second number: 3
Choose operation (+ or -): *
Invalid operation!

This simple interaction shows how the program handles valid input for basic arithmetic and manages invalid operations.
