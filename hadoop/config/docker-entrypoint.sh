#!/bin/bash

echo "starting ssh server..."
service ssh start
echo "started ssh server!"

hdfs namenode -format
start-dfs.sh
start-yarn.sh
mr-jobhistory-daemon.sh start historyserver

if [[ $1 == "-d" ]]; then
  while true; do sleep 1000; done
fi
