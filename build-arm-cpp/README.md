# cpp environment

## build docker image
Build the image from dockerfile and name the image cpp-container.
```bash
docker build --no-cache --tag cpp-container:22.04 .
```
## create a volume to save cpp-project
Create a volume where to save my cpp project
```bash
  docker volume create cpp-coast-tools
```
## run the cpp-container
Run the cpp-container
```bash
docker run -ti cpp-container:22.04
```
Or run the cpp-container with the project volume attach to it
```bash
docker run -ti --name dev-cpp --volume cpp-coast-tools:/tmp/dev-cpp cpp-container:22.04
```
Download the cpp project from GitHub and build it
```bash
cd /tmp/dev-cpp && \
git clone https://github.com/coast-autonomous/coast-tools.git -b dev
```