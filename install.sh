#!/bin/bash
apt update - y > /dev/null || yum update -y > /dev/null
apt install wget - y > /dev/null || yum wget -y > /dev/null
# cai dat docker

curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh

# cai docker-composer ban moi nhat 
VERSION=$(curl --silent https://api.github.com/repos/docker/compose/releases/latest | grep -Po '"tag_name": "\K.*\d')
DESTINATION=/usr/local/bin/docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/${VERSION}/docker-compose-$(uname -s)-$(uname -m) -o $DESTINATION
sudo chmod 755 $DESTINATION

# tai file cai
mkdir -p /home/sonarqube
cd /home/sonarqube && wget -O docker-compose.yml https://file-station.tinyactive.net/sna/docker-compose.yml
cd /home/sonarqube &&  wget -O sonar-application-9.9.0.65466.jar https://mtdev.sgp1.digitaloceanspaces.com/sna%2Fsonar-application-9.9.0.65466.jar
cd /home/sonarqube && docker-compose up -d
