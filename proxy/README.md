# cFlat - proxy

Automated traefik reverse proxy for Docker containers, based on Alpine Linux

## Documentation

- [Docu](https://traefik.io/)
- [Docker - image](https://github.com/hypriot/rpi-traefik)

## CLI interface

### Build

```sh
docker build -t cghome/cflat-proxy proxy
# or:
./cflat.sh build proxy
```

### Usage

```sh
# Run
docker run -it --rm --name proxy  -p 80:80 -p 8080:8080 -v /var/run/docker.sock:/tmp/docker.sock:ro cghome/cflat-proxy
# or:
./cflat.sh prod|dev|debug proxy
```