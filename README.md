# ransomwvre
Ransomware in v [(vlang)](https://vlang.io/)

## Motivation :pushpin:
- Get :octocat: Github **clout** :sunglasses: by writing a v's (vlang) first documented ransomware
- Proof-of-Concept (PoC) Malware that is free to Reverse and look at the source code to understand how vlang works

## Description :scroll:
- [ransomwvre](.) uses the aes-256 block cipher that is implemented in [vlang's vlib](https://github.com/vlang/v/tree/master/vlib) with some modification to 
- This is a **Proof-of-Concept**, not meant to be a

## Build :hammer:
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

## Technical Details :blue_book:
- Techologies:
    - `v`, `make`, `git` 
- v libraries:
    - `os`, `crypto.aes`, `crypto.cipher`, `os.cmdline` 


## Reversing? :triangular_flag_on_post:
- Check out some things in [Findings.md](rev-writeup/README.md)
    - NOTHING IS HERE currently