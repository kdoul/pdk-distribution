#!/bin/sh

# Variables to be used by fetchers
PROJECT=$(dirname $(dirname "$0"))
TARGET=$PROJECT/target
TMP=$PROJECT/tmp
DIST=$TARGET/dist

# Create inital folders
mkdir -p $TARGET $TMP

# Function: download [filename] [url]
download() {
  if [ ! -e $TMP/$1 ]; then
    wget -q $2 \
      -O $TMP/$1
  fi
}

# Run fetchers
if [ $1 ]; then
  for fetcher in $@; do
    echo "--- Running $fetcher"
    . $PROJECT/scripts/fetcher/${fetcher}.sh
    echo
  done
else
  for fetcher in $(ls $PROJECT/scripts/fetcher/*.sh); do
    name=$(echo $fetcher | sed 's:\.sh$::')

    echo "--- Running $name"
    . $fetcher
    echo
  done
fi