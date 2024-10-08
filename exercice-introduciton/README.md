# Exercice base command

Open 3 containers with the image centos and command tail -f
Containers names :
- front
- db
- backend
backend doit pouvoir ping front et db (same network)
front cannot ping db
front and backend can share file into /mnt/share (volume)

```bash
# Create front-back network
docker network create front-back
# Create back-db network
docker network create back-db

# Create volume data
docker volume create data

#Front docker
docker run -d --name front --network front-back --volume data:/mnt/share centos tail -f

#db docker
docker run -d --name db --network back-db centos tail -f

#Backend docker
docker run -d --name back --network front-back --volume data:/mnt/share  centos tail -f
docker network connect back-db back
```

Connect to front docker
```bash
docker exec -ti front
# Check if we can ping db
ping db
# Check if we can ping back
ping back
exit

# Inspect db container
docker inspect db
```
the name of the docker given by --name if also the name use on the network (DNS resolution)

run directly ping
```bash
# Check if back can ping front
docker exec back ping front
# Check if back can ping db
docker exec back ping db
# Check if db can ping back
docker exec db ping back
# Check if front can ping back
docker exec front ping back
# Check cannot ping db from front
docker exec db ping front
# Check cannot ping front from db
docker exec front ping db
# Create a file into data volume from front docker
docker exect front touch /mnt/share/my_file
# Check the file is also into back
ocker exec back ls /mnt/share/
```