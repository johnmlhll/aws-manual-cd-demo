# aws-manual-cd-demo
A manual deploy on a provisioned ec2 instance from Github via CloudDeploy to an AWS EC2 Instance

Manual Pipeline
---------------

This is a manual deploy pipeline demo which deploys a static webpage with no frameworks, databases nor CI features to show how simple an AWS deploy can be if your usecase is just to front end information on a service or even yourself. Like CICD pipelines, it is version controlled via appspec.yml and github revisions but manually triggered as a deployment. The CodeDeploy part of this manual pipeline has to be manually triggered, which fits a simple usecase like this static example. 

Architecture 
------------

Local Development Project -> Github Repo --> AWS CodeDeploy ---> EC2 Instance (Public URL available_ post deployment/update)

