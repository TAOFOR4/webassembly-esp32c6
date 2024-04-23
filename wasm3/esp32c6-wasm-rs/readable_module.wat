(module
  (type (;0;) (func (param i32) (result i32)))
  (type (;1;) (func))
  (import "env" "puts" (func (;0;) (type 0)))
  (func (;1;) (type 1)
    i32.const 32768
    call 0
    drop)
  (memory (;0;) 1)
  (export "memory" (memory 0))
  (export "main" (func 1))
  (data (;0;) (i32.const 32768) "Hello Rust World!"))
