a) AWS-Account ID
b) create User  
c) Create Access Key: Select "Application running outside AWS"
c) Give the user in (b) permissions: Add Permissions->Inline->JSON->Copy-paste user-permis*
d) Edit terraform script: Replace YOUR-ACCOUNT-ID with your account ID
e) run terraform script
export AWS_ACCESS_KEY_ID="YOUR-ACCESS_KEY"
export AWS_SECRET_ACCESS_KEY="YOUR-SECRET-ACCESS_KEY"
terraform init
terraform plan
terraform apply # type yes
e) Check if the resources are created: User: ROL-Spinnaker-Managing-User, Policy: spinnaker_non_eks_policy , Role: ROL-Spinnaker-Managed-Role
f) Trust -??? - Create accessKey and Secret key for ROL-Spinnaker-Managing-User
h) Configure Spinnaker using accessKey and Secret Key for ROL-Spinnaker-Managing-User


TODO:
- Create VPC
- Add Tags to VPC
- Create ECS Cluster
- Configure Spinnaker ECS account

