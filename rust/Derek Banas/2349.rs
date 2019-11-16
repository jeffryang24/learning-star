use std::{i8, i16, i32, i64, u8, u16, u32, u64, isize, usize, f32, f64};

use std::io::stdin;

fn main() {
    let is_it_true: bool = true;

    let let_x: char = 'x';

    let (f_name, l_name) = ("Derek", "Banas");

    println!("It is {0} that {1} is {0}",  is_it_true, let_x);

    println!("{:.2}", 1.234);

    println!("B: {:b}, H: {:x} O: {:o}", 10, 10, 10);

    println!("{ten:>ws$}", ten = 10, ws=5);

    println!("{ten:>0ws$}", ten = 10, ws=5);
}
