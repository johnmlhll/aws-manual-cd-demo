#!/bin/bash

SERVER_PATH=$1
BUCKETNAME=$2
REGION_ID=$3
PACKAGE_MANAGER=$4
CODEDEPLOY_BIN="/opt/codedeploy-agent/bin/codedeploy-agent"

if [ $# == 4 ] && [[ $PACKAGE_MANAGER == "yum" ]]; then
    sudo yum update;
    sudo yum install -y https://s3.$REGION_ID.amazonaws.com/amazon-ssm-$REGION_ID/latest/linux_amd64/amazon-ssm-agent.rpm
    sudo yum install ruby && sudo yum install wget;
    sleep 3;
    cd $SERVER_PATH
    $CODEDEPLOY_BIN stop
    yum erase codedeploy-agent -y;
    sleep 3;
    wget https://$BUCKETNAME.s3.$REGION_ID.amazonaws.com/latest/install;
    sleep 3;
    sudo chmod +x ./install;
    sudo ./install auto;
    sleep 5; 
    sudo service codedeploy-agent start;
    sleep 2;
    sudo service codedeploy-agent status;
else
    echo "Sorry, wrong argument count of $# provided or wrong package manager $PACKAGE_MANGER provided..."
fi

# Notes: ONLY good for Amazon Linux 2/Fedora instances amd64. Script can be augmented for other Linux ami/distros
# typical call for this script: 
# [ec2-user@ip-172-31-27-18 ~]$ ./install_codedeploy_agent.sh /home/ec2-user aws-codedeploy-eu-west-1 eu-west-1 yum