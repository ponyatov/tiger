(** Modern Compiler Implementation in OCaml *)

let multiline =
  {|
Это многострочная строка.
Она может содержать "кавычки" без экранирования.
Переменные не интерполируются: имя = %s
|}

let code_example =
  print_endline
    {_|
    let x = 5
    let y = 10
    let sum = x + y
    print_int sum
|_}

(* Все строки будут выровнены по минимальному отступу *)

let hello () =
  let hello = "Hello" in
  let world = "World" in
  print_endline [%string "%{hello#:3} %{world} %{123#Int:5} times"]
