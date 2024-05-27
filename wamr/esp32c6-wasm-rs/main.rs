#![no_std]
#![no_main]

use core::panic::PanicInfo;

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {}
}

fn sum_natural_numbers(n: u32) -> u32 {
    (n * (n + 1)) / 2
}

#[no_mangle]
pub extern "C" fn main() -> u32 {
    let n = 1000;
    sum_natural_numbers(n)
}
