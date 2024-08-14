# Instructions for configuring AWS resources and Spinnaker AWS account
The process involves the following, instructions are in each of the folders:
- **user-acc-config**: Creating a User with the correct permissions to run a terraform script that creates another user, role and policy
- **create-aws-resources**: Running the terraform script
- **hal-config**: Running a shell script inside the halyard pod


TODO:
- Create VPC with Tags - some files are there and they might interfere with account creation. Delete vpc.tf.
- Create ECS Cluster
- Configure Spinnaker ECS account

