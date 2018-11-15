#!/bin/bash
echo "Updating Lambda Function"
aws lambda update-function-code --function-name SNSTopicName --region us-east-1 --s3-bucket $s3_bucket_lambda --s3-key lambda-deploy.zip
echo "Update complete"

sudo systemctl stop tomcat.service

sudo rm -rf /opt/tomcat/webapps/docs  /opt/tomcat/webapps/examples /opt/tomcat/webapps/host-manager  /opt/tomcat/webapps/manager /opt/tomcat/webapps/ROOT

sudo chown tomcat:tomcat /opt/tomcat/webapps/ROOT.war

# cleanup log files
sudo rm -rf /opt/tomcat/logs/catalina*
sudo rm -rf /opt/tomcat/logs/*.log
sudo rm -rf /opt/tomcat/logs/*.txt
