use std::{i8, i16, i32, i64, u8, u16, u32, u64, isize, usize, f32, f64};

use std::io::stdin;


fn main() {
    // let mut x = 1;

    // loop {
    //     if  (x % 2 == 0) {
    //         println!("{}", x);
    //         x += 1;

    //         continue;
    //     }

    //     if (x > 10) {
    //         break;
    //     }

    //     x += 1;
    //     continue;
    // }

    // let mut y = 1;

    // while y <= 10 {
    //     println!("{}", y);

    //     y += 1;
    // }

    // for z in 1..10 {
    //     println!("for {}", z);
    // }

    let rand_string = "I am a random string";

    println!("Length: {}", rand_string.len());

    let (first, second) = rand_string.split_at(6);
    println!("First: {}, Second: {}", first, second);

    let count = rand_string.chars().count();
    let mut chars = rand_string.chars();
    let mut indiv_chars = chars.next();

    loop {
        match indiv_chars {
            Some(x) => print!("{}", x),
            None => break
        }

        indiv_chars = chars.next();
    }

    let mut iter = rand_string.split_whitespace();

    let mut indiv_word = iter.next();

    loop {
        match indiv_word {
            Some(x) => print!("\n{}", x),
            None => break
        }

        indiv_word = iter.next();
    }

    let mut lines = rand_string.lines();
    let mut indiv_lines = lines.next();

    loop {
        match indiv_lines {
            Some(x) => println!("{}", x),
            None => break
        }

        indiv_lines = lines.next();
    }

    println!("Find Best: {}", rand_string.contains("string"));
}
