#!/usr/bin/env bash

_directory="$1"
_archive_file="$2"
_wd=$(pwd)

function _archive() {
  cd $_directory && \
  checksum . > .checksum && \
  echo "Checksum saved." && \
  tar -I zstd -cf $_archive_file . && rm ".checksum" && \
  echo "Archive saved to $_archive_file" || echo "Failed to create archive."
  cd $_wd
}

if [ $# -eq 0 ]
then
  echo "Usage : $0 DIRECTORY [ARCHIVE]"
  exit 1
elif [ ! -d $_directory ]
then
  echo "Error : $_directory is not a directory."
  exit 1
fi

if [ $_archive_file ]
then
  if [ -e $_archive_file ]
  then
    echo "Error : $_archive_file already exists."
    exit 1
  fi
  mkdir -p $(dirname $_archive_file)
else
  cd $_directory && \
  _archive_file="$(pwd)-$(date +%F-%H-%M-%S).tar.zst"
  cd $_wd
fi

_archive
