#!/bin/bash

set -eu

cd $(dirname $0)

export LANG="en_US.UTF-8"

readonly WORKSPACE=$(pwd)
readonly PACKAGE_NAME="demo"
readonly OUTPUT="$WORKSPACE/output"

readonly GO_TEST="go test"

log() {
    echo "[$(date '+%D %H:%M:%S')] $@"
}

testStak() {
    (
        mkdir -p $OUTPUT 
        export GOPATH=${WORKSPACE}
        ${GO_TEST} ${PACKAGE_NAME}/... | tee $OUTPUT/report.txt
    )
}

main() {
    log "start test..."
    testStak
    log "end test 12"
}

main
