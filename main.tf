provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami                         = "ami-02dfbd4ff395f2a1b"
  instance_type               = "t2.micro"
  user_data                   = <<-EOF
                                #!/bin/bash
                                echo "Hello, World" > index.html
                                nohup busybox httpd -f -p 8080 &
                                EOF
  user_data_replace_on_change = true

  tags = {
    Name = "example"
  }
}

resource "aws_security_group" "instance" {
  name = "terraform-example-instance"

  ingress = {
    from_port  = 8080
    to_port    = 8080
    protocol   = "tcp"
    cidr_block = ["0.0.0.0/0"]
  }
}
