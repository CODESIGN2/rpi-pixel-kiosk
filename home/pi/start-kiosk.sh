#!/bin/sh

KIOSKURL=$(cat ~/.kiosk-url)

if [ -z "$KIOSKURL" ]; then
    KIOSKURL="https://www.codesign2.co.uk"
fi

if [ -e '/boot/alwayson' ]; then
  xset -dpms
  xset s off
fi

# clean up if like me you just yank the power or ssh in and poweroff
rm -rf ~/.config/chromium/Singleton*
# Launch chromium in kiosk mode, incognito with a reputable, well-designed url
chromium-browser --kiosk --incognito $KIOSKURL
