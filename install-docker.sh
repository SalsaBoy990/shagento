#!/bin/bash

#1. Install the required packages
apt-get update
apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

#2. Add the GPG key for Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

#3. Use the stable repository
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

#4. Install docker engine (latest version)
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io
 
#5. Verify install
docker run hello-world
