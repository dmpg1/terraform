resource "aws_instance" "name" {
  ami = "ami-01edba92f9036f76e"
  instance_type = "t2.micro"
  vpc_security_group_ids = [ "sg id there" ]
}

# Create AMI from the above EC2 instance 
resource "aws_ami_from_instance" "name" {
    name = "datacenter-ec2-ami"
    source_instance_id = aws_instance.name.id
  }