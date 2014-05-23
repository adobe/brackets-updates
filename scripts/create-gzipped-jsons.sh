#!/bin/bash

echo "Create gzipped versions of update notification json files"
TARGET_DIR="`pwd`/GZIPPED-JSONS"
if [ -e ${TARGET_DIR} ]; then
  rm -r ${TARGET_DIR}
fi

mkdir ${TARGET_DIR}

pushd "../updates/stable" > /dev/null

for json in `ls *.json`; do
  gzip -k -9 < ${json} > ${TARGET_DIR}/${json}
done

popd > /dev/null

echo "Done!"
