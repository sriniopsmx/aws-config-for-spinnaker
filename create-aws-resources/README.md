# Create AWS resources required for Spinnaker

- Resouce creation is done via a terraform script. If you don't have terraform installed on your laptop, please install it by following the instructions https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli.
- The terraform script must be executed using credentials of a user with certain permissions. See the folder user-acc-config for the instrucsions.
- It creates a user(**ROL-Spinnaker-Managing-User**), role(**ROL-Spinnaker-Managed-Role**) and Policy(**spinnaker_non_eks_policy**) for Spinnaker to use AWS resources. 

1. cd <this folder>  # terraform needs it
2. Edit create-user-role-policy.tf : Serach and replace YOUR-ACCOUNT-ID with your AWS account ID
3. Edit vpc.tf: Edit the CIDR (172.31.32.0/20 and 24) [ I matched it with one of the existing subnets in AWS ]
4. Execute terraform script by following these steps:
- export AWS_ACCESS_KEY_ID="YOUR-ACCESS_KEY"  # terraform takes the AWS credentials from these two parameters.
- export AWS_SECRET_ACCESS_KEY="YOUR-SECRET-ACCESS_KEY"
- terraform init  # Initialize
- terraform plan  # Check for any errors
- terraform apply # Create resourcestype yes


If required, to delete the resources created
- terraform destroy
