#!/bin/bash

set -ue

module load spack-stack
module load stack-intel
module load w3nco

module list

set -x

test -d exec || mkdir exec
cd sorc

for dir in fsync_file.cd  mdate.fd  ndate.fd  nhour.fd; do
  cd $dir
  exe=${dir/.*/}
  rm -f $exe
  make
  if [ $? -eq 0 ]; then
    mv -v $exe ../../exec/.
  fi
  cd ..
done
