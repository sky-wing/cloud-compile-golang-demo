#!/bin/sh
#!/bin/bash

set -eu

cd $(dirname $0)

export LANG="en_US.UTF-8"

readonly WORKSPACE=$(pwd)
readonly PACKAGE_NAME="demo"
readonly OUTPUT="${WORKSPACE}/output"

readonly RM="rm -fr"
readonly CP="cp -rf"
readonly MKDIR="mkdir -p"
readonly GO_INSTALL="go install"

log() {
    echo "[$(date '+%D %H:%M:%S')] $@"
}

compile() {
    (
        export GOPATH=${WORKSPACE}
        ${GO_INSTALL} ${PACKAGE_NAME}
    )
}

prepare_package() {
    ${MKDIR} $OUTPUT
    ${MKDIR} $OUTPUT/{bin,etc,log}
    $CP bin etc log $OUTPUT
}

main() {
    $RM $OUTPUT
    
    log "start compile..."
    compile
    log "end compile"

    log "start prepare package..."
    prepare_package
    log "end prepare_package"
}

main "$@"
log "build finish exit: "$?
exit $?
