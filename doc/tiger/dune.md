```dune
(library
 (name tiger)
 (modules tiger)
 (libraries ppx_string)
 (preprocess
  (pps ppx_string)))

(test
 (modules test)
 (libraries tiger)
 (name test))
```
