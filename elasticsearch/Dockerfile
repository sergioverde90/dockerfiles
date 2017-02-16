FROM openjdk:8

ENV VERSION 2.4.1
ENV INSTALL_DIR /usr/share

RUN useradd -G sudo elasticsearch

WORKDIR ${INSTALL_DIR}

# get elasticsearch and unzip
RUN apt-get install -y wget \
	&& wget https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-${VERSION}.tar.gz \
	# set permision over unzeip folder.// TODO Change this for permission over elasticsearch user in root group
	&& tar -xvf elasticsearch-${VERSION}.tar.gz \
	&& rm -fr elasticsearch-${VERSION}.tar.gz \
	&& mv ./elasticsearch-${VERSION} ${INSTALL_DIR}/elasticsearch \ 
	&& chmod -R 777 ${INSTALL_DIR}
	
COPY elasticsearch.yml ${INSTALL_DIR}/elasticsearch/config
USER elasticsearch

ENTRYPOINT ${INSTALL_DIR}/elasticsearch/bin/elasticsearch

EXPOSE 9200 9300