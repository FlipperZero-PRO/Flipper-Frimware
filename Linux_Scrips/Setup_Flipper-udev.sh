#!/bin/bash
echo 'SUBSYSTEM=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="5740", MODE="0666", GROUP="dialout"' | sudo tee /etc/udev/rules.d/99-qflipper.rules > /dev/null
echo 'SUBSYSTEM=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="df11", MODE="0666", GROUP="dialout"' | sudo tee -a /etc/udev/rules.d/99-qflipper.rules > /dev/null
sudo udevadm control --reload-rules