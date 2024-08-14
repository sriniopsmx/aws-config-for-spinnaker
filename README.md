# Instructions for configuring AWS resources and NON-EKS Spinnaker AWS account

- Note: this is for Spinnaker that is NOT running in AWS/EKS.

The process involves the following, instructions are in each of the folders:
- **user-acc-config**: Creating a User with the correct permissions to run a terraform script that creates another user, role and policy
- **create-aws-resources**: Running the terraform script
- **hal-config**: Running a shell script inside the halyard pod


TODO:
- Done: Create VPC with Tags 
- Done: Configure Spinnaker ECS account
- Manual: Create ECS Cluster
- Instructions for running sample EC2 pipeline
- Instructions for running sample ECS deployment

