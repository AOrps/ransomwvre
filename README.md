# ransomwvre
Ransomware in v [(vlang)](https://vlang.io/)

## :pushpin: Motivation 
- Get :octocat: Github **clout** :sunglasses: by writing a v's (vlang) first documented ransomware sample
- Proof-of-Concept (PoC) Malware that is free to Reverse and look at the source code to understand how vlang works

## :scroll: Description 
- [ransomwvre](.) uses the aes-256 block cipher that is implemented in [vlang's vlib](https://github.com/vlang/v/tree/master/vlib) with some modification to encryption and decryption schemes.
- This is a **Proof-of-Concept**, not meant to be to be a full-fledged ransomware program that destroys computers.
- It's more "ransomware" than ransomware, can also be used to encrypt files.

## :hammer: Build 
```sh
# Clone repo
git clone https://github.com/AOrps/ransomwvre.git

# Change Dir into repo
cd ransomwvre

# Builds v and executable
make
```

## Usage :airplane:
```sh
# Encrypt file
./ransomwvre -x <file> 

# Decrypt file
./ransomwvre -d <file>
```

## :blue_book: Technical Details 
- Techologies:
    - `v`, `make`, `git`, `bash`
- v libraries:
    - `os`, `crypto.aes`, `crypto.cipher`, `os.cmdline` 


## :triangular_flag_on_post: Reversing?
- Check out some things in [Findings.md](rev-writeup/README.md)
    - NOTHING IS HERE currently