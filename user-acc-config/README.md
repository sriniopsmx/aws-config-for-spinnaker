# Creating a user with correct permissions for running the terraform script

1. AWS-Account ID: Ensure that you have the AWS account ID. This is available in the AWS console on the top-right by clicking on the logged in user.
2. Create User - We use an existing user if available. Best is to create a new user (IAM->Users->Create User)
3. Create Access Key: Select "Application running outside AWS", Save the ACCESS-KEY and SECRET-KEY. We need these later.
4. Give the user created in (2) these permissions: (IAM->Users->click on on the user->Add Permissions->Inline->JSON->Copy-paste user-permissions)
  - Copy paste the contents of the file: user-policies-needed-for-terraform
  - Next, give a name, save
5. Do the same as (4) again for another set of permission in vpc-user-polices-for-terraform


## For ECS Deployments
Use instructions from (4) above and give ROL-Spinnaker-Managed-Role the permissions in ecs-policies-for-deployment
Test is using "Create Server Group" button by filling the following:
![Screenshot 2024-08-14 at 12 59 49 PM](https://github.com/user-attachments/assets/8fb26d9e-f327-4e2c-9a74-0ba78f6f4e44)
![Screenshot 2024-08-14 at 1 00 14 PM](https://github.com/user-attachments/assets/b4b3b70b-6fba-4dd8-9276-c3de960bace7)
![Screenshot 2024-08-14 at 1 01 25 PM](https://github.com/user-attachments/assets/1bd4f1d7-2c77-4319-ad2d-dc1c327d3793)
