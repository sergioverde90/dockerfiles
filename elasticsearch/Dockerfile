FROM openjdk:8

ENV VERSION 2.4.1
ENV INSTALL_DIR /home/elasticsearch

RUN useradd -G sudo elasticsearch

WORKDIR ${INSTALL_DIR}

COPY elasticsearch-${VERSION}.zip ${INSTALL_DIR}

# get elasticsearch and unzip
RUN apt-get install unzip \
	&& unzip elasticsearch-${VERSION}.zip -d ${INSTALL_DIR} \
	# set permision over unzeip folder.// TODO Change this for permission over elasticsearch user in root group
	&& chmod -R 777 ${INSTALL_DIR}
	
COPY elasticsearch.yml elasticsearch-${VERSION}/config
USER elasticsearch

ENTRYPOINT ${INSTALL_DIR}/elasticsearch-${VERSION}/bin/elasticsearch
