# VPC 
resource "aws_vpc" "vpc_name" {
  cidr_block = "10.0.0.0/16"
  assign_generated_ipv6_cidr_block = true 

  tags = {
    Name = "vpc_name"
  }
}