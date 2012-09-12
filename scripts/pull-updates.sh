#!/bin/bash

echo "Getting latest update info..."

if [ -z "$1" ]; then
    echo "Usage: pull-updates.sh <path>"
    exit 1
fi

tmproot=`mktemp -d`
cd "$tmproot"

/usr/bin/git clone git@github.com:adobe/brackets-updates.git update-repo || { echo "Couldn't clone repo"; exit 1; }
cd update-repo
rm -rf /var/www/updates.old
mv /var/www/updates updates.old
mv "$1" /var/www/updates

cd /tmp
rm -rf "$tmproot"

echo "done"
