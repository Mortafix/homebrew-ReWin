# ReWin

Are you tired of keep pressing the Option button?  
Python script to reboot automatically your OS to BootCamp.


## Installation
The package can be downloaded directly from [Homebrew](https://brew.sh/index_it).
```bash
brew tap Mortafix/ReWin
brew install rewin
```

## Requirements
In order to this script to work, you need to disable SIP (System Integrity Protection), so do that only is necessary.  
How to turn off SIP in macOS:
1. Restart the Mac.
2. Hold down `Command+R` to reboot into Recovery Mode (before the Apple logo appears).
3. Go to Uitlities > Terminal.
4. Type the command `csrutil disable`.
5. Restart again the Mac.

## Example
You can see the help man, `-h`, to know all the possibile commands.
```bash
rewin # normal BootCamp, password entered manually
rewin -n Windows10 -E -p 1234 # BootCamp from an external ssd, automatic password, but unsafe
```
