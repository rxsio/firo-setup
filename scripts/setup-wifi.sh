#! /usr/bin/bash

# Variables
LINE="==== ==== ==== ===="

set -e

# Functions

function section {
    echo " "
    echo $LINE
    echo $1
    echo $LINE
    echo " "
}

function success {
    echo " "
    echo "@@@@ @@@@ @@@@ @@@@"
    echo "---- ---- ---- ----"
    echo "  WI-FI CONFIGURED "
    echo "---- ---- ---- ----"
    echo "@@@@ @@@@ @@@@ @@@@"
}


# Install dependencies
section "INSTALLING DEPENDENCIES"
sudo apt-get -y install net-tools wpasupplicant network-manager wireless-tools

# Network Interface
section "LISTING AVAILABLE INTERFACES"
iwconfig

#   Get selected interface
read -p "Wi-Fi Interface: " NETWORK_INTERFACE

#   Turn on selected interface
section "TURNING ON INTERFACE"
sudo ip link set ${NETWORK_INTERFACE} up
sudo ip link set ${NETWORK_INTERFACE} mode default

# Network SSID
section "LISTING AVAILABLE NETWORKS"
sudo nmcli dev wifi list

#   Get selected network
read -p "Wi-Fi Network SSID: " NETWORK_SSID

section "NETWORK CREDENTIALS"
read -p "Wi-Fi Username: " NETWORK_USERNAME
read -p "Wi-Fi Password: " NETWORK_PASSWORD

sudo nmcli connection delete ${NETWORK_SSID}

sudo nmcli connection add type wifi autoconnect TRUE ifname ${NETWORK_INTERFACE} con-name ${NETWORK_SSID} ssid ${NETWORK_SSID}

sudo nmcli connection modify ${NETWORK_SSID} wifi-sec.key-mgmt "wpa-eap" 802-1x.identity ${NETWORK_USERNAME} 802-1x.password ${NETWORK_PASSWORD} 802-1x.eap "peap" 802-1x.phase2-auth mschapv2 802-1x.anonymous-identity "desy@desy.de"

sudo nmcli connection up ${NETWORK_SSID}

success