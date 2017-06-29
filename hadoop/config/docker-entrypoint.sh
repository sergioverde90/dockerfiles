#!/bin/bash

echo "starting ssh server..."
service ssh start
echo "started ssh server!"

hdfs namenode -format
start-dfs.sh
start-yarn.sh
mr-jobhistory-daemon.sh start historyserver

curl http://localhost:50070
