#
# WSO2 ESB 4.9.0 + WSO2 DSS 3.5.0 + WSO2 IS 5.1.0
#
FROM java:openjdk-8-jdk
MAINTAINER Tobias Kaatz, tobias.kaatz@gmail.com

RUN apt-get update && \
    apt-get install -y zip  && \
    apt-get clean

# copy zip from WSO2 repo folder to container
RUN wget -P /opt http://www.kaatz.eu/wso2/wso2esb-4.9.0.zip && \
    unzip /opt/wso2esb-4.9.0.zip -d /opt && \
    rm /opt/wso2esb-4.9.0.zip && \
    wget -P /opt http://www.kaatz.eu/wso2/wso2dss-3.5.0.zip && \
    unzip /opt/wso2dss-3.5.0.zip -d /opt && \
    rm /opt/wso2dss-3.5.0.zip && \
    wget -P /opt http://www.kaatz.eu/wso2/wso2is-5.1.0.zip && \
    unzip /opt/wso2is-5.1.0.zip -d /opt && \
    rm /opt/wso2is-5.1.0.zip
    
# set offsets
RUN sed -i 's/<Offset>0/<Offset>1/g' /opt/wso2dss-3.5.0/repository/conf/carbon.xml && \
    sed -i 's/<Offset>0/<Offset>2/g' /opt/wso2is-5.1.0/repository/conf/carbon.xml
    
    #sudo mysqladmin -u root -h localhost password 'mypassword'  needed
    

# EXPOSE 9443 9763 8243 8280
EXPOSE 9443 9444 9445
# ENTRYPOINT ["/opt/wso2esb-4.9.0/bin/wso2server.sh > /opt/esb.log && /opt/wso2dss-3.5.0/bin/wso2server.sh > /opt/dss.log && /opt/wso2is-5.1.0/bin/wso2server.sh > /opt/is.log"]
