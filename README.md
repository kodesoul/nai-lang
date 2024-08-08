# nai-lang

Toy programming language.

## Description 

Weekend code jam for Rust Nairobi. 

### Compilation 

1. Compile a `file.nl` file to `file.ll` llvm ir text file. 
2. Call `zig cc file.ll -o file` or `clang file.ll` to produce machine code.

## Dependencies

- libc 
- zig 0.13
- clang (optional)
