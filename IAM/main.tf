# Create user
resource "aws_iam_user" "user" {
  name = "loadbalancer"
  path = "/system/"
}

# Create group
resource "aws_iam_group" "developers" {
  name = "developers"
  path = "/users/"
}
