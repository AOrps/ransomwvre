# Ransomwvre Dev Log
Write-up for the Development and Reversing of an Executable in non-traditional language

--- 

## Writing v Ransomware

### v Dev
- It is very similar to golang, when you get the hang of it. It is pretty easy to write v code.
- Arguably there is just a bit too much going on with it in some things. Like I wasn't expecting there to be `cmdline.only_non_options()` or `cmdline.only_options()` functions from `os.cmdline` but in the long run, I think that in the long run it helps cut down on the code written. Like it was a pleasant feature and very welcomed.
- Pretty concise documentation and I found there to be an example to help me out with every function I needed help with in vlib and in just in v. 

### Tech Specs with Ransomware
- Ransomware is just encryption but not knowing the decryption scheme or password so implementing if the encryption (and decryption) methods are implemented than 80-90% of the work is done. 

---

## Reversing v Ransomware

### Findings
- Nada! (Haven't Reversed yet)