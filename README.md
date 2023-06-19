# pico_ProjectBase
setup tools for create raspberry pi pico project using visual studio code


usbip setup

for windows
https://learn.microsoft.com/ja-jp/windows/wsl/connect-usb
https://github.com/dorssel/usbipd-win/releases

```shell:"for wsl"

sudo apt update
sudo apt upgrade
sudo apt install linux-tools-generic hwdata
sudo update-alternatives --install /usr/local/bin/usbip usbip /usr/lib/linux-tools/*-generic/usbip 20
```
