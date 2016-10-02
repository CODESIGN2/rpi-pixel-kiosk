#!/bin/sh
# clean up if like me you just yank the power or ssh in and poweroff
rm -rf ~/.config/chromium/Singleton*
# Launch chromium in kiosk mode, incognito with a reputable, well-designed url
chromium-browser --kiosk --incognito https://www.codesign2.co.uk
