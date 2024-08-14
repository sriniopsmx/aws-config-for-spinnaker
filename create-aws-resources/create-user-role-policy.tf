# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}


# Configure AWS IAM Policies

resource "aws_iam_policy" "spinnaker_non_eks_policy" {
  name   = "spinnaker_non_eks_policy"
  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": [
          "iam:RemoveRoleFromInstanceProfile",
          "iam:AddRoleToInstanceProfile",
          "iam:DetachRolePolicy",
          "iam:DeleteInstanceProfile",
          "iam:AttachRolePolicy",
          "iam:CreateInstanceProfile",
          "iam:DeletePolicy",
          "iam:ListInstanceProfiles",
          "iam:CreatePolicy",
          "iam:CreateServiceLinkedRole",
          "iam:PassRole",
          "iam:CreateInstanceProfile"
        ],
        "Resource": "*",
        "Effect": "Allow",
        "Sid": "IAMPermissions"
      },
      {
        "Action": [
          "kms:Encrypt",
          "kms:Decrypt",
          "kms:ReEncrypt*",
          "kms:GenerateDataKey*"
        ],
        "Resource": "*",
        "Effect": "Allow",
        "Sid": "KMSPermissions"
      },
      {
        "Action": [
          "cloudwatch:PutMetricAlarm",
          "cloudwatch:DeleteAlarms"
        ],
        "Resource": "*",
        "Effect": "Allow",
        "Sid": "CloudWatchPermissions"
      },
      {
        "Action": [
          "ec2:*",
          "ec2:Describe*",
          "ec2:CreateKeyPair",
          "elasticloadbalancing:*",
          "autoscaling:*",
          "s3:*",
          "eks:*",
          "dynamodb:*",
          "elasticache:*",
          "ecs:*",
          "lambda:*",
          "cloudwatch:*"
        ],
        "Resource": "*",
        "Effect": "Allow",
        "Sid": "FullPermissions"
      },
      {
        "Action": [
          "ec2:AcceptVpc*",
          "ec2:AssociateDhcpOptions",
          "ec2:AssociateRouteTable",
          "ec2:AssociateSubnetCidrBlock",
          "ec2:AssociateVpcCidrBlock",
          "ec2:AttachClassicLinkVpc",
          "ec2:AttachInternetGateway",
          "ec2:AttachNetworkInterface",
          "ec2:AttachVpnGateway",
          "ec2:CreateCustomerGateway",
          "ec2:CreateDefaultSubnet",
          "ec2:CreateDefaultVpc",
          "ec2:CreateDhcpOptions",
          "ec2:CreateEgressOnlyInternetGateway",
          "ec2:CreateFlowLogs",
          "ec2:CreateInternetGateway",
          "ec2:CreateNatGateway",
          "ec2:CreateNetworkAcl",
          "ec2:CreateNetworkAclEntry",
          "ec2:CreateNetworkInterface",
          "ec2:CreateNetworkInterfacePermission",
          "ec2:CreateRoute",
          "ec2:CreateRouteTable",
          "ec2:CreateSubnet",
          "ec2:CreateVp*",
          "ec2:DeleteCustomerGateway",
          "ec2:DeleteDhcpOptions",
          "ec2:DeleteEgressOnlyInternetGateway",
          "ec2:DeleteFlowLogs",
          "ec2:DeleteInternetGateway",
          "ec2:DeleteNatGateway",
          "ec2:DeleteNetwork*",
          "ec2:DeleteRo*",
          "ec2:DeleteSubnet",
          "ec2:DeleteVp*",
          "ec2:DetachClassicLinkVpc",
          "ec2:DetachInternetGateway",
          "ec2:DetachNetworkInterface",
          "ec2:DetachVpnGateway",
          "ec2:DisableVgwRoutePropagation",
          "ec2:DisableVpcClassicLink",
          "ec2:DisableVpcClassicLinkDnsSupport",
          "ec2:DisassociateAddress",
          "ec2:DisassociateRouteTable",
          "ec2:DisassociateSubnetCidrBlock",
          "ec2:DisassociateVpcCidrBlock",
          "ec2:EnableVgwRoutePropagation",
          "ec2:EnableVpcClassicLink",
          "ec2:EnableVpcClassicLinkDnsSupport",
          "ec2:ModifyNetworkInterfaceAttribute",
          "ec2:ModifySubnetAttribute",
          "ec2:ModifyVpc*",
          "ec2:MoveAddressToVpc",
          "ec2:RejectVpc*",
          "ec2:ReplaceNetwork*",
          "ec2:ReplaceRoute",
          "ec2:ReplaceRouteTableAssociation",
          "ec2:ResetNetworkInterfaceAttribute",
          "ec2:RestoreAddressToClassic"
        ],
        "Resource": "*",
        "Effect": "Deny",
        "Sid": "VPCDenyPermissions"
      },
      {
        "Action": "sts:AssumeRole",
        "Resource": [
          "arn:aws:iam::YOUR-ACCOUNT-ID:role/ROL-Spinnaker-Managed-Role"
        ],
        "Effect": "Allow"
      }
    ]
  })
}

# Configure AWS IAM User

resource "aws_iam_user" "spinnaker_managing_user" {
  name = "ROL-Spinnaker-Managing-User"
}

resource "aws_iam_user_policy_attachment" "spinnaker_managing_user_policy" {
  user   = aws_iam_user.spinnaker_managing_user.name
  policy_arn = aws_iam_policy.spinnaker_non_eks_policy.arn
}

# Configure AWS IAM Role

resource "aws_iam_role" "spinnaker_managed_role" {
  name = "ROL-Spinnaker-Managed-Role"
  assume_role_policy = jsonencode({
    "Version": "2008-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Principal": {
          "AWS": "arn:aws:iam::YOUR-ACCOUNT-ID:user/ROL-Spinnaker-Managing-User"
        },
        "Action": "sts:AssumeRole"
      },
      {
        "Effect": "Allow",
        "Principal": {
          "Service": [
            "ecs-tasks.amazonaws.com",
            "ecs.amazonaws.com",
            "application-autoscaling.amazonaws.com",
            "lambda.amazonaws.com",
            "ecs.application-autoscaling.amazonaws.com"
          ]
        },
        "Action": "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "spinnaker_managed_role_policy" {
  role   = aws_iam_role.spinnaker_managed_role.name
  policy_arn = aws_iam_policy.spinnaker_non_eks_policy.arn
}

resource "aws_iam_role_policy_attachment" "spinnaker_managed_role_readonly_access" {
  role   = aws_iam_role.spinnaker_managed_role.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_role_policy_attachment" "spinnaker_managed_role_iam_readonly_access" {
  role   = aws_iam_role.spinnaker_managed_role.name
  policy_arn = "arn:aws:iam::aws:policy/IAMReadOnlyAccess"
}

# Configure AWS Cloud Provider for Spinnaker (Requires user input for secret key)

data "aws_region" "current" {
  
}

# Output the user ARN
output "spinnaker_managing_user_arn" {
  value = aws_iam_user.spinnaker_managing_user.arn
}
