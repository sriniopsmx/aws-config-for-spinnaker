# Configure Spinnaker for AWS account

The config-spin.sh contains the commands for configuring spinnaker using halyard.

- Note1: ERROR in logs: ```Unable to retrieve the requested metadata (/latest/dynamic/instance-identity/document). Failed to connect to service endpoint:``` is NORMAL for Spinnaker running outside of AWS cluster.
- Note2: Please delete any AWS account previously configured from .hal/configure

Steps:
1. Edit the script to update the ACCOUNT-ID and ACCESS-KEY
2. Copy the script inside the halyard in the /tmp folder
4. chmod +x config-spin.sh
5. execute: ```./config-spin.sh```
6. The script prompts for the AWS-SECRET-KEY 2 times. Please entire it.


Check if the account configuration is successful:
1. tail logs of clouddriver (or clouddriver-caching if HA) to see that the AWS account shows up

Once everything is successful, "aws-account" should show up in Spinnaker. Easy way to test:
- Open any applcation in Spinnaker -> Config -> Enable AWS (if this is visible, we are good)
- Go to Cluster tab in Spinnaker, "Create Server Group"
- An alternative is also to check the "<ISD-Base>/gate/credentials" endpoint to see that "aws-account" is present and enabled is "true"
