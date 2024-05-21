(module
  (type (;0;) (func (result i32)))
  (func (;0;) (type 0) (result i32)
    (local i32 i32 i32 i32 i32)
    global.get 0
    i32.const 256
    i32.sub
    local.tee 3
    global.set 0
    i32.const 3
    local.set 0
    loop  ;; label = @1
      local.get 0
      local.get 3
      i32.add
      local.tee 1
      local.get 0
      i32.store8
      local.get 1
      i32.const 4
      i32.add
      local.get 0
      i32.const 4
      i32.add
      local.tee 4
      i32.store8
      local.get 1
      i32.const 3
      i32.add
      local.get 0
      i32.const 3
      i32.add
      i32.store8
      local.get 1
      i32.const 2
      i32.add
      local.get 0
      i32.const 2
      i32.add
      i32.store8
      local.get 1
      i32.const 1
      i32.add
      local.get 0
      i32.const 1
      i32.add
      i32.store8
      local.get 1
      i32.const 1
      i32.sub
      local.get 0
      i32.const 3
      i32.sub
      local.tee 2
      i32.const 2
      i32.add
      i32.store8
      local.get 1
      i32.const 2
      i32.sub
      local.get 2
      i32.const 1
      i32.add
      i32.store8
      local.get 1
      i32.const 3
      i32.sub
      local.get 2
      i32.store8
      local.get 0
      i32.const 8
      i32.add
      local.set 0
      local.get 4
      i32.const 255
      i32.ne
      br_if 0 (;@1;)
    end
    i32.const 0
    local.set 0
    i32.const 0
    local.set 1
    loop  ;; label = @1
      local.get 1
      local.get 0
      local.get 3
      i32.add
      local.tee 2
      i32.load8_u
      i32.add
      local.get 2
      i32.const 1
      i32.add
      i32.load8_u
      i32.add
      local.get 2
      i32.const 2
      i32.add
      i32.load8_u
      i32.add
      local.get 2
      i32.const 3
      i32.add
      i32.load8_u
      i32.add
      local.set 1
      local.get 0
      i32.const 4
      i32.add
      local.tee 0
      i32.const 256
      i32.ne
      br_if 0 (;@1;)
    end
    local.get 3
    i32.const 256
    i32.add
    global.set 0
    local.get 1
    i32.const 255
    i32.rem_u)
  (memory (;0;) 1)
  (global (;0;) (mut i32) (i32.const 5120))
  (export "memory" (memory 0))
  (export "calculate_checksum" (func 0)))
