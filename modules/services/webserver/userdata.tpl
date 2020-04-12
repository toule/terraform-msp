#!/bin/sh

sudo yum -y upgrade
sudo yum -y update
sudo yum install -y ec2-instance-connect

sudo amazon-linux-extras install -y nginx1.12
sudo service nginx start

cd /home/ec2-user
sudo yum install -y ruby
wget https://aws-codedeploy-ap-northeast-2.s3.ap-northeast-2.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto

sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
sudo service amazon-ssm-agent start