docker-compose with two services:

* kafka (image based on: [wurstmeister/kafka-docker](https://github.com/wurstmeister/kafka-docker))
* zookeeper (image based on [Dockerhub zookeeper](https://hub.docker.com/_/zookeeper/)) 

# HOW TO RUN
```bash
docker-compose up
```

> _IMPORTANT NOTE_: If this service is tested on localhost using Kafka Java API, you must map the hostname 'kafka' to localhost in your _host_ environment file. If this step is not done you cannot connect to the Kafka broker without any error message (unless you wait the response with synchronous behaviour in producer object ```producer.send(...).get(); // wait to response ```
