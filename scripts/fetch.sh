#!/bin/sh

# Variables to be used by fetchers
PROJECT=$(dirname $(dirname "$0"))
TARGET=$PROJECT/target
TMP=$PROJECT/tmp
DIST=$TARGET/dist/$1

# Create inital folders
mkdir -p $TARGET $TMP

# Function: download [filename] [url]
download() {
  if [ ! -e $TMP/$1 ]; then
    echo "* Fetching $2"
    wget -q $2 \
      -O $TMP/$1
  fi
}

# Run fetchers
for arch in $@ common; do
  if [ -e $PROJECT/fetcher/$arch ] && [ $(find $PROJECT/fetcher/$arch -name *.sh | wc -l) != "0" ]; then
    for fetcher in $(ls $PROJECT/fetcher/$arch/*.sh); do
      name=$(echo $fetcher | sed 's:\.sh$::')

      echo "--- Running $name"
      . $fetcher
      echo
    done
  fi
done
