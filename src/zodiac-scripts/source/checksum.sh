#!/usr/bin/env bash

_directory="$1"
_wd=$(pwd)

function _checksum() {
  cd $_directory && \
  find . -type f  ! -path ".checksum" | parallel sha256sum | sort
  cd $_wd
}

if [ $# -eq 0 ]
then
  echo "Usage : $0 DIRECTORY"
  exit 1
elif [ ! -d $_directory ]
then
  echo "Error : $_directory is not a directory."
  exit 1
fi

_checksum
