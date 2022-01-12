import os
import crypto.aes
import crypto.cipher
// import os.cmdline

// cipher: sets up cipher for the encryption and decryption
fn cipher(key string) cipher.Block {
    return aes.new_cipher(key.bytes())
}

// enc: handles encryption of a single file
fn enc(ciphr cipher.Block, file string) string {
    f := os.read_file(file) or {
        return err.msg
    }

    mut g := f.bytes() 
    mut flen := g.len

    println(g.len)

    if flen < 16 {
        g << []byte{len: aes.block_size - flen, init: '0'.byte()}
        println(g.len)
        mut encrypted := []byte{len: g.len, init: 0}
        ciphr.encrypt(mut encrypted, g)
        return encrypted.bytestr()
    } else if flen > 16 {
        // segment and encrypt
    }


    mut encrypted := []byte{len: flen, init: 0}
    ciphr.encrypt(mut encrypted, g)
    return encrypted.bytestr()
}

// dec: handles decryption of a single file
fn dec(ciphr cipher.Block, file string) string {
    f := os.read_file(file) or {
        return err.msg
    }
    mut decrypted := []byte{len: aes.block_size}
    ciphr.decrypt(mut decrypted, f.bytes())
    return decrypted.bytestr()
}


// main : 
fn main() {

    // println(cmdline.only_non_options(os.args))
    // println(cmdline.only_options(os.args))

    file := 'test/file2.txt'
    out_file := 'test/enc.txt'
    tin_file := 'test/dec.txt'

    // file just ultimately be 16 bytes
    f := os.read_file('$file')?
    println("$f")

    // j := f.bytes()

    // println("j:\tlen($j.len)\n$j")

    // create cipher from string
    ciphr := cipher("🕵🏻🕵🏻🕵🏻🕵🏻")

    println("-------------------------------------")

    // 
    encrypted := enc(ciphr, '$file')
    os.write_file('$out_file', encrypted)?

    g := os.read_file('$out_file')?
    println("$g")

    println("=====================================")


    decrypted := dec(ciphr, out_file)
    os.write_file('$tin_file', decrypted)?

    k := os.read_file('$tin_file')?
    println("$k")

    



}