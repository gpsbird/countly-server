#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DATE=$(date +%Y-%m-%d:%H:%M:%S)
VERSION="$(basename "${DIR}")" 
if [ -f "$DIR/upgrade_fs.sh" ]; then
    bash "$DIR/upgrade_fs.sh" combined 2>&1 | tee -a "$DIR/../../../log/countly-upgrade-$VERSION-$DATE.log"
fi
if [ -f "$DIR/upgrade_db.sh" ]; then
    bash "$DIR/upgrade_db.sh" combined 2>&1 | tee -a "$DIR/../../../log/countly-upgrade-$VERSION-$DATE.log"
fi
