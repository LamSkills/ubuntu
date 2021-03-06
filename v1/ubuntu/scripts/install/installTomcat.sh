#!/bin/bash

DIR=${0%/*}
if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

. $DIR/../isRoot.sh

installTomcat8() {
  echo "*** ------ installTomcat8 ------ ***" 1>&2
  $(isRoot)
  apt-get install -y tomcat8
  echo "*** ------ installTomcat8 done  ------ ***" 1>&2
}

installTomcat8
