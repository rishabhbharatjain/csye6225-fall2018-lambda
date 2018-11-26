echo " "
echo "---Terminating AWS WAF infrastructure---"
echo " "
echo "Enter the name for stack"
read stack_name
delete_stack=$(aws cloudformation delete-stack --stack-name $stack_name)
if [ $? -eq 0 ]; then
  echo "Creating Stack ${stack_name} "
  aws cloudformation wait stack-delete-complete --stack-name $stack_name
  echo "Stack deleted successfully"
else
  echo "Failure while deleting stack"
fi
