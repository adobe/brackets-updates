#!/bin/bash

echo "Create gzipped versions of update notification json files"
TARGET_DIR="`pwd`/GZIPPED-JSONS"
platform=`uname -s`
if [ -e ${TARGET_DIR} ]; then
  rm -r ${TARGET_DIR}
fi

mkdir ${TARGET_DIR}

pushd "../updates/stable" > /dev/null

for json in `ls *.json`; do
  echo "Converting $json ..."
  if [[ "$platform" == "Darwin" ]]; then # Mac OS X
    gzip -k -9 < ${json} > ${TARGET_DIR}/${json} # Use the -k option to keep the original file
  else
    gzip -9 < ${json} > ${TARGET_DIR}/${json} # Windows/Linux don't have the -k option
  fi
done

popd > /dev/null

echo "Done!"
