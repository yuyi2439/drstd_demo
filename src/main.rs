#![no_std]
#![no_main]

extern crate drstd as std;

use std::{print, println};

#[no_mangle]
fn main() {
    println!("Hello, world!");
}