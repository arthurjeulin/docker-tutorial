# Start from ubuntu:22.04 image
FROM ubuntu:22.04
# Install tools
# add option to not to have any interative
RUN apt-get update && \
    apt-get install -y \
    vim net-tools dstat iputils-ping
# Each time we use RUN create a new layer
# Add file into the image
# Copy config file into the docker
COPY config /etc/file.conf

# Entrypoint: default command use by the container
# give an array as input, each element of the array is
# element by element of the command
# Each time there is an space add the element into a new
# element of the array.
# exemple ["tail", "-f"]
ENTRYPOINT [ "bash" ]