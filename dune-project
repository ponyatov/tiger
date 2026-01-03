(lang dune           3.20)
(name                tiger)
(generate_opam_files true)
(authors             "Andrew W. Appel <appel@cs.princeton.edu>")
(maintainers         "Dmitry Ponyatov <dponyatov@gmail.com>")
(bug_reports         "dponyatov@gmail.com")
(homepage            "github: https://github.com/ponyatov/tiger")
(license             "MIT")
(source              (github ponyatov/tiger))
(package
 (name                tiger)
 (synopsis            "Modern Compiler Implementation in OCaml")
 (description         "
embedded Tiger -> C/C++ translator

- OCaml workout
- ASCII data parsing
- programming language workbench
")
 (tags
  ("embedded" "compiler" translator))
 (allow_empty)
 (depends ocaml utop dune)
)
