# Configure Spinnaker for AWS account

The config-spin.sh contains the commands for configuring spinnaker using halyard.

Steps:
1. Edit the script to update the ACCOUNT-ID and ACCESS-KEY
2. Copy the script inside the halyard in the /tmp folder
4. chmod +x config-spin.sh
5. execute: ```./config-spin.sh```
6. The script prompts for the AWS-SECRET-KEY 2 times. Please entire it.


Check if the account configuration is successful:
1. tail logs of clouddriver (or clouddriver-caching if HA) to see that the AWS account shows up

NOTE: ```Unable to retrieve the requested metadata (/latest/dynamic/instance-identity/document). Failed to connect to service endpoint:``` is NORMAL for Spinnaker running outside of AWS cluster.
