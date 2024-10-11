#!/bin/bash

if [[ $EUID -ne 0 ]]; then
  echo "This script must be executed with root privileges." 
  exit 1
fi

echo "Installing build dependencies..."
apt-get update -y
apt-get upgrade -y
apt-get install -y apt-utils
apt-get install -y wget cmake build-essential
	
os_version=$(eval "cat /etc/issue")	
arch=$(eval "uname -m")
isArm="no"

if [[ "$arch" == "aarch64" ]]; then
  isArm="yes"
else
  apt-get install unzip
fi

# File to download
fileName="rtmaps_4.11.0_ubuntu2204_armv8_release_20240425"

wget "https://dl.intempora.com/RTMaps4Embedded/ARMv8/rtmaps_4.11.0_ubuntu2204_armv8_release_20240425.tar.gz"
tar xvf ""$fileName".tar.gz"
cd $fileName

echo debconf shared/accepted-rtmaps-license select true | debconf-set-selections
echo debconf shared/accepted-rtmaps-license seen true   | debconf-set-selections
echo debconf shared/select-rtmaps-licensing-system select true   | debconf-set-selections
dpkg -i *.deb
apt -f install -y

cd ..

if [ "$isArm" == "yes" ]; then
  rm -r $fileName
  rm ""$fileName".tar.gz"
else
  rm -r archive
  rm ""$fileName".zip"
fi