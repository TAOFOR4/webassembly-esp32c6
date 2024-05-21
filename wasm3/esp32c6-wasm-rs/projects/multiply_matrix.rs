#![no_std]
#![no_main]

use core::panic::PanicInfo;

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {}
}

const SIZE: usize = 3; // Example for a 3x3 matrix

fn matrix_multiply(a: [[u32; SIZE]; SIZE], b: [[u32; SIZE]; SIZE]) -> [[u32; SIZE]; SIZE] {
    let mut result = [[0u32; SIZE]; SIZE];
    for i in 0..SIZE {
        for j in 0..SIZE {
            for k in 0..SIZE {
                result[i][j] += a[i][k] * b[k][j];
            }
        }
    }
    result
}

#[no_mangle]
pub extern "C" fn main() -> () {
    let a = [[1, 2, 3], [4, 5, 6], [7, 8, 9]];
    let b = [[9, 8, 7], [6, 5, 4], [3, 2, 1]];
    let _ = matrix_multiply(a, b);
}
