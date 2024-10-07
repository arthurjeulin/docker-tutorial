# Docker tutorial

Image pour siteweb télécharger depuis une archive gitHub.

On télécharge le site web sur Github.

Oneliner python pour servir des fichiers ⇒ python -m SimpleHTTPServer

Explication :

Un "oneliner" en Python pour servir des fichiers fait généralement référence à une seule ligne de commande qui utilise Python pour créer un serveur web de base qui sert des fichiers à partir du répertoire courant.

# Learn Docker

### Syntaxe
```bash
<tool> <categories> <command_name> <options>
```
## Container

list container available 

```bash 
docker container ls
#  Equivalent
docker ps
# Start a docker
docker container run <image_name>
# Equivalent
docker run <image_name>
# Check if the installation is sucesssfull
docker run hello-world 
docker run ubuntu echo Arthur
# Open a shell bash from the docker
# Option before the name of the image
# -t terminal
# -i interactif
docker run -ti ubuntu bash 

# Kill a container
docker container kill container_ID or container names
docker kill container_ID

# Restart an existing docker
docker start -i c45 (container_ID)

# Delete a container
docker rm c45
```
## Image

```bash
docker run -ti ubuntu:22.04 bash
# Download a specific image from DockerHub
docker pull python:2.7
# Delete an specific image
docker image rm IMAMGE_ID
docker image rm python:2.7
# Cannot delete an image that is currently using into a container
# Create a tag for an image
docker image tag ubuntu monimage:montag
```
## Network

```bash
docker run -ti -p7700:7777 python:2 python -m SimpleHTTPServer 7777
```
-phost_port:container_port

```bash
docker network ls
```
Most of the time we are using the driver bridge to use a virtual network.
```bash
# Create a network
docker network create test

# Add a container into the network test
docker network connect network_ID container_ID 
docker network connect test 32f 

# Check container configuration and option
docker inspect 32f

docker run -ti -p7700:7777 --network test --name container_name python:2 python -m SimpleHTTPServer 7777
docker inspect container_name
```

## Volume

```bash
# Create a volume
docker volume create mon_volume
docker volume ls
docker run -ti --name alice --volume mon_volume:/tmp/project ubuntu bash
# Into the container
cd /tmp/project
touch fichier
ls -la
# exit the container
# Go into another container with the same volume
docker run -ti --name bob --volume mon_volume:/tmp/project ubuntu bash
# Open another container
docker run -ti --volume /Users/arthur/.ssh:/root/.ssh/ ubuntu bash
```