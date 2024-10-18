# *************************************************
#   2024 : Arthur JEULIN
#   Copyright (c) Coast Autonomous
#   Created by Arthur JEULIN on 10/09/2024
#**************************************************
#
# Module : Dockerfile with RTMaps install
#

FROM ubuntu:22.04

ADD install_rtmaps.sh .
RUN chmod +x install_rtmaps.sh && ./install_rtmaps.sh

ENV RTMAPS_SDKDIR=/opt/rtmaps

# Needed to copy the license
RUN mkdir /root/.RTMaps-4.0
ADD *.lic /root/.RTMaps-4.0

# Setup Credentials files to guest 
RUN /opt/rtmaps/bin/rtmaps_daemon rtmaps_daemon --generate-cfgfile "/root/.RTMaps-4.0/Daemon.cfg" && \  
  /opt/rtmaps/bin/rtmaps_daemon --generate-credfile "/root/.RTMaps-4.0/Credentials.cfg"

ENTRYPOINT [ "bash" ]