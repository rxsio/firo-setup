#! /usr/bin/bash

echo "Creating folders..."
sudo mkdir /rover
sudo mkdir /rover/exchange
cd /rover

echo "Cloning repository..."
git clone https://github.com/rxsio/firo-setup

echo "Preparing docker..."
cd firo-setup
sudo cp docker-compose.yml /rover/docker-compose.yml
sudo cp -r configuration /rover