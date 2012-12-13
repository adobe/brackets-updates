#!/bin/bash

#Usage: pull-updates.sh [<branch>]
echo "Getting latest update info..."

tmproot=`mktemp -d`
cd "$tmproot"

/usr/bin/git clone git@github.com:adobe/brackets-updates.git update-repo || { echo "Couldn't clone repo"; exit 1; }
cd update-repo
if [ -n "$1" ]; then
    git checkout $1
fi
rm -rf /tmp/updates.old
if [ -d /var/www/updates ]; then
    mv /var/www/updates /tmp/updates.old
fi
mv "updates" /var/www/updates

cd /tmp
rm -rf "$tmproot"

echo "done"
