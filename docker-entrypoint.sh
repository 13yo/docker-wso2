#!/bin/bash
set -e

/opt/$WSO2_ESB_VERSION/bin/wso2server.sh > /tmp/esb.log 2> /tmp/esb_error.log &
/opt/$WSO2_DSS_VERSION/bin/wso2server.sh > /tmp/dss.log 2> /tmp/dss_error.log &
/opt/$WSO2_IS_VERSION/bin/wso2server.sh > /tmp/is.log 2> /tmp/is_error.log &
