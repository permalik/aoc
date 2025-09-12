use std::fs::File;
use std::io;
use std::io::prelude::*;

fn main() {
    let _ = one();
    let _ = two();
}

fn one() -> io::Result<()> {
    println!("Started one..");

    let mut f =
        File::open("/home/parallels/Docs/Git/adventofcode/aoc/aoc-rust/aoc/2015/001/input.txt")?;

    let mut buffer = String::new();
    f.read_to_string(&mut buffer)?;

    let mut floor: u32 = 0;
    for c in buffer.split("") {
        if c == "(" {
            floor += 1;
        } else if c == ")" {
            floor -= 1;
        }
    }

    println!("Santa is on floor {}\n", floor);

    Ok(())
}

fn two() -> io::Result<()> {
    println!("Started two..");

    let mut f =
        File::open("/home/parallels/Docs/Git/adventofcode/aoc/aoc-rust/aoc/2015/001/input.txt")?;

    let mut buffer = String::new();
    f.read_to_string(&mut buffer)?;

    let mut floor: i32 = 0;
    let mut index: usize = 0;
    for c in buffer.split("") {
        if floor == -1 {
            println!("Santa is on basement floor {} at position {}", floor, index);
            break;
        }
        if c == "(" {
            floor += 1;
            index += 1;
        } else if c == ")" {
            floor -= 1;
            index += 1;
        }
    }

    Ok(())
}
