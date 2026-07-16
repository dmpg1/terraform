provider "aws" {
  region = "us-east-1"
}

# Fetch the Default VPC ID dinamically
data "aws_vpc" "default" {
  default = true
}

# Create the Custom Security Group under Default VPC
resource "aws_security_group" "custom_sg" {
  name        = "my-default-vpc-sg"
  description = "..............."
  vpc_id      = data.aws_vpc.default.id # References the data block above

  # Inbound Rule Allow: SSH
  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # Inbound Rule Allow: HTTP
  ingress {
    description = "Allow HTTP traffic"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  # Outbound Rule: Allow all traffic
  egress = {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1" # Semantically equivalent to all protocols
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "my-default-vpc-sg"
  }
}