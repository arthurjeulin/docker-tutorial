# Install RTMaps into a Docker
## Build the image
Build the container 
```bash
docker build --no-cache --tag rtmaps-arm:22.04 .
```
## Run the container
```bash
docker run --name rtmaps-dev -ti rtmaps-arm:22.04 
```
## Access to the Docker
Start the docker
```bash
docker start rtmaps-dev
```
Go into the docker
```bash
docker exec -ti rtmaps-dev bash
```
Start and go into the docker
```bash
docker start -ai rtmaps-dev
```