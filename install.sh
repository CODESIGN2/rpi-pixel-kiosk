#!/bin/bash

URL="https://www.codesign2.co.uk"

if [ $# -gt 0 ]; then
    URL=$1
fi

CopyFilesystem() {
    sudo mkdir -p /opt/rpi-pixel-kiosk
    sudo cp -raf home/pi/* /opt/rpi-pixel-kiosk/
    sudo chmod +rx /opt/rpi-pixel-kiosk
    cp -raf home/pi/.config/* ~/.config
}

EnableServiceForUser() {
    systemctl --user enable kiosk
}

StartServiceForUser() {
    export KIOSKURL=$URL
    systemctl --user start kiosk
}

main() {
    CopyFilesystem
    EnableServiceForUser
    StartServiceForUser
    echo "$URL" > ~/.kiosk-url
}

main
