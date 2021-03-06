#!/bin/bash

DIR=${0%/*}
if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

if [ ! -d "/apps" ]; then
  echo "/apps dir does not exist!"
  exit 1;
fi

LOGFILE=`basename $0`.log

echo "" > $LOGFILE

download() {
  echo "*** ------ download ------ ***" 1>&2
  $DIR/download/downloadMaven.sh >> $LOGFILE
  $DIR/download/downloadSlack.sh >> $LOGFILE
  #$DIR/download/downloadStarUml.sh >> $LOGFILE
  $DIR/download/downloadDevcenter.sh >> $LOGFILE
  $DIR/download/downloadEclipse.sh >> $LOGFILE
  $DIR/download/downloadIdea.sh >> $LOGFILE
  $DIR/download/downloadTomcat.sh >> $LOGFILE
  $DIR/download/downloadCodeStyle.sh >> $LOGFILE
  $DIR/download/downloadAtom.sh >> $LOGFILE
  $DIR/download/downloadVSCode.sh >> $LOGFILE
  $DIR/download/downloadSqlectron.sh >> $LOGFILE
  #$DIR/download/downloadCassandra.sh >> $LOGFILE
  #$DIR/download/downloadJdk.sh >> $LOGFILE
  #$DIR/download/downloadSts.sh >> $LOGFILE

  #$DIR/postDownload.sh >> $LOGFILE
  echo "*** ------ download done  ------ ***" 1>&2
}

download
