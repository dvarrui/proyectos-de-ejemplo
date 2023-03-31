fn main() {
    let array = vec![3_u32, 5, 7, 9, 1, 0, 4, 8, 2, 6];

    // Print the original vec.
    println!("before: {:#?}", array);

    // Break the vec down into its constituent parts
    // When this happens, "array" can no longer be
    // used, because it has been decomposed into its
    // parts, a pointer, a length, and a capacity.

    println!("pointer to the vec's stack allocated structure: {:p}", &array);

    let (ptr, _len, _cap) = array.into_raw_parts();
    // Show that pointer.
    println!("pointer to raw vec buffer: {:p}", ptr);
}

