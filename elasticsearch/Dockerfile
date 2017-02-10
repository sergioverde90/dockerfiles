FROM openjdk:8

ENV VERSION 2.4.1
ENV INSTALL_DIR /home/elasticsearch

RUN useradd -G sudo elasticsearch

WORKDIR ${INSTALL_DIR}

# get elasticsearch and unzip
RUN apt-get install -y wget \
	&& wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-${VERSION}.tar.gz \
	# set permision over unzeip folder.// TODO Change this for permission over elasticsearch user in root group
	&& tar -xvf elasticsearch-${VERSION}.tar.gz \
	&& chmod -R 777 ${INSTALL_DIR}
	
COPY elasticsearch.yml elasticsearch-${VERSION}/config
USER elasticsearch

ENTRYPOINT ${INSTALL_DIR}/elasticsearch-${VERSION}/bin/elasticsearch

EXPOSE 9200 9300