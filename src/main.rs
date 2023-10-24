#![no_std]
#![no_main]

#[cfg(target_os = "dragonos")]
extern crate drstd as std;

use std::{print, println};

#[no_mangle]
fn main() {
    println!("Hello, world!");
}