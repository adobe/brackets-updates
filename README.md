This repo contains the update JSON files for Brackets.

To push new update files:

**Note: Beginning with Release 39 all update JSON files are available from https://s3.amazonaws.com/files.brackets.io/updates/stable**

1. Make sure the JSON parses cleanly (you can use http://jsonlint.com, but the errors might not be as good as calling `JSON.parse()`).
2. Check the files into this repo's master.
3. Open a terminal and cd into `scripts`.
4. Run `./create-gzipped-jsons.sh`. This will create a new folder `GZIPPED_JSONS` with the gzipped version of the update notification.
5. Copy the contents of this folder into our S3 bucket `files.brackets.io/updates/stable` (ask Jonathan, Kevin or Ingo for credentials).
