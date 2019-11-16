//! Siepinski triangle Image Generator

/// Use these crates
extern crate image;
extern crate rand;

use rand::Rng;
use std::fs::File;

/// Points used to build the triangle and plot points on the canvas
pub struct Point {
    x: u32,
    y: u32
}

/// Canvas Width
pub const WIDTH: u32 = 800;

/// Canvas Height
pub const HEIGHT: u32 = 600;

/// Main Program
pub fn main() {

    let mut img = image::ImageBuffer::from_fn(WIDTH, HEIGHT, |x, y| {
        if x == 0 && y == 0 {
            image::Luma([0u8])
        } else {
            image::Luma([255u8])
        }
    });

    let mut cnt: u32 = 1_000_000;

    let pts: [Point; 3] = [
        Point { x: WIDTH / 2, y: 0 },
        Point { x: 0, y: HEIGHT },
        Point { x: WIDTH, y: HEIGHT }
    ];

    let mut p = Point {
        x: rand::thread_rng().gen_range(0, WIDTH),
        y: rand::thread_rng().gen_range(0, HEIGHT)
    };

    let pixel = img[(0, 0)];

    while cnt > 0 {
        cnt = cnt - 1;
        let num = rand::thread_rng().gen_range(0, 3);
        p.x = (p.x + pts[num].x) / 2;
        p.y = (p.y + pts[num].y) / 2;
        img.put_pixel(p.x, p.y, pixel);
    }

    match File::create("tree.png") {
        Ok(ref mut fd) => {
            let _ = image::ImageLuma8(img).save(fd, image::PNG);
        }
        Err(e) => {
            panic!("There was a problem when creating the file: {:?}", e);
        }
    }
}
