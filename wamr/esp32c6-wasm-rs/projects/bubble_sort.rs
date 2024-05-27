#![no_std]
#![no_main]

use core::panic::PanicInfo;

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {}
}

fn bubble_sort(arr: &mut [u32]) {
    let len = arr.len();
    for _ in 0..len {
        let mut swapped = false;
        for j in 1..len {
            if arr[j - 1] > arr[j] {
                arr.swap(j - 1, j);
                swapped = true;
            }
        }
        if !swapped {
            break;
        }
    }
}

#[no_mangle]
pub extern "C" fn main() -> () {
    let mut numbers = [64, 34, 25, 12, 22, 11, 90];
    bubble_sort(&mut numbers);
}
