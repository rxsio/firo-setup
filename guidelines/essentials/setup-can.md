# CAN Setup

## Copy networkd configuration
```sh
sudo copy ~/rover/firo-setup/setup/etc/systemd/network/60-can.link /etc/systemd/network/60-can.link
sudo copy ~/rover/firo-setup/setup/etc/systemd/network/60-can.network /etc/systemd/network/60-can.network
```

## Enable systemd-networkd deamon
```sh
sudo systemctl enable systemd-networkd
```

## Troubleshooting

Verify that correct files are used by networkd:
```sh
sudo networkctl status can0
```

If other network or link file is used then probably It has higher priority than our can configuration. To fix that, rename `60-can.link` and `60-can.network` with lower number 