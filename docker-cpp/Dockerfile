FROM ubuntu:20.04

ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

LABEL Description="Build environment"

ENV HOME /root
ENV DEV_FOLDER /usr/src/project

RUN apt-get update && apt-get -y --no-install-recommends install \
    build-essential \
    cmake \
    wget && \
    rm -rf /var/lib/apt/lists/*

RUN cd ${HOME} && \
    wget --no-check-certificate --quiet \
    https://sourceforge.net/projects/boost/files/boost/1.83.0/boost_1_83_0.tar.gz && \
    tar -xzf boost_1_83_0.tar.gz && \
    cd boost_1_83_0 && \
    ./bootstrap.sh && \
    ./b2 install && \
    cd .. && \
    rm -rf ./boost_1_83_0

# Étape 3: Copie du Dossier 'project'
COPY project/ ${DEV_FOLDER}

# Étape 4: Compilation du Projet
RUN cd ${DEV_FOLDER} \
    && mkdir build \
    && cmake -S . -B build \
    && cmake --build build

ENTRYPOINT ["bash"]