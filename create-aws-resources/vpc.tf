
# Configure AWS Provider with your credentials
#provider "aws" {
#  region = "us-east-1" # Replace with your desired region
#}

# Create a VPC
resource "aws_vpc" "main" {
  cidr_block = "172.31.32.0/20" # "10.0.0.0/16" # Replace with your desired CIDR block

  # Set the immutable metadata tag for "purpose"
  tags = {
    immutable_metadata="{\"purpose\":\"spin-vpc\"}"
  }
}

# Output the VPC ID
output "vpc_id" {
  value = aws_vpc.main.id
}
