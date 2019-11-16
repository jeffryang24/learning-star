use std::{i8, i16, i32, i64, u8, u16, u32, u64, isize, usize, f32, f64};

use std::io::stdin;

fn main() {
    let rand_array = [1,2,3];

    println!("{}", rand_array[0]);

    println!("{}", rand_array.len());

    println!("Second 2: {:?}", &rand_array[1..3]);

    let mut vect1 = vec![1,2,3,4,5];

    println!("Item 2: {}", vect1[1]);

    vect1.push(6);

    vect1.pop();

    for i in &vect1 {
        println!("Vect: {}", i);
    }

    let rand_tuple = ("Jeffry", 24);

    let rand_tuple2: (&str, i8) = ("Jeffry", 96);

    println!("Name: {}", rand_tuple2.0);
}
