
# Create a VPC
resource "aws_vpc" "main" {
  cidr_block = "172.31.32.0/20" # Replace with your desired CIDR block

  # Set the immutable metadata tag for "purpose"
  tags = {
    immutable_metadata="{\"purpose\":\"spin-vpc\"}"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = "172.31.32.0/24" # Replace with your desired CIDR block

  # Set the immutable metadata tag for "purpose"
  tags = {
    immutable_metadata="{\"purpose\":\"spin-subnet\"}"
  }
}


# Output the VPC and Subnet IDs
output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_id" {
  value = aws_subnet.main.id
}