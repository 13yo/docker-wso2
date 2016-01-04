#
# WSO2 ESB 4.9.0 + WSO2 DSS 3.5.0 + WSO2 IS 5.1.0
#
FROM java:openjdk-8-jdk
MAINTAINER Tobias Kaatz, tobias.kaatz@gmail.com

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV WSO2_ESB_VERSION wso2esb-4.9.0
ENV WSO2_DSS_VERSION wso2dss-3.5.0
ENV WSO2_IS_VERSION wso2is-5.1.0

RUN apt-get update && \
    apt-get install -y zip  && \
    apt-get clean

# copy zip from WSO2 repo folder to container
RUN wget -P /opt http://www.kaatz.eu/wso2/$WSO2_ESB_VERSION.zip && \
    unzip /opt/$WSO2_ESB_VERSION.zip -d /opt && \
    rm /opt/$WSO2_ESB_VERSION.zip && \
    wget -P /opt http://www.kaatz.eu/wso2/$WSO2_DSS_VERSION.zip && \
    unzip /opt/$WSO2_DSS_VERSION.zip -d /opt && \
    rm /opt/$WSO2_DSS_VERSION.zip && \
    wget -P /opt http://www.kaatz.eu/wso2/$WSO2_IS_VERSION.zip && \
    unzip /opt/$WSO2_IS_VERSION.zip -d /opt && \
    rm /opt/$WSO2_IS_VERSION.zip
    
# set offsets
RUN sed -i 's/<Offset>0/<Offset>1/g' /opt/wso2dss-3.5.0/repository/conf/carbon.xml && \
    sed -i 's/<Offset>0/<Offset>2/g' /opt/wso2is-5.1.0/repository/conf/carbon.xml

# EXPOSE 9443 9763 8243 8280
EXPOSE 9443 9444 9445
# ENTRYPOINT ["/opt/wso2esb-4.9.0/bin/wso2server.sh > /opt/esb.log && /opt/wso2dss-3.5.0/bin/wso2server.sh > /opt/dss.log && /opt/wso2is-5.1.0/bin/wso2server.sh > /opt/is.log"]

COPY docker-entrypoint.sh /opt/entrypoint.sh
ENTRYPOINT ["/opt/entrypoint.sh"]
