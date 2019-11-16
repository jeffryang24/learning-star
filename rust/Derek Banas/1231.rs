use std::{i8, i16, i32, i64, u8, u16, u32, u64, isize, usize, f32, f64};

use std::io::stdin;

fn main() {
    // println!("5 + 4 = {}", 5 + 4);
    // println!("5 - 4 = {}", 5 - 4);
    // println!("5 * 4 = {}", 5 * 4);
    // println!("5 / 4 = {}", 5 / 4);
    // println!("5 % 4 = {}", 5 % 4);

    let mut neg_4 = -4i32;

    println!("abs(-4) = {}", neg_4.abs());
    println!("4 ^ 6 = {}", 4i32.pow(6));
    println!("sqrt 9 = {}", 9f32.sqrt());
    println!("cbrt 27 = {}", 27f32.cbrt());
    println!("round 1.45 = {}", 1.45f32.round());
    println!("ceiling 1.45 = {}", 1.45f32.ceil());
    println!("e ^ 2 = {}", 2f32.exp());
    println!("log(2) = {}", 2f32.ln());
    println!("log10(2) = {}", 2f32.log10());
    println!("90 to radians = {}", 90f32.to_radians());
    println!("PI to degrees = {}", 3.14f32.to_degrees());
    println!("Max 4, 5 = {}", 4f32.max(5f32));
    println!("Min 4, 5 = {}", 4f32.min(5f32));
}
