#!/usr/bin/zsh

installer_version="forge-1.19.2-43.3.5-installer"
cd /home/games/minecraft/servers/S3iUqaO7iUwlzKu

java \
    -Dhttp.proxyHost=127.0.0.1 \
    -Dhttp.proxyPort=7890 \
    -Dhttps.proxyHost=127.0.0.1 \
    -Dhttps.proxyPort=7890 \
    -jar $installer_version.jar \
    --installServer