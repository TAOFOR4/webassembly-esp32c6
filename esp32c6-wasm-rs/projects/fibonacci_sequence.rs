// src/main.rs

fn fibonacci(n: u32) -> u32 {
    let mut a = 0;
    let mut b = 1;
    let mut temp;

    for _ in 0..n {
        temp = a;
        a = b;
        b = temp + b;
    }

    a
}

fn main() {
    let n = 20;
    println!("Fibonacci {}: {}", n, fibonacci(n));
}
