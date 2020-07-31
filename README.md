# Fargate Web Application

A Sample repository to deploy a web application on ECS Fargate

## Deployment Details

1. Create your ECR Repo
`aws ecr create-repository --repository-name "fargate-sample-app"`
2. Update deploy.sh with new ECR repo name
`docker build -t <ecr_repo_url>:latest .`
3. Update the parameters.json file with the image
4. run the CloudFormation Template
`chmod a+x deploy.sh`
`./deploy.sh create`