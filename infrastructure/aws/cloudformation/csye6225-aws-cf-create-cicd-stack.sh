#!/bin/sh
#shell script to create AWS cicd infrastructures
echo " "
echo "---Creating AWS ci/cd infrastructure---"
echo " "
echo "Enter the name for stack"
read stack_name
echo "Enter the Name for S3 bucket [xxxyyyy]"
read bucket_name
echo "Enter your Account Id"
read account_id
create_stack=$(aws cloudformation create-stack --stack-name $stack_name --template-body file://csye6225-cf-cicd.json --capabilities CAPABILITY_NAMED_IAM --parameters ParameterKey=S3BucketName,ParameterValue=$bucket_name ParameterKey=AccountId,ParameterValue=$account_id)
if [ $? -eq 0 ]; then
  echo "Creating Stack ${stack_name} "
  aws cloudformation wait stack-create-complete --stack-name $stack_name
  echo "Stack created successfully"
else
  echo "Failure while creating stack"
fi