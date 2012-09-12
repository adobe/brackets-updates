#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ]; then
    echo "Usage: push-updates.sh <updates parent> <identity file> <user@host>"
    exit 1
fi

updatePath="$1"
identity="$2"
host="$3"

echo "Cleaning..."
ssh -i "$identity" "$host" "rm -rf /var/www/updates.new /var/www/updates.old" || { echo "Couldn't remove existing folders"; exit 1; }
echo "Uploading..."
scp -i "$identity" -r "$updatePath/updates" "${host}:/var/www/updates.new" || { echo "Couldn't upload new files"; exit 1; }
echo "Switching..."
ssh -i "$identity" "$host" "mv /var/www/updates /var/www/updates.old" || { echo "Couldn't move aside old folder"; exit 1; }
ssh -i "$identity" "$host" "mv /var/www/updates.new /var/www/updates" || { echo "Couldn't rename new folder"; exit 1; }
echo "Done"
