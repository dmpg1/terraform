# Generate a new RSA key pair 
resource "tls_private_key" "my_key_pair" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create the key pair in AWS
resource "aws_key_pair" "my_key_pub" {
  key_name   = "my_kp"
  public_key = tls_private_key.my_key_pair.public_key_openssh
}

# Fetch the default security group data source
data "aws_security_group" "default" {
  name = "default"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical (официальный владелец Ubuntu AMI)
}

# Provision the EC2 instance with all requierements
resource "aws_instance" "my_instance" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t2.micro"
  key_name      = aws_key_pair.my_key_pub.key_name

  # Attach the default security group
  vpc_security_group_ids = [data.aws_security_group.default.id]

  tags = {
    Nmae = "my_instance"
  }
}

