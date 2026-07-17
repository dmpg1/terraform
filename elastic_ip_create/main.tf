resource "aws_eip" "lb" {
  instance = aws_instance.web.id # Associate with instance 
  domain   = "vpc"

  tags = {
    Name = "example"
  }
}