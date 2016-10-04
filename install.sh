#!/bin/bash
cp -raf home /
systemctl --user enable kiosk
systemctl --user start kiosk
