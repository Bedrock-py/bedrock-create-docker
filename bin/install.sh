#!/bin/bash

# Make directories for data (TODO: Shift this and the constants to be a HDFS store)
mkdir -p /opt/bedrock/dataloader/data
mkdir -p /opt/bedrock/analytics/data

chown -R www-data:www-data /opt/bedrock/package/src
chown -R www-data:www-data /opt/bedrock/dataloader/data
chown -R www-data:www-data /opt/bedrock/analytics/data

# Sleep is necessary to ensure the mongod init.d file is not busy when attempting to access
chmod 755 /etc/init.d/mongod
sleep 1
service mongod start
