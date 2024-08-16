# Setup Software

## Prepare the working directory
```sh
sudo mkdir /rover
cd /rover
```

## Download setup repository
```sh
git clone https://github.com/rxsio/firo-setup
```

## Copy configuration files
```sh
cd firo-setup
sudo cp docker-compose.yml /rover/docker-compose.yml
sudo cp -r configuration /rover
```