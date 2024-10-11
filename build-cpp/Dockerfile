# Start from ubuntu:22.04 image
FROM ubuntu:22.04
# Install tools
# add option to not to have any interative
RUN apt-get update && \
    apt-get install -y \
    apt-utils \
    vim \
    git \
    wget \
    cmake \
    build-essential 

# exemple ["tail", "-f"]
ENTRYPOINT [ "bash" ]