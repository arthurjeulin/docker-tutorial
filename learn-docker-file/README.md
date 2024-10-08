# Create it owns docker image

Dockerfile is a text file.

the config file has to be into the same folder as Dockerfile.

## Build custom image
```bash
# Has to be into the same folder as the Dockerfile
# context . (current folder)
docker build .
# Can add a tag directly to the image
docker build -t ubuntu_perso .
``` 
Run the docker just build.
```bash
docker run -ti da489
```
Add a tag to the image
```bash
docker tag da4892d63fa8 ubuntu_perso
# Run with the tag
docker run -ti ubuntu_perso
```