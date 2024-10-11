# cpp environment

## build docker image
```bash
## Build the image from dockerfile and name the image cpp-container
docker build --no-cache --tag cpp-container:22.04 .
```
## create a volume to save cpp-project
```bash
  # Create a volume where to save my cpp project
  docker volume create cpp-coast-tools
```
## run the cpp-container
```bash
# Run the cpp-container
docker run -ti cpp-container:22.04 
# Run the cpp-container with the project volume attach to it
docker run -ti --name dev-cpp --volume cpp-coast-tools:/tmp/dev-cpp cpp-container:22.04
# Download the cpp project from GitHub and build it
cd /tmp/dev-cpp
git clone https://github.com/coast-autonomous/coast-tools.git -b dev
```