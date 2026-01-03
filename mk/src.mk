# .mk files
MK += Makefile $(wildcard mk/*.mk)

# cmake files
CM += CMake* $(wildcard cmake/*.cmake)

# C/C++
C  += $(wildcard src/*.c*)
H  += $(wildcard inc/*.h*)
LX += $(wildcard src/*.lex src/*.yacc src/*.ragel)
# libs
C  += $(wildcard lib/src/*.c*) $(wildcard lib/*/src/*.c*)
H  += $(wildcard lib/inc/*.h*) $(wildcard lib/*/inc/*.h*)

# Rust
R  += $(wildcard src/*.rs) Cargo.toml

# ini
S  += $(wildcard lib/*.ini) $(wildcard lib/*.f)

# OCaml
M += $(wildcard lib/*.ml*) $(wildcard legas/*.ml*)
