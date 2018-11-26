echo " "
echo "---Creating AWS WAF infrastructure---"
echo " "
echo "Enter the name for stack"
read stack_name
echo "Enter the LoadBalancer ARN"
read loabbalancerArn
create_stack=$(aws cloudformation create-stack --stack-name $stack_name --template-body file://csye6225-cf-waf.json --capabilities CAPABILITY_NAMED_IAM --parameters ParameterKey=LoadBalancerArnNo,ParameterValue=$loabbalancerArn )
if [ $? -eq 0 ]; then
  echo "Creating Stack ${stack_name} "
  aws cloudformation wait stack-create-complete --stack-name $stack_name
  echo "Stack created successfully"
else
  echo "Failure while creating stack"
fi
