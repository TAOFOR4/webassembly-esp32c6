// src/main.rs

fn simple_hash(s: &str) -> u64 {
    let mut hash = 0u64;

    for byte in s.bytes() {
        hash = hash.wrapping_mul(31).wrapping_add(byte as u64);
    }

    hash
}

fn main() {
    let text = "hello, wasm on esp32-c6";
    println!("Hash of '{}': {}", text, simple_hash(text));
}
