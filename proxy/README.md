# cFlat - proxy

Automated traefik reverse proxy for Docker containers, based on Alpine Linux

### Documentation

- [Docu](https://traefik.io/)
- [Docker - image](https://github.com/hypriot/rpi-traefik)

### Build

```sh
./cflat.sh build proxy
# or:
docker build -t cghome/cflat-proxy proxy
```

### Usage

```sh
# Run
./cflat.sh [prod|dev|debug] proxy
# or:
docker run -d -p 80:80 -p 8080:8080 -v /var/run/docker.sock:/tmp/docker.sock:ro --name nginx-proxy cghome/cflat-proxy
```