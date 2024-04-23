(module
  (type (;0;) (func (param i32) (result i32)))
  (func (;0;) (type 0) (param i32) (result i32)
    (local i32 i32)
    local.get 0
    i32.const 2
    i32.lt_s
    if  ;; label = @1
      local.get 0
      return
    end
    loop  ;; label = @1
      local.get 0
      i32.const 1
      i32.sub
      call 0
      local.get 1
      i32.add
      local.set 1
      local.get 0
      i32.const 3
      i32.gt_u
      local.get 0
      i32.const 2
      i32.sub
      local.set 0
      br_if 0 (;@1;)
    end
    local.get 0
    local.get 1
    i32.add)
  (memory (;0;) 1)
  (export "memory" (memory 0))
  (export "fib" (func 0)))
