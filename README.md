# rpi-pixel-kiosk
Using new Raspberry Pi Pixel to setup a fullscreen chromium kiosk

## Setup

1. Download Raspbian Jessie minimum version is September 2016 (PIXEL release)
2. Transfer image onto SD / micro-SD card as usual
3. a. Windows or Mac
   Boot the raspberry pi, download the files and unpack them to your root folder (`/`)
   b. Linux
   Mount the root partition and overlay the files to the root folder (I find this easier, but if it's too much, follow 3. a.)
4. With a booted and logged-in pi, navigate to a terminal window and run the following

```
systemctl --user enable kiosk
systemctl --user start kiosk
```

## Things to note

1. We use systemD so that the browser restarts if it crashes (this also means we can kill the browser if it gets too hungry)
2. It is still possible if a keyboard is attached to navigate the system
3. This is an internal project, built for fun, shared in-case it helps, please contribute issues, PR's, make it awesome!
