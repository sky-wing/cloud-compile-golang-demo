#!/bin/bash

set -eu

cd $(dirname $0)

export LANG="en_US.UTF-8"

readonly WORKSPACE=$(pwd)
readonly PACKAGE_NAME="demo"

readonly GO_TEST="go test"

log() {
    echo "[$(date '+%D %H:%M:%S')] $@"
}

testStak() {
    (
        export GOPATH=${WORKSPACE}
        ${GO_TEST} ${PACKAGE_NAME}/...
    )
}

main() {
    log "start test..."
    testStak
    log "end test"
}

main
