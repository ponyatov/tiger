```lisp
(lang dune 3.20)

(name mci)

(generate_opam_files true)

(source
 (github ponyatov/mci))

(authors "Andrew W. Appel <appel@cs.princeton.edu>")

(maintainers "Dmitry Ponyatov <dponyatov@gmail.com>")

(license MIT)

(documentation https://github.com/ponyatov/mci/wiki)

(package
 (name mci)
 (synopsis "Modern Compiler Implementation in OCaml")
 (description "embedded Tiger -> C/C++ translator")
 (depends ocaml utop dune)
 (tags ("embedded" "compiler" translator)))
```
