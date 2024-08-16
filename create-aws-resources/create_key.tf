resource "aws_key_pair" "key_pair" {
  key_name = "spin_ec2_key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICHBsc2ftsvRvpSem7ZlFHOkYOMGWVOljZfYmdOQ0HVm srinivas@opsmx.io"
}


# Output the public key
output "public_key" {
  value = aws_key_pair.key_pair.key_pair_id
}

# Output the private key
output "private_key" {
  value = aws_key_pair.key_pair.key_pair_id
}

# Output the key pair name
output "key_pair_name" {
  value = aws_key_pair.key_pair.key_name
}

