# Setup Certificates

## Prepare CA Certificate
1. You can generate certificate using commands listed in [Generate CA](./certificates/generateCA.sh)

## Generate certificate for rover
1. Using commands listed in [Generate Cert](./certificates/generateCert.sh) generate the certificates for the rover
2. Install certificates in the `/certificates` on the rover

## Copy to USB

### Mount USB
- find USB 
```
fdisk -l
```
- mount USB
```sh
sudo mkdir /mnt/usb
sudo mount /dev/sdX /mnt/usb
```

### Copy certificates to USB
- copy all files by names
```sh
sudo cp firo.crt /mnt/usb
```

### Unmount USB
```
sudo umount /mnt/usb
```

## Copy to Rover

1. Mount USB (same as previous)

### Copy certificates from USB
```sh
sudo mkdir /certificates
sudo cp -r /mnt/usb/* /certificates
```

3. Umount USB (same as previous)