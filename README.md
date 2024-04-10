# idrive-docker
A hacky conversion of iDrive's new Linux binaries into a usable container. Based on a minimal ubuntu image with vim and python3 for speed tests and log viewing.

## Requirements

- Docker (of course)
- an IDrive account
- Basic knowlege of vim (used by default to view stuff in IDrive's cli)

Brief steps to get this working:

`docker build -t idrive .`
`docker run --init --name idrive-backup -v /path/to/your/backups:/backups idrive:latest`

in another terminal...

`docker exec -it idrive-backup bash`
`./idriveforlinux.bin --install`

follow prompts to set up your account...make sure you configure backup sets to the mount and set cron!

Once you are done, exit and type

`docker stop idrive-backup`
`docker start idrive-backup`

You can close both terminals.

That's all there is to it!  I'm sure I've made some hasty errors, so let me know. 

TODO:

- Run as non-root user (requires filesystem permission tweaking for backups to read correctly)
- Convince IDrive to have command line switches or mountable config files
