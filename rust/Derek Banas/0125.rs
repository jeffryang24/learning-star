use std::{i8, i16, i32, i64, u8, u16, u32, u64, isize, usize, f32, f64};

use std::io::stdin;

fn main() {
    let age_old = 6;

    if (age_old == 5) {
        println!("Go to kindergarten!");
    } else if (age_old > 5 && age_old <= 18) {
        println!("Go to grade {}", (age_old - 5));
    } else if (age_old <= 25 && age_old > 18) {
        println!("Go to college");
    } else {
        println!("Do what you want!");
    }

    println!("!true = {}", !true);

    println!("true || false = {}", true || false);

    let can_vote = if (age_old >= 18) {
        true
    } else {
        false
    };

    println!("Can vote? = {}", can_vote);
}
