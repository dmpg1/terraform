resource "aws_ebs_volume" "my_volume" {
  type              = "gp3"
  size              = 2
  availability_zone = "us-east-1a"

  tags = {
    Name = "my_volume"
  }

}

resource "aws_ebs_snapshot" "new_sn" {
  volume_id   = aws_ebs_volume.my_volume.id
  description = "your description here"

  tags = {
    Name = "new_sn"
  }
}