#!/bin/sh
# Note: I've written this using sh so it works in the busybox container too

# USE the trap if you need to also do manual cleanup after the service is stopped,
#     or need to start multiple services in the one container
trap "echo TRAPed signal" HUP INT QUIT KILL TERM

/opt/$WSO2_ESB_VERSION/bin/wso2server.sh > /tmp/esb.log 2> /tmp/esb_error.log &
/opt/$WSO2_DSS_VERSION/bin/wso2server.sh > /tmp/dss.log 2> /tmp/dss_error.log &
/opt/$WSO2_IS_VERSION/bin/wso2server.sh > /tmp/is.log 2> /tmp/is_error.log &

echo "[hit enter key to exit] or run 'docker stop <container>'"
read

echo "stoping esb ... "
cat /opt/$WSO2_ESB_VERSION/wso2carbon.pid > kill
echo "stoping dss ... "
cat /opt/$WSO2_DSS_VERSION/wso2carbon.pid > kill
echo "stoping is ... "
cat /opt/$WSO2_IS_VERSION/wso2carbon.pid > kill

echo "exited $0"
