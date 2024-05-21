#![no_std]
#![no_main]

use core::panic::PanicInfo;

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {}
}

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

#[no_mangle]
pub extern "C" fn main() -> u32 {
    let n = 20;
    let result = fibonacci(n);
    result // Ensure the result of the Fibonacci function is returned from main
}
