FROM openjdk:8

# RUN apk update && apk add wget tar bash

# download zookeeper
RUN wget http://apache.rediris.es/zookeeper/stable/zookeeper-3.4.10.tar.gz && mkdir /zookeeper
RUN  tar -vxzf zookeeper-3.4.10.tar.gz -C /zookeeper
RUN mv /zookeeper/zookeeper-3.4.10/* /zookeeper && rm -fr /zookeeper/zookeeper-3.4.10 && rm zookeeper-3.4.10.tar.gz

# start zookeeper
EXPOSE 2181

COPY zoo.cfg /zookeeper/conf/zoo.cfg

# CMD /zookeeper/bin/zkServer.sh start

ENTRYPOINT ["/zookeeper/bin/zkServer.sh"]
CMD ["start-foreground"]