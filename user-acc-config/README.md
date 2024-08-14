# Creating a user with correct permissions for running the terraform script

1. AWS-Account ID: Ensure that you have the AWS account ID. This is available in the AWS console on the top-right by clicking on the logged in user.
2. Create User - We use an existing user if available. Best is to create a new user (IAM->Users->Create User)
3. Create Access Key: Select "Application running outside AWS", Save the ACCESS-KEY and SECRET-KEY. We need these later.
4. Give the user created in (2) these permissions: (IAM->Users->click on on the user->Add Permissions->Inline->JSON->Copy-paste user-permissions)
  - Copy paste the contents of the file: user-policies-needed-for-terraform
