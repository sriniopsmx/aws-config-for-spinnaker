
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

# Create a Default Security Group
resource "aws_security_group" "default" {
  name   = "spin-security-group"
  vpc_id = aws_vpc.main.id

  # Allow inbound traffic from anywhere on port 22 (SSH)
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow outbound traffic to anywhere
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Set the immutable metadata tag for "purpose"
  tags = {
    immutable_metadata="{\"purpose\":\"spin-security-group\"}"
  }
}

# Output the VPC, Subnet, and Security Group IDs
output "vpc_id" {
  value = aws_vpc.main.id
}

output "subnet_id" {
  value = aws_subnet.main.id
}

output "security_group_id" {
  value = aws_security_group.default.id
}


