fn main() {
    println!("days: {}", 31);
    println!("{0}, this is {1} and {1} this is {0}", "Alice", "Bob");
    println!("{subject} {verb} {object}", subject = "I", verb = "Like", object = "an Apple");
    println!("{} of {:b}", 1, 2);
    println!("{no:>width$}", no = 1, width = 5);
    println!("{no:>0width$}", no = 1, width = 6);
    println!("My name is {0}, {1} {0}", "Bond", "James");
    println!("{1} {} {0} {}", 1, 2);
    #[allow(dead_code)]
    struct Structure(i32);
}