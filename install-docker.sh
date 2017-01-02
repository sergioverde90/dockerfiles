#!bin/bash

########################################
##          INSTALLATION INFO 	      ##
## Only for ubuntu Xenial 16.04 (LTS) ##
########################################

# Update package information, ensure that APT works with the https method, and that CA certificates are installed.
sudo apt-get update && sudo apt-get install apt-transport-https ca-certificates

# Add the new GPG key.
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

# create source for docker and add repository
sudo touch /etc/apt/sources.list.d/docker.list && sudo echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" > /etc/apt/sources.list.d/docker.list

# update and install docker engine
sudo apt-get update && sudo apt-get install docker-engine

# start docker service and check installation correct
sudo service docker start && sudo docker run hello-world