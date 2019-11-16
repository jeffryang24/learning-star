use std::{i8, i16, i32, i64, u8, u16, u32, u64, isize, usize, f32, f64};

use std::io::stdin;

fn main() {
    let mut circle1 = Circle {
        x: 10.0, y: 10.0, radius: 10.0
    };

    println!("x: {}, y: {}, radius: {}", circle1.x, circle1.y, circle1.radius);

    println!("Circle Radius: {}", get_radius(&circle1));

    println!("Circle x: {}", circle1.get_x());

    println!("Circle Area: {}", circle1.area());

    let mut rect1 = Rectangle {
        width: 10.0, height: 80.0
    };

    println!("Rect Area: {}", rect1.area());
}

struct Circle {
    x: f64,
    y: f64,
    radius: f64
}

struct Rectangle {
    height: f64,
    width: f64
}

trait HasArea {
    fn area(&self) -> f64;
}

impl HasArea for Circle {
    fn area(&self) -> f64 {
        3.14 * self.radius * self.radius
    }
}

impl HasArea for Rectangle {
    fn area(&self) -> f64 {
        self.width * self.height
    }
}

fn get_radius(circle: &Circle) -> f64 {
    circle.radius
}

impl Circle {
    pub fn get_x(&self) -> f64 {
        self.x
    }
}
