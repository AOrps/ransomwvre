import os
import crypto.aes
// import crypto.rand // uncomment for more optimal key

// main : 
fn main() {
    println('Hello, World!')

    // file just ultimately be 16 bytes
    f := os.read_file('test/file3.txt')?
    println("$f")

    j := f.bytes()

    println("j:\tlen($j.len)\t$j")

    // Emoji is 8 bytes
    byter := "🕵🏻🕵🏻🕵🏻🕵🏻".bytes()
    // To Check byter len is 32, uncomment line below
    // println(byter.len)

    // Instead of byter use `key`
    // key := rand.read(32)?

    cipher := aes.new_cipher(byter)

    mut encrypted := []byte{len: aes.block_size}

    cipher.encrypt(mut encrypted, j)

    println(encrypted)

    mut decrypted := []byte{len: aes.block_size}
    cipher.decrypt(mut decrypted, encrypted)
    println(decrypted)

    bytestr := encrypted.bytestr()
    // write to the file that content has been received and add like ` 1`
    os.write_file('test/enc.txt', bytestr)?

    g := os.read_file('test/enc.txt')?
    println("$g")

}