This repo contains the update JSON files for Brackets.

To push new update files:

**Note: From Release 39 all update JSON files are available from brackets.io/updates/stable**

1. Make sure the JSON parses cleanly (you can use http://jsonlint.com, but the errors might not be as good as calling `JSON.parse()`).
2. Check the files into this repo's master.
3. Copy all JSON files from https://github.com/adobe/brackets-updates/tree/master/updates/stable to https://github.com/adobe/brackets.io/tree/gh-pages/updates/stable and create a new PR.
4. Merging the PR will make the files available to the public
