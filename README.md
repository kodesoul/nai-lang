# nai-lang

Toy programming language.

# NOTE !!!

I'm archiving this project since I lost interest.

However I recommend looking at the examples folder 
with c files and the handwritten llvm ir text file 
translations.

LLVM gets really annoying once things get complex 
so I also recommend checking out [qbe](https://c9x.me/compile/)
for easier compiler backends to machine code.

Some of the resources I recommend are: 

- [crafting interpreters - lox language](https://craftinginterpreters.com/)
- [buzz lang - written in zig for inspiration](https://buzz-lang.dev/)
- [qbe - compiler backend](https://c9x.me/compile/)
- tsoding daily youtube videos of qbe and llvm
- implementations of lox language on github in different languages.
- lua reference guide.

## Description 

Weekend code jam for Rust Nairobi. 

### Compilation 

1. Compile a `file.nl` file to `file.ll` llvm ir text file. 
2. Call `zig cc file.ll -o file` or `clang file.ll` to produce machine code.

## Dependencies

- libc 
- zig 0.13
- clang (optional)
