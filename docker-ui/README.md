# cFlat - Docker-UI

Lightweight docker management ui (see on: [portainer/portainer](https://github.com/portainer/portainer))

### Build
```
docker build -t cghome/cflat-docker-ui docker-ui
```
### Usage
```
docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock cghome/cflat-docker-ui

or:

docker-compose up -d docker-ui
```