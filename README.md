This repo contains update notification JSON files for [Brackets](http://brackets.io) ([repo](https://github.com/adobe/brackets)). As an end user, you'll see them using _Help > Check for Updates_, or whenever a new version is released.

Brackets checks for updates by downloading a copy of this JSON info from a [fixed S3 URL](https://s3.amazonaws.com/files.brackets.io/updates/stable). Updating this repo does not automatically push the changes "live" to S3. This repo is used to discuss changes and prepare translations before the updates files go live.

## To push new update files

**Note: Beginning with Release 39 all update JSON files are available from https://s3.amazonaws.com/files.brackets.io/updates/stable**

## Initial Setup
There is a nodejs script that will take care of uploading the update notifications into the S3 bucket. The script will preserve all attributes on existing files in the S3 bucket.
In order to deploy the update notifications to S3, some required libs have to be installed upfront.

1. cd into `scripts`
2. run `npm install`
3. edit `config.json` from the `scripts` directory and replace the placeholder with your **AWS AccessKey** and **SecretKey** (ask Ryan, Kevin or Ingo for these information)

## Prepare the update notification

**NOTE**: Running this script will replace the current files in the S3 bucket. There is no backup of the existing files and the update notification are immediately visible to everybody using Brackets.

1. Make sure the JSON parses cleanly (you can use http://jsonlint.com, but the errors might not be as good as calling `JSON.parse()`).
2. Check the files into this repo's master.
3. Open a terminal and cd into `scripts`.
4. Run `./create-gzipped-jsons.sh`. This will create a new folder `GZIPPED_JSONS` with the gzipped version of the update notification.
5. run `node deployUpdateNotifications.js`

## To check update appearance in Brackets

1. Change [`UpdateNotification._getVersionInfoURL()`](https://github.com/adobe/brackets/blob/master/src/utils/UpdateNotification.js#L101-L109)
   to always return...
     * A local URL like: file://C:/code/brackets-updates/updates/stable/en.json
     * A GitHub raw URL like: https://raw2.github.com/adobe/brackets-updates/master/updates/stable/en.json
       <br>(this can point at version on a PR's branch, too)
2. Reload, then _Help > Check for Updates_
