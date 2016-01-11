#!/bin/bash

# USE the trap if you need to also do manual cleanup after the service is stopped,
#     or need to start multiple services in the one container
# trap "echo TRAPed signal" HUP INT QUIT KILL TERM

/opt/$WSO2_ESB_VERSION/bin/wso2server.sh > /tmp/esb.log 2> /tmp/esb_error.log &
/opt/$WSO2_DSS_VERSION/bin/wso2server.sh > /tmp/dss.log 2> /tmp/dss_error.log &
/opt/$WSO2_IS_VERSION/bin/wso2server.sh > /tmp/is.log 2> /tmp/is_error.log &

echo "[hit enter key to exit] or run 'docker stop <container>'"
read _

echo "stoping esb ... "
/opt/$WSO2_ESB_VERSION/bin/wso2server.sh stop
echo "stoping dss ... "
/opt/$WSO2_DSS_VERSION/bin/wso2server.sh stop
echo "stoping is ... "
/opt/$WSO2_IS_VERSION/bin/wso2server.sh stop

echo "exited $0"
