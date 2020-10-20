# ReWin

Are you tired of keep pressing the Option button?
Python script to reboot automatically your OS to BootCamp.


## Installation
The package can be downloaded directly from [Homebrew](https://brew.sh/index_it).
```bash
brew tap Mortafix/ReWin
brew install rewin
```

## Example
You can see the help man, `-h`, to know all the possibile commands.
```bash
rewin # normal BootCamp, password entered manually
rewin -n Windows10 -E -p 1234 # BootCamp from an external ssd, automatic password, but unsafe
```
