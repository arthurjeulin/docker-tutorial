FROM ubuntu:20.04

ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

LABEL Description="Build environment"

ENV HOME /root
ENV DEV_FOLDER /usr/src/project

RUN apt-get update && apt-get -y --no-install-recommends install \
    build-essential \
    cmake \
    software-properties-common \
    curl \
    wget && \
    rm -rf /var/lib/apt/lists/*

# Mettre g++-10 comme version par défaut
RUN apt-get update && apt-get install -y g++-10
# Installer g++-10
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-10 100

# Télécharger et installer CMake (vraiment pas la meilleur des façons de faire )
ARG CMAKE_VERSION=3.26.0
# RUN  apt remove --purge --auto-remove cmake -y && \
#  apt update && \
#  apt install -y software-properties-common lsb-release && \
#  apt clean all && \
#  wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | gpg --dearmor - | tee /etc/apt/trusted.gpg.d/kitware.gpg >/dev/null && \
#  apt-add-repository "deb https://apt.kitware.com/ubuntu/ $(lsb_release -cs) main" && \
#  apt update && \
#  apt install kitware-archive-keyring && \
#  rm /etc/apt/trusted.gpg.d/kitware.gpg && \
#  apt update && \
#  apt install cmake -y

ARG REINSTALL_CMAKE_VERSION_FROM_SOURCE="3.27.5"

# Optionally install the cmake for vcpkg
COPY ./reinstall-cmake.sh /tmp/

RUN if [ "${REINSTALL_CMAKE_VERSION_FROM_SOURCE}" != "none" ]; then \
        chmod +x /tmp/reinstall-cmake.sh && /tmp/reinstall-cmake.sh ${REINSTALL_CMAKE_VERSION_FROM_SOURCE}; \
    fi \
    && rm -f /tmp/reinstall-cmake.sh

ARG BOOST_VERSION=1.83.0
ARG BOOST_VERSION_=1_83_0

RUN cd ${HOME} && \
    wget --no-check-certificate --quiet \
    https://sourceforge.net/projects/boost/files/boost/${BOOST_VERSION}/boost_${BOOST_VERSION_}.tar.gz && \
    tar -xzf boost_${BOOST_VERSION_}.tar.gz && \
    cd boost_${BOOST_VERSION_} && \
    ./bootstrap.sh && \
    ./b2 install && \
    cd .. && \
    rm -rf ./boost_${BOOST_VERSION_}

# Étape 3: Copie du Dossier 'project'
COPY project/ ${DEV_FOLDER}

# Étape 4: Compilation du Projet
RUN cd ${DEV_FOLDER} \
    && mkdir build \
    && cmake -S . -B build \
    && cmake --build build

ENTRYPOINT ["bash"]