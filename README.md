# Wordpress-To-Go

## Requirements

- docker
- docker-compose
- shell script

## Run Script

Update your DB credentials in `CREDENTIALS.sh` before running the following command.

```sh
sh run.sh
```

### Options

- start: Starts Wordpress container and its DB container from scratch
- backup: Backs up current Wordpress state as `backup.sql` and `backup.tar` in `/backup` directory.
- restore: Restores Wordpress state based on `backup.sql` and `backup.tar` in `/backup` directory.
- stop: Shuts down all running Wordpress related containers and volumes.

### Making Changes

The following files are excluded from git tracking. Update git before making changes to these files.

- CREDENTIALS.sh
- docker-compose.yml
- backup/

#### Credentials and docker-compose.yml
Use the following commands as necessary.
**MAKE SURE YOU HAVE THE REPOSITORY SET AS PRIVATE OR AT LEAST MAKE SURE THAT SUBSTITUTE VARIABLES ARE NOT SUBSTITUTED WITH YOUR CREDENTIALS!!!**

```sh
# Update git to track changes on file
git update-index --no-assume-unchanged <file>

# Update git to untrack changes on file
git update-index --assume-unchanged <file> 
```

#### Backup

Remove them from `.gitignore` when you wish to store backups or save credentials in this repository.
**MAKE SURE YOU HAVE THE REPOSITORY SET AS PRIVATE!!!**
