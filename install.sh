#!/bin/bash

URL="https://www.codesign2.co.uk"

if [ $# -gt 1 ]; then
    URL=$1
fi

# Nabbed From PiNet
ReplaceTextLine() {
    # ReplaceTextLine /file search replace
    grep -Ei "^$2" $1 >> /dev/null
    if [ $? = 0 ]; then
        sed -i "s|$2.*|$3|g" $1
    else
        echo "$3" >> $1
    fi
}

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
    ReplaceTextLine ~/.bashrc KIOSKURL KIOSKURL=$URL
}

main

