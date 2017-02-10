FROM airhacks/java
MAINTAINER Adam Bien, adam-bien.com
ENV PAYARA_ARCHIVE payara41
ENV DOMAIN_NAME domain1
ENV INSTALL_DIR /opt
RUN curl -o ${INSTALL_DIR}/${PAYARA_ARCHIVE}.zip -L https://s3-eu-west-1.amazonaws.com/payara.fish/Payara+Downloads/Payara+4.1.1.164/payara-4.1.1.164.zip
RUN unzip ${INSTALL_DIR}/${PAYARA_ARCHIVE}.zip -d /opt
ENV PAYARA_HOME ${INSTALL_DIR}/payara41/glassfish
ENV EXEC ${PAYARA_HOME}/bin
ENV MONITORING_LEVEL HIGH
ENV ADMIN_PASSWORD admin
ENV DEPLOYMENT_DIR ${PAYARA_HOME}/domains/${DOMAIN_NAME}/autodeploy/
WORKDIR /opt/payara41/glassfish/bin
RUN asadmin start-domain ${DOMAIN_NAME} && \
    echo "AS_ADMIN_PASSWORD=" > payarapwd && \
    echo "AS_ADMIN_NEWPASSWORD=${ADMIN_PASSWORD}" >> payarapwd  && \
    cat payarapwd  && \
    asadmin --user=admin --passwordfile=payarapwd change-admin-password && \
    echo "AS_ADMIN_PASSWORD=${ADMIN_PASSWORD}" > payarapwd && \
    asadmin --passwordfile=payarapwd enable-secure-admin && \
    asadmin --passwordfile=payarapwd set server.monitoring-service.monitoring-enabled=true
asadmin stop-domain ${DOMAIN_NAME}
ENTRYPOINT asadmin start-domain --verbose ${DOMAIN_NAME}
EXPOSE 4848 8009 8080 8181