# Wi-Fi Setup

This guide covers process to connecting to WPA / WPA2 Wi-Fi networks.

- script available at: `/scripts/install-wifi.sh`

## Install Dependencies / DevTools
```sh
sudo apt-get -y install net-tools wpasupplicant network-manager wireless-tools
```

## Configure Wi-Fi Interface

### List available Wi-Fi interfaces
```sh
iwconfig
```

### Turn on interface
```sh
sudo ip link set <interface_name> up
sudo ip link set <interface_name> mode default
```

## Connect

### Get SSID
```sh
sudo nmcli dev wifi list
```

### Create connection profile
```sh
sudo nmcli connection add type wifi autoconnect TRUE ifname ${NETWORK_INTERFACE} con-name ${NETWORK_SSID} ssid ${NETWORK_SSID}
```

### Configure connection
```sh
sudo nmcli connection modify ${NETWORK_SSID} wifi-sec.key-mgmt "wpa-eap" 802-1x.identity ${NETWORK_USERNAME} 802-1x.password ${NETWORK_PASSWORD} 802-1x.eap "peap" 802-1x.phase2-auth mschapv2 802-1x.anonymous-identity "desy@desy.de" 802-1x.ca-cert "/certificates/isrgrootx1.pem"
```

### Connect
```sh
sudo nmcli connection up ${NETWORK_SSID}
```
