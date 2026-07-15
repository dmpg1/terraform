# Generate a new RSA key pair 
resource "tls_private_key" "my_key_pair" {
  algorithm = "RSA"
  rsa_bits = 4096
}

# Create the key pair in AWS
resource "aws_key_pair" "my_key_pub" {
  key_name = "my_kp"
  public_key = tls_private_key.my_key_pair.public_key_openssh
}

resource "local_file" "my_prvt_key" {
  content = tls_private_key.my_key_pair.private_key_pem
  filename = "./my_prvt_key.pem"
}