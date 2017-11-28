# REQUISITES

* Docker swarm enabled
* Docker +17.03 CE
* Docker compose

This stack is based on the following services:

* kafka (image based on: [wurstmeister/kafka-docker](https://github.com/wurstmeister/kafka-docker))
* zookeeper (custom image [zookeeper](https://github.com/sergioverde90/dockerfiles/tree/master/zookeeper)) 

# HOW TO BUILD

```bash
> docker swarm init
> docker stack deploy --compose-file docker-compose.yml kafka-cluster
```

# HOW TO SCALE
```bash
> docker service scale kafka_kafka=2
kafka_kafka scaled to 2
```

## See brokers
```bash
# list containers
> docker service ls

ID            NAME             MODE        REPLICAS  IMAGE
3fjvnji5ivrs  kafka_kafka      replicated  2/2       wurstmeister/kafka:latest
ab08g1gueo5i  kafka_zookeeper  replicated  1/1       kafka_zookeeper

# connect to zookeeper container
> docker exec -it kafka_zookeeper.1.... /bin/bash
'root@zookeeper:#' /zookeeper/bin/zkCli.sh 127.0.0.1:2181

[zk: 127.0.0.1:2181(CONNECTED) 0] ls /brokers/ids
[1002, 1001] # two brokers
```

## Test the cluster
```bash
# scale cluster to 2 brokers (or other number)
docker service scale kafka_kafka=2

# connect to kafka leader and create a topic with --replica-factor=2
docker exec -it kafka_kafka.1.a2wd... /bin/bash

'bash-4.3:#'  /opt/kafka/bin/kafka-topics.sh --create --zookeeper zookeeper:2181 --topic test-clustered-topic --partitions 2 --replication-factor 2

Created topic "test-clustered-topic".
```

> _IMPORTANT NOTE_: If this service is tested on localhost using Kafka Java API, you must map the hostname 'kafka' to localhost in your _host_ environment file. If this step is not done you cannot connect to the Kafka broker without any error message (unless you wait the response with synchronous behaviour in producer object ```producer.send(...).get(); // wait to response ```
