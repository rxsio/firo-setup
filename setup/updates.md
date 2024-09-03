# Updating Software


## Pulling new software
```sh
cd /rover
sudo docker compose pull
```

## Running new software
```
cd /rover
sudo docker compose up --detach
```

- in case of any failures last working version will be restored by Docker

## Other tips

### Displaying software works
```sh
sudo docker ps                      # To display available containers
sudo docker logs <container>        # To display container logs
```

### Executing commands inside container
```sh
sudo docker ps                              # To display available containers
sudo docker exec -it <container> <command>  # To exec command in interactive mode (eg. bash)
```