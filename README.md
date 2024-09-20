Simple Calculator in Assembly (NASM) for macOS

This project is a simple calculator implemented in x86_64 assembly using NASM. The calculator allows users to input two numbers and select an arithmetic operation (+ or -). It performs the calculation and outputs the result.
Features

    Input: Two numbers and a basic arithmetic operation (+ or -).
    Output: Displays the result of the operation.
    Error Handling: Detects and responds to invalid operations.

Requirements

    macOS (64-bit)
    NASM (Netwide Assembler)
    x86_64 architecture
    Linker (ld)

Installation

    Install NASM via Homebrew:

    bash

brew install nasm

Clone the Repository or download calculator.asm:

bash

git clone <repository-url>
cd <repository-directory>

Assemble the Program:

bash

nasm -f macho64 -o calculator.o calculator.asm

Link the Object File to create the executable:

bash

ld -macos_version_min 10.7 -o calculator calculator.o -lSystem

Run the Program:

bash

    ./calculator

    Follow Prompts to enter two numbers and choose an operation (+ or -).

Usage

After running the program, follow the on-screen prompts to input the first number, the second number, and the desired operation. The program will output the result or display an error message if an invalid operation is selected.
Example

bash

Enter first number: 7
Enter second number: 5
Choose operation (+ or -): -
Result: 2

If an invalid operation is entered:

bash

Enter first number: 4
Enter second number: 3
Choose operation (+ or -): *
Invalid operation!

Notes

    The program currently supports only integer addition and subtraction.
    Ensure NASM is installed correctly, and the commands are executed in a 64-bit macOS environment.

License

This project is licensed under the MIT License.