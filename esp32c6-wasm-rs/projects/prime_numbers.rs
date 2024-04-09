// src/main.rs

fn sieve_of_eratosthenes(limit: usize) -> Vec<usize> {
    let mut primes = vec![true; limit + 1];
    let mut result = Vec::new();

    for number in 2..=limit {
        if primes[number] {
            result.push(number);
            let mut multiple = number * 2;
            while multiple <= limit {
                primes[multiple] = false;
                multiple += number;
            }
        }
    }

    result
}

fn main() {
    let limit = 100;
    let primes = sieve_of_eratosthenes(limit);
    println!("Primes up to {}: {:?}", limit, primes);
}
