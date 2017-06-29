FROM ubuntu:14.04

ENV HADOOP_HOME=/hadoop-2.7.1
ENV PATH=$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin

RUN apt-get update  \ 
	&& apt-get install -y wget ssh rsync openjdk-7-jdk \
	&& wget apache.uvigo.es/hadoop/common/hadoop-2.7.1/hadoop-2.7.1.tar.gz \
	&& tar -vzxf hadoop-2.7.1.tar.gz

ENV JAVA_HOME=/usr/lib/jvm/java-1.7.0-openjdk-amd64/
	
# install ssh key
RUN ssh-keygen -q -t dsa -P '' -f ~/.ssh/id_dsa \
&& cat ~/.ssh/id_dsa.pub >> ~/.ssh/authorized_keys

COPY config/docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod 777 /docker-entrypoint.sh

COPY config/ssh_config /root/.ssh/config
RUN chmod 600 /root/.ssh/config

CMD /docker-entrypoint.sh
