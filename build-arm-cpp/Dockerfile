# Start from ubuntu:22.04 image
FROM ubuntu:22.04
# Install tools with option to not to have any interative
RUN apt-get update && \
    apt-get install -y \
    apt-utils \
    vim \
    git \
    wget \
    curl zip unzip tar ninja-build \
    libssl-dev zlib1g-dev libcurl4-openssl-dev cmake \
    pkg-config build-essential 
#  Install proper version of CMake (3.27.5)
RUN wget https://github.com/Kitware/CMake/releases/download/v3.27.5/cmake-3.27.5.tar.gz && \
    tar -zxvf cmake-3.27.5.tar.gz && \
    cd cmake-3.27.5 && \
    ./bootstrap && \
    make -j$(nproc) && \
    make install && \
    cd .. && \
    rm -rf cmake-3.27.5 cmake-3.27.5.tar.gz

# Needed for vcpkg on ARM
ENV VCPKG_FORCE_SYSTEM_BINARIES=1
# exemple ["tail", "-f"]
ENTRYPOINT [ "bash" ]