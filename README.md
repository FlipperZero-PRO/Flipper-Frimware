#### Install flatpak with qFlipper (Debian/Ubuntu)
```
sudo apt install flatpak
flatpak install flathub one.flipperzero.qFlipper
```
#### Setup Flipper Connection for qFlipper (Debian/Ubuntu)
```
curl -sL https://raw.githubusercontent.com/FlipperZero-PRO/Flipper-Frimware/refs/heads/main/Linux_Scrips/Setup_Flipper-udev.sh | bash
```
#### Integrate your Backup Files to FlipperZero update file 
- Included folders: badusb dolphin infrared lfrfid nfc subghz u2f
* Backup folder must be at `/home/$USER/.FlipperBackup` (Hidden folder)
* Run script from downloaded folder with `flipper-z-f7-update-mntm-dev*.tgz`
```
curl -sL https://raw.githubusercontent.com/FlipperZero-PRO/Flipper-Frimware/refs/heads/main/Linux_Scrips/Flipper_Update.sh | bash
```
