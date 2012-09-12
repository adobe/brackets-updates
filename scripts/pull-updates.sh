#!/bin/bash

echo "Getting latest update info..."

if [ -z "$1" ]; then
    echo "Usage: pull-updates.sh <path-within-repo>"
    exit 1
fi

tmproot=`mktemp -d`
cd "$tmproot"

/usr/bin/git clone git@github.com:adobe/brackets-updates.git update-repo || { echo "Couldn't clone repo"; exit 1; }
cd update-repo
if [ -n "$2" ]; then
    git checkout $2
fi
rm -rf /tmp/updates.old
if [ -d /var/www/updates ]; then
    mv /var/www/updates /tmp/updates.old
fi
mv "$1/updates" /var/www/updates

cd /tmp
rm -rf "$tmproot"

echo "done"
