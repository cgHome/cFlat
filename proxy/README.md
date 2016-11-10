# cFlat - proxy

Automated traefik reverse proxy for Docker containers, based on Alpine Linux

Based on: [hypriot/rpi-traefik](https://github.com/hypriot/rpi-traefik)

### Build
```
docker build -t cghome/cflat-proxy proxy
```
### Usage
```
docker run -d -p 80:80 -p 8080:8080 -v /var/run/docker.sock:/tmp/docker.sock:ro --name nginx-proxy cghome/cflat-proxy

or:

docker-compose up -d proxy
```