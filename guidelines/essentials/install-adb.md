# Setup ADB

## Installation

### Install ADB
```sh
sudo apt install adb
```

### Enable ADB Support
```sh
nano /etc/udev/rules.d/51-android.rules
```

Put content
```
SUBSYSTEM=="usb", ATTR{idVendor}=="05a3", ATTR{idProduct}=="9331", MODE="0666", GROUP="plugdev"
```

```sh
sudo udevadm control --reload-rules
```

## Test
```sh
adb devices -l
```