# cFlat - watchtower

Automatically update running Docker containers

### Documentation

- [Doku](https://github.com/CenturyLinkLabs/watchtower/)
- [Docker - image](https://hub.docker.com/r/fgabriel/rpi-watchtower/)

### Build

```sh
./cflat.sh build watchtower
# or:
docker build -t cghome/cflat-watchtower watchtower
```

### Usage

```sh
# Run
./cflat.sh [prod|dev|debug] watchtower
# or:
docker run -d -v /var/run/docker.sock:/var/run/docker.sock --name watchtower cghome/cflat-watchtower
```