* bitwarden.sh start
* bitwarden.sh stop
* edit bwdata/config.yml, disable docker-compose generation
* copy bwdata/mssql to new volume location on non-zfs disk. Update volume paths in docker-compose.yml
* for each service: copy associated folder out of bwdata to new location, then update volume path
* alternatively: update all volume paths in docker-compose.yml to be absolute, then copy bwdata/docker and bwdata/env to a new directory.
