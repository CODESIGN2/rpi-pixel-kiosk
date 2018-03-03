# rpi-pixel-kiosk

Using new Raspberry Pi Pixel to setup a fullscreen chromium kiosk

## Setup

1. Download Raspbian Stencil full image (originally tested with Jessie September 2016 "pixel" release)
2. Transfer image onto SD / micro-SD card as usual (probably a good idea to copy a wpa_supplicant.conf onto SD to setup wifi or attach ethernet)
3. Boot the raspberry pi, check you have internet connectivity, then use git to download the repo  

   ```shell
   git clone https://github.com/CODESIGN2/rpi-pixel-kiosk
   cd rpi-pixel-kiosk
   bash install.sh [url-to-start]
   ```

## Things to note

1. We use systemD so that the browser restarts if it crashes (this also means we can kill the browser if it gets too hungry)
2. It is still possible if a keyboard is attached to navigate the system
3. This is an internal project, shared in-case it helps, please contribute issues, PR's, make it awesome!
4. If you need commercial support go to https://www.codesign2.co.uk (default URL for the kiosk) and contact us. For everything else, raise an issue, send PR's (basically see 3.)
4. To change the URL just change the contents of the `.kiosk-url` file in your home directory
5. To change from powersaving to no screen blanking, either create a file in the boot partition called `alwayson`, or place one in the home directory (default is `/home/pi/.kiosk-alwayson`). Alternatively you can use `sudo touch /boot/alwayson` or `sudo touch ~/.kiosk-alwayson`.
6. If you want to change the URL you don't have to edit the `.kiosk-url`, you can re-run `bash install.sh [url-to-start]` from the project git directory and run `sudo systemctl --user restart kiosk`
7. To remove this from your system, you'll need to remove `~/.config/systemd/user/kiosk.service`, `/opt/rpi-pixel-kiosk` & wherever you git cloned the repo to. It's also advised you run `sudo systemctl --user stop kiosk && sudo systemctl --user disable kiosk`.
8. There may be x86 plugins that sites use, simply are not available for the Pi. We can't do anything about this.
