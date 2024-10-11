# Start from ubuntu:22.04 image
FROM ubuntu:22.04
# Install tools with option to not to have any interative
RUN apt-get update && \
    apt-get install -y \
    apt-utils vim git wget \
    curl zip unzip tar ninja-build \
    python3 python3-pip python3-setuptools python3-wheel \
    libssl-dev zlib1g-dev libcurl4-openssl-dev libx11-dev libgles2-mesa-dev x11-xserver-utils \
    libxrandr-dev libxext-dev libxrender-dev libxcursor-dev libxi-dev \
    bison libxft-dev libxext-dev\
    pkg-config build-essential autoconf automake libtool \
    software-properties-common gdb gdbserver strace m4 checkinstall \
    htop net-tools iputils-ping usbutils curl \
    libxext-dev libxrender-dev libxtst-dev libcanberra-gtk-module \
    libxinerama-dev libxdamage-dev libdrm-dev    

# Install proper version of CMake (3.27.5)
RUN wget https://github.com/Kitware/CMake/releases/download/v3.27.5/cmake-3.27.5.tar.gz && \
tar -zxvf cmake-3.27.5.tar.gz && \
cd cmake-3.27.5 && \
./bootstrap && \
make && \
make install && \
cd ..  && \
rm cmake-3.27.5.tar.gz

# Needed for vcpkg on ARM
ENV VCPKG_FORCE_SYSTEM_BINARIES=1
# exemple ["tail", "-f"]
ENTRYPOINT [ "bash" ]