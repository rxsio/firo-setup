# SSH Setup


## Install

### Install OpenSSH Server
```sh
sudo apt-get -y update
sudo apt-get -y install openssh-server
```

### Start the service
```sh
sudo systemctl start ssh
```

## Test
```sh
sudo systemctl is-active --quiet service
```