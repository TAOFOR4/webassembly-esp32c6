(module
  (type (;0;) (func (param i32 i32) (result i32)))
  (type (;1;) (func (param i32) (result i32)))
  (import "env" "printf" (func (;0;) (type 0)))
  (import "env" "putchar" (func (;1;) (type 1)))
  (import "env" "puts" (func (;2;) (type 1)))
  (func (;3;) (type 0) (param i32 i32) (result i32)
    global.get 0
    i32.const 112
    i32.sub
    local.tee 0
    global.set 0
    i32.const 1028
    call 2
    drop
    local.get 0
    i32.const 11
    i32.store offset=96
    i32.const 1024
    local.get 0
    i32.const 96
    i32.add
    call 0
    drop
    local.get 0
    i32.const 12
    i32.store offset=80
    i32.const 1024
    local.get 0
    i32.const 80
    i32.add
    call 0
    drop
    local.get 0
    i32.const 22
    i32.store offset=64
    i32.const 1024
    local.get 0
    i32.const -64
    i32.sub
    call 0
    drop
    local.get 0
    i32.const 25
    i32.store offset=48
    i32.const 1024
    local.get 0
    i32.const 48
    i32.add
    call 0
    drop
    local.get 0
    i32.const 34
    i32.store offset=32
    i32.const 1024
    local.get 0
    i32.const 32
    i32.add
    call 0
    drop
    local.get 0
    i32.const 64
    i32.store offset=16
    i32.const 1024
    local.get 0
    i32.const 16
    i32.add
    call 0
    drop
    local.get 0
    i32.const 90
    i32.store
    i32.const 1024
    local.get 0
    call 0
    drop
    i32.const 10
    call 1
    drop
    local.get 0
    i32.const 112
    i32.add
    global.set 0
    i32.const 0)
  (memory (;0;) 1)
  (global (;0;) (mut i32) (i32.const 5152))
  (global (;1;) i32 (i32.const 1043))
  (global (;2;) i32 (i32.const 5152))
  (export "memory" (memory 0))
  (export "main" (func 3))
  (export "__data_end" (global 1))
  (export "__heap_base" (global 2))
  (data (;0;) (i32.const 1024) "%d \00Sorted array: "))
