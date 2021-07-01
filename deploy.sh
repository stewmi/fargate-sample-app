#!/bin/bash
set -e
stack="fargate-sample-app"
ecr_repo="<ACCOUNT_ID>.dkr.ecr.us-east-1.amazonaws.com/fargate-sample-app"
if [ -z "$1" ]; then action="create"; else action=$1; fi
docker build -t $ecr_repo:latest .
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin $ecr_repo
docker push $ecr_repo
aws cloudformation validate-template --template-body file://template.yaml
aws cloudformation $action-stack --stack-name $stack --parameters file://parameters.json --template-body file://template.yaml --capabilities CAPABILITY_NAMED_IAM
aws cloudformation wait stack-$action-complete --stack-name $stack
aws cloudformation describe-stacks --stack-name $stack
