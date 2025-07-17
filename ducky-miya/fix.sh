#!/bin/bash

set -ex

# The function keys are integrated with the number keys and you have to switch mode to toggle between the two: Fn+PageUp, Fn+PageDn

# Set the expected key combination:
# 0 = media keys are default, hold Fn for F1–F12
# 1 = F1–F12 are default, hold Fn for media keys
# 2 = Fn key is just another modifier (no toggle)

# To test: echo 1 | sudo tee /sys/module/hid_apple/parameters/fnmode

echo "options hid_apple fnmode=1" | sudo tee /etc/modprobe.d/hid_apple.conf
sudo update-initramfs -u
