This repo contains the update JSON files for Brackets and Edge Code.

To push new update files:

1. Make sure the JSON parses cleanly (you can use http://jsonlint.com, but the errors might not be as good as calling `JSON.parse()`).
2. Check the files into this repo's master.
3. SSH into the update server: dev.brackets.io or update.edgecode.io. 
   (Usernames/passwords are available from Adam or nj.)
4. On the update server, `cd brackets-updates` (clone of this repo, should already be in the home directory)
5. `./scripts/pull-updates.sh brackets` or `./scripts/pull-updates.sh edge-code`

This should update the files in /var/www/updates with the latest files from the repo.

(Note that the script doesn't actually do a pull in the clone that's in the home
directory; it does it into a temporary folder. You can do a pull in `~/brackets-updates`
if you like, but it won't really affect anything other than the scripts themselves.)
