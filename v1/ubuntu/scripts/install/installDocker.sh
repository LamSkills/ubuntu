#!/bin/bash

DIR=${0%/*}
if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

. $DIR/../isRoot.sh

installDocker() {
  echo "*** ------ installDocker ------ ***" 1>&2
  $(isRoot)

  add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
  #add-apt-repository "deb https://apt.dockerproject.org/repo/ ubuntu-$(lsb_release -cs) main"
  #add-apt-repository -y "deb https://apt.dockerproject.org/repo ubuntu-xenial main"
  #echo "deb https://apt.dockerproject.org/repo ubuntu-xenial main" | tee /etc/apt/sources.list.d/docker.list

  apt-get update
  apt-get install -y linux-image-extra-$(uname -r) linux-image-extra-virtual
  apt-get install -y apt-transport-https ca-certificates software-properties-common

  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  apt-key fingerprint 0EBFCD88
  #apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

  apt-get update
  apt-get install -y docker-ce
  #apt-cache madison docker-ce

  groupadd docker
  #usermod -aG docker $USER

  systemctl enable docker

  echo "*** ------ installDocker done  ------ ***" 1>&2
}

installDockerCompose() {
  echo "*** ------ installDockerCompose ------ ***" 1>&2
  $(isRoot)

  curl -L "https://github.com/docker/compose/releases/download/1.14.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose

  echo "*** ------ installDockerCompose done  ------ ***" 1>&2
}

installDocker
installDockerCompose
