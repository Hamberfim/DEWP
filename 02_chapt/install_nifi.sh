#!/bin/bash -e
# @author: Anthony Hamlin
# @date: 01/05/2021
# Apache Nifi installation and configuration - Ubuntu Srv 20.04LTS.

# Download, install and confure Apache NiFi:
echo '[*] Downloading Apache Nifi 1.12.1 to current directory...'
wget https://mirrors.ocf.berkeley.edu/apache/nifi/1.12.1/nifi-1.12.1-bin.tar.gz
# Extract Apache Nifi tar:
tar xvzf nifi-1.12.1-bin.tar.gz

# Install openjdk-8-jre-headless:
sudo apt update
sudo apt install openjdk-8-jre-headless -y

# Set JAVA_HOME:
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64

# reload bash:
source .bashrc

# Run nifi, in the nifi folder:
nifi-1.12.1/bin/nifi.sh start

# Test the NiFi local web setup
firefox -new-window http://localhost:8080/nifi/
