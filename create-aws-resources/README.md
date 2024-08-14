# Create AWS resources required for Spinnaker

- Resouce creation is done via a terraform script. If you don't have terraform installed on your laptop, please install it by following the instructions https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli.
- The terraform script must be executed using credentials of a user with certain permissions. See the folder user-acc-config for the instrucsions.
- It creates a user(**ROL-Spinnaker-Managing-User**), role(**ROL-Spinnaker-Managed-Role**) and Policy(**spinnaker_non_eks_policy**) for Spinnaker to use AWS resources. 

1. Edit terraform script: Serach and replace YOUR-ACCOUNT-ID with your AWS account ID
2. Execute terraform script by following these steps:
- export AWS_ACCESS_KEY_ID="YOUR-ACCESS_KEY"  # terraform takes the AWS credentials from these two parameters.
- export AWS_SECRET_ACCESS_KEY="YOUR-SECRET-ACCESS_KEY"
- terraform init
- terraform plan
- terraform apply # type yes
