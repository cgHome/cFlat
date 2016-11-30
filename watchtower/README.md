# cFlat - watchtower

Automatically update running Docker containers

## Documentation

- [Doku](https://github.com/CenturyLinkLabs/watchtower/)
- [Docker - image](https://hub.docker.com/r/fgabriel/rpi-watchtower/)

## CLI interface

### Build

```sh
docker build -t cghome/cflat-watchtower watchtower
# or:
./cflat.sh build watchtower
```

### Usage

```sh
# Run
docker run -d -v /var/run/docker.sock:/var/run/docker.sock --name watchtower cghome/cflat-watchtower
# or:
./cflat.sh prod|dev|debug watchtower
```