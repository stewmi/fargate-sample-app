# Fargate Web Application

A Sample repository to deploy a web application on ECS Fargate

## Configuration Details

Ask AES to run the cfn/iam-template.yaml file and name it appropriately

`aws cloudformation create-stack --stack-name sample-app-iam --capabilities CAPABILITY_NAMED_IAM --template-body file://cfn/iam-template.yaml`

## Deployment Details

1. Create your ECR Repo
`aws ecr create-repository --repository-name "fargate-sample-app"`
2. Update deploy.sh with new ECR repo name
`docker build -t <ecr_repo_url>:latest .`
3. Update the parameters.json file with the image
4. run the CloudFormation Template
`chmod a+x deploy.sh`
`./deploy.sh create`