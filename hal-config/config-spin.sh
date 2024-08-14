# Edit these two lines and run this script INSIDE the halyard
# Script will prompt for the secret-key 2 times, enter it on the screen

export ACCOUNT_ID=YOUR-ACCOUNT-ID
export ACCESS_KEY_ID=YOUR-ACCESS-KEY

# Change this if you want.
export AWS_ACCOUNT_NAME="aws-acc"
export ROLE_NAME=role/ROL-Spinnaker-Managed-Role

hal config provider aws account add ${AWS_ACCOUNT_NAME} --account-id ${ACCOUNT_ID} --assume-role ${ROLE_NAME}  --regions us-east-1

hal config provider aws edit --access-key-id ${ACCESS_KEY_ID}  --secret-access-key
hal config provider aws bakery edit --aws-access-key ${ACCESS_KEY_ID} --aws-secret-key

hal config provider ecs account add ecs-acc --aws-account aws-acc

hal config provider aws enable
hal config provider ecs enable

hal deploy apply
