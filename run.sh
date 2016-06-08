#!/bin/bash

export BLUE="\e[0;49;34m"
export GREEN="\e[0;49;32m"
export RED="\e[0;49;91m"
export Z="\e[0m"
export GOPATH=/go

log(){
	echo -e "$BLUE $1 $Z"
}

fail(){
	echo -e "$RED $1 $Z"
	exit 1
}

mkdir -p ${GOPATH}/src/github.com/docker/swarmkit
log "[ STEP 1/3 ] >>> Cloning master branch of https://github.com/docker/swarmkit"
git clone https://github.com/docker/swarmkit ${GOPATH}/src/github.com/docker/swarmkit
if [ "$?" != "0" ]; then
	fail "Cannot clone repository"
fi

cd ${GOPATH}/src/github.com/docker/swarmkit
log "[ STEP 2/3 ] >>> make setup"
make setup
if [ "$?" != "0" ]; then
        fail "Fail in make setup phase"
fi

log "[ STEP 3/3 ] >>> make binaries"
make binaries
if [ "$?" != "0" ]; then
        fail "Fail in make binaries phase"
fi

cp bin/* /output
if [ "$?" != "0" ]; then
        fail "Error while copying binaries"
fi

echo -e "$GREEN [  DONE  ] >>> binaries are in /output volume 🐳  $Z"
